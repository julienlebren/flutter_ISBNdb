#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${REPO_ROOT}"

REFERENCE_FILE="api/upstream/isbndb-openapi.json"
SOURCE_URL="${ISBNDB_OPENAPI_SOURCE_URL:-}"
SOURCE_FILE=""
WRITE_FETCHED=""
WRITE_REPORT=""

usage() {
  cat <<'USAGE'
Usage: scripts/check_api_spec_changes.sh [options]

Options:
  --reference <path>      Reference OpenAPI snapshot (default: api/upstream/isbndb-openapi.json)
  --source-url <url>      OpenAPI source URL to compare against
  --source-file <path>    Local OpenAPI file to compare against
  --write-fetched <path>  Persist fetched source JSON to this path
  --write-report <path>   Persist the Markdown drift report to this path
  -h, --help              Show help

Environment:
  ISBNDB_OPENAPI_SOURCE_URL  Default URL when --source-url is not provided

Exit codes:
  0  No drift (or source not configured)
  2  Drift detected
  1  Invalid input/runtime error
USAGE
}

fail() {
  echo "Error: $1" >&2
  exit 1
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --reference)
        [[ $# -ge 2 ]] || fail "Missing value for --reference"
        REFERENCE_FILE="$2"
        shift 2
        ;;
      --source-url)
        [[ $# -ge 2 ]] || fail "Missing value for --source-url"
        SOURCE_URL="$2"
        shift 2
        ;;
      --source-file)
        [[ $# -ge 2 ]] || fail "Missing value for --source-file"
        SOURCE_FILE="$2"
        shift 2
        ;;
      --write-fetched)
        [[ $# -ge 2 ]] || fail "Missing value for --write-fetched"
        WRITE_FETCHED="$2"
        shift 2
        ;;
      --write-report)
        [[ $# -ge 2 ]] || fail "Missing value for --write-report"
        WRITE_REPORT="$2"
        shift 2
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        fail "Unknown option: $1"
        ;;
    esac
  done
}

normalize_spec() {
  local input="$1"
  local output="$2"

  jq -S '
    def normalize_schema:
      if type != "object" then .
      else
        del(.description, .title, .example, .examples, .externalDocs)
        | if (.required? | type) == "array" then .required |= sort else . end
        | if (.enum? | type) == "array" then .enum |= sort_by(tostring) else . end
        | if (.properties? | type) == "object" then
            .properties |= (
              to_entries
              | sort_by(.key)
              | map(.value |= normalize_schema)
              | from_entries
            )
          else . end
        | if (.items? | type) == "object" then .items |= normalize_schema else . end
        | if (.additionalProperties? | type) == "object" then
            .additionalProperties |= normalize_schema
          else . end
        | if (.oneOf? | type) == "array" then
            .oneOf |= map(normalize_schema)
          else . end
        | if (.anyOf? | type) == "array" then
            .anyOf |= map(normalize_schema)
          else . end
        | if (.allOf? | type) == "array" then
            .allOf |= map(normalize_schema)
          else . end
        | if (.not? | type) == "object" then .not |= normalize_schema else . end
      end;

    def is_http_method:
      . == "get"
      or . == "post"
      or . == "put"
      or . == "patch"
      or . == "delete"
      or . == "options"
      or . == "head"
      or . == "trace";

    def normalize_parameters:
      map({
        name,
        in,
        required: (.required // false),
        schema: ((.schema // {}) | normalize_schema)
      })
      | sort_by(.in, .name);

    {
      openapi,
      info: {
        title: .info.title
      },
      servers: ((.servers // []) | map({url, description})),
      components: {
        schemas: (
          (.components.schemas // {})
          | to_entries
          | sort_by(.key)
          | map(.value |= normalize_schema)
          | from_entries
        )
      },
      paths: (
        (.paths // {})
        | to_entries
        | sort_by(.key)
        | map(
            .key as $path
            | (.value // {}) as $path_item
            | {
                key: $path,
                value: {
                  parameters: (
                    ($path_item.parameters // []) | normalize_parameters
                  ),
                  operations: (
                    $path_item
                    | to_entries
                    | map(select(.key | is_http_method))
                    | sort_by(.key)
                    | map({
                        key: .key,
                        value: {
                          summary: (.value.summary // null),
                          deprecated: (.value.deprecated // false),
                          parameters: (
                            (.value.parameters // []) | normalize_parameters
                          ),
                          requestBody: (
                            if .value.requestBody == null then null
                            else {
                              required: (.value.requestBody.required // false),
                              contentTypes: ((.value.requestBody.content // {}) | keys | sort),
                              schemas: (
                                (.value.requestBody.content // {})
                                | to_entries
                                | map({
                                    contentType: .key,
                                    schema: ((.value.schema // {}) | normalize_schema)
                                  })
                                | sort_by(.contentType)
                              )
                            }
                            end
                          ),
                          responses: (
                            (.value.responses // {})
                            | to_entries
                            | sort_by(.key)
                            | map({
                                code: .key,
                                schemas: (
                                  (.value.content // {})
                                  | to_entries
                                  | map({
                                      contentType: .key,
                                      schema: ((.value.schema // {}) | normalize_schema)
                                    })
                                  | sort_by(.contentType)
                                )
                              })
                          )
                        }
                      })
                    | from_entries
                  )
                }
              }
          )
        | from_entries
      )
    }
  ' "${input}" > "${output}"
}

extract_behavioral_descriptions() {
  local input="$1"
  local output="$2"

  jq -S '
    def is_http_method:
      . == "get"
      or . == "post"
      or . == "put"
      or . == "patch"
      or . == "delete"
      or . == "options"
      or . == "head"
      or . == "trace";

    def joined_descriptions:
      map(select(type == "string" and length > 0))
      | map(gsub("[[:space:]]+"; " ") | sub("^ "; "") | sub(" $"; ""))
      | unique
      | join("\n");

    def normalized_description:
      if type != "string" then ""
      else gsub("[[:space:]]+"; " ") | sub("^ "; "") | sub(" $"; "")
      end;

    [
      {
        id: "info.description",
        kind: "info",
        label: "General API description",
        value: (.info.description | normalized_description)
      },
      (
        (.paths // {})
        | to_entries[] as $path
        | (
            ($path.value.parameters // [])[]
            | {
                id: "path-parameter|\($path.key)|\(.in // "unknown")|\(.name // "unknown")",
                kind: "path-parameter",
                label: "\($path.key) — shared \(.in // "unknown") parameter \(.name // "unknown")",
                value: ([.description, .schema.description] | joined_descriptions)
              }
          ),
          (
            ($path.value // {})
            | to_entries[]
            | select(.key | is_http_method)
            | .key as $method
            | .value as $operation
            | {
                id: "operation|\($method)|\($path.key)",
                kind: "operation",
                label: "\($method | ascii_upcase) \($path.key)",
                value: ($operation.description | normalized_description)
              },
              (
                ($operation.parameters // [])[]
                | {
                    id: "parameter|\($method)|\($path.key)|\(.in // "unknown")|\(.name // "unknown")",
                    kind: "parameter",
                    label: "\($method | ascii_upcase) \($path.key) — \(.in // "unknown") parameter \(.name // "unknown")",
                    value: ([.description, .schema.description] | joined_descriptions)
                  }
              ),
              (
                ($operation.responses // {})
                | to_entries[]
                | {
                    id: "response|\($method)|\($path.key)|\(.key)",
                    kind: "response",
                    label: "\($method | ascii_upcase) \($path.key) — response \(.key)",
                    value: (.value.description | normalized_description)
                  }
              )
          )
      ),
      (
        (.components.schemas // {})
        | to_entries[] as $schema
        | {
            id: "schema|\($schema.key)",
            kind: "schema",
            label: "Component schema \($schema.key)",
            value: ($schema.value.description | normalized_description)
          },
          (
            ($schema.value.properties // {})
            | to_entries[]
            | {
                id: "schema-property|\($schema.key)|\(.key)",
                kind: "schema-property",
                label: "Component property \($schema.key).\(.key)",
                value: (.value.description | normalized_description)
              }
          )
      )
    ]
    | map(select(.value != ""))
    | sort_by(.id)
  ' "${input}" > "${output}"
}

write_report() {
  local report="$1"

  cat "${report}"

  if [[ -n "${WRITE_REPORT}" ]]; then
    mkdir -p "$(dirname "${WRITE_REPORT}")"
    cp "${report}" "${WRITE_REPORT}"
    echo "Drift report written to ${WRITE_REPORT}"
  fi
}

parse_args "$@"

if [[ ! -f "${REFERENCE_FILE}" ]]; then
  fail "Reference file not found: ${REFERENCE_FILE}"
fi

if [[ -n "${SOURCE_URL}" && -n "${SOURCE_FILE}" ]]; then
  fail "Use only one source: --source-url or --source-file"
fi

if [[ -z "${SOURCE_URL}" && -z "${SOURCE_FILE}" ]]; then
  echo "No source configured (use --source-url, --source-file, or ISBNDB_OPENAPI_SOURCE_URL)."
  echo "Skipping API spec drift check."
  exit 0
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "${tmp_dir}"' EXIT

candidate_file="${tmp_dir}/candidate.json"

if [[ -n "${SOURCE_URL}" ]]; then
  echo "Fetching OpenAPI source from ${SOURCE_URL}"
  curl --fail --silent --show-error --location --retry 3 --connect-timeout 15 \
    "${SOURCE_URL}" > "${candidate_file}"
else
  echo "Reading OpenAPI source from ${SOURCE_FILE}"
  cp "${SOURCE_FILE}" "${candidate_file}"
fi

jq empty "${REFERENCE_FILE}" >/dev/null
jq empty "${candidate_file}" >/dev/null

if [[ -n "${WRITE_FETCHED}" ]]; then
  mkdir -p "$(dirname "${WRITE_FETCHED}")"
  cp "${candidate_file}" "${WRITE_FETCHED}"
  echo "Fetched source written to ${WRITE_FETCHED}"
fi

normalized_reference="${tmp_dir}/reference.normalized.json"
normalized_candidate="${tmp_dir}/candidate.normalized.json"
reference_descriptions="${tmp_dir}/reference.descriptions.json"
candidate_descriptions="${tmp_dir}/candidate.descriptions.json"
description_diff="${tmp_dir}/descriptions.diff.json"

normalize_spec "${REFERENCE_FILE}" "${normalized_reference}"
normalize_spec "${candidate_file}" "${normalized_candidate}"
extract_behavioral_descriptions "${REFERENCE_FILE}" "${reference_descriptions}"
extract_behavioral_descriptions "${candidate_file}" "${candidate_descriptions}"

contract_changed=false
if diff -u "${normalized_reference}" "${normalized_candidate}" > "${tmp_dir}/spec.diff"; then
  contract_changed=false
else
  diff_status=$?
  if [[ "${diff_status}" -ne 1 ]]; then
    fail "Unable to compare normalized OpenAPI contracts"
  fi
  contract_changed=true
fi

reference_version="$(jq -r '.info.version // "unknown"' "${REFERENCE_FILE}")"
candidate_version="$(jq -r '.info.version // "unknown"' "${candidate_file}")"

jq -S -n \
  --slurpfile reference "${reference_descriptions}" \
  --slurpfile candidate "${candidate_descriptions}" '
    ($reference[0] | map({key: .id, value: .}) | from_entries) as $reference_entries
    | ($candidate[0] | map({key: .id, value: .}) | from_entries) as $candidate_entries
    | [
        (($reference_entries | keys) + ($candidate_entries | keys) | unique[])
        as $id
        | select(
            ($reference_entries[$id].value // null)
            != ($candidate_entries[$id].value // null)
          )
        | {
            id: $id,
            kind: (($candidate_entries[$id] // $reference_entries[$id]).kind),
            label: (($candidate_entries[$id] // $reference_entries[$id]).label),
            before: ($reference_entries[$id].value // null),
            after: ($candidate_entries[$id].value // null)
          }
      ]
  ' > "${description_diff}"

metadata_changed=false
if [[ "${reference_version}" != "${candidate_version}" ]]; then
  metadata_changed=true
fi

description_change_count="$(jq 'length' "${description_diff}")"
descriptions_changed=false
if [[ "${description_change_count}" -gt 0 ]]; then
  descriptions_changed=true
fi

if [[ "${metadata_changed}" == false \
  && "${contract_changed}" == false \
  && "${descriptions_changed}" == false ]]; then
  echo "No OpenAPI drift detected."
  exit 0
fi

jq -r '.paths | keys[]' "${normalized_reference}" | sort \
  > "${tmp_dir}/reference.paths"
jq -r '.paths | keys[]' "${normalized_candidate}" | sort \
  > "${tmp_dir}/candidate.paths"
comm -23 "${tmp_dir}/reference.paths" "${tmp_dir}/candidate.paths" \
  > "${tmp_dir}/removed.paths"
comm -13 "${tmp_dir}/reference.paths" "${tmp_dir}/candidate.paths" \
  > "${tmp_dir}/added.paths"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].paths // {}) as $reference_paths
    | ($candidate[0].paths // {}) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | select(
        ($reference_paths[$path].parameters // [])
        != ($candidate_paths[$path].parameters // [])
      )
    | $path
  ' | sort > "${tmp_dir}/changed.path-parameters"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].paths // {}) as $reference_paths
    | ($candidate[0].paths // {}) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | (
        (($reference_paths[$path].operations // {} | keys)
          + ($candidate_paths[$path].operations // {} | keys)
          | unique[])
      ) as $method
    | select(
        $reference_paths[$path].operations[$method]
        != $candidate_paths[$path].operations[$method]
      )
    | "\($method | ascii_upcase) \($path)"
  ' | sort > "${tmp_dir}/changed.operations"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].components.schemas // {}) as $reference_schemas
    | ($candidate[0].components.schemas // {}) as $candidate_schemas
    | (($reference_schemas | keys) + ($candidate_schemas | keys) | unique[])
      as $schema_name
    | select($reference_schemas[$schema_name] != $candidate_schemas[$schema_name])
    | $schema_name
  ' | sort > "${tmp_dir}/changed.schemas"

report="${tmp_dir}/drift-report.md"
{
  echo "## ISBNdb OpenAPI drift report"
  echo ""
  echo "- Reference version: \`${reference_version}\`"
  echo "- Candidate version: \`${candidate_version}\`"
  echo ""
  echo "### Classification"
  echo ""
  echo "- Metadata version: $([[ "${metadata_changed}" == true ]] && echo changed || echo unchanged)"
  echo "- Structural contract: $([[ "${contract_changed}" == true ]] && echo changed || echo unchanged)"
  echo "- Behavioral descriptions: $([[ "${descriptions_changed}" == true ]] && echo "changed (${description_change_count})" || echo unchanged)"

  if [[ "${contract_changed}" == true ]]; then
    echo ""
    echo "### Structural changes"
    echo ""
    echo "Changed endpoints:"
    if [[ -s "${tmp_dir}/removed.paths" || -s "${tmp_dir}/added.paths" ]]; then
      sed 's/^/- Removed: `/' "${tmp_dir}/removed.paths" | sed 's/$/`/'
      sed 's/^/- Added: `/' "${tmp_dir}/added.paths" | sed 's/$/`/'
    else
      echo "- None"
    fi
    echo ""
    echo "Changed path-level parameters:"
    if [[ -s "${tmp_dir}/changed.path-parameters" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.path-parameters" | sed 's/$/`/'
    else
      echo "- None"
    fi
    echo ""
    echo "Changed operations:"
    if [[ -s "${tmp_dir}/changed.operations" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.operations" | sed 's/$/`/'
    else
      echo "- None"
    fi
    echo ""
    echo "Changed component schemas:"
    if [[ -s "${tmp_dir}/changed.schemas" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.schemas" | sed 's/$/`/'
    else
      echo "- None"
    fi
  fi

  if [[ "${descriptions_changed}" == true ]]; then
    echo ""
    echo "### Behavioral description changes"
    echo ""
    jq -r '
      def preview:
        if . == null then "<missing>"
        else
          gsub("[[:space:]]+"; " ")
          | if length > 240 then .[0:237] + "..." else . end
        end;

      .[]
      | if .kind == "info" then
          "- \(.label) changed; full text is available in the candidate artifact."
        else
          "- \(.label)\n\n    Before: \(.before | preview | @json)\n    After: \(.after | preview | @json)"
        end
    ' "${description_diff}"
  fi

  if [[ "${contract_changed}" == true ]]; then
    echo ""
    echo "### Structural diff excerpt"
    echo ""
    head -n 80 "${tmp_dir}/spec.diff" | sed 's/^/    /'
  fi
} > "${report}"

echo "OpenAPI drift detected."
write_report "${report}"

if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
  cat "${report}" >> "${GITHUB_STEP_SUMMARY}"
fi

exit 2

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
    def is_named_map($path):
      (($path | length) > 0
        and (
          $path[-1] == "paths"
          or $path[-1] == "webhooks"
          or $path[-1] == "schemas"
          or $path[-1] == "responses"
          or $path[-1] == "parameters"
          or $path[-1] == "requestBodies"
          or $path[-1] == "headers"
          or $path[-1] == "securitySchemes"
          or $path[-1] == "links"
          or $path[-1] == "callbacks"
          or $path[-1] == "properties"
          or $path[-1] == "patternProperties"
          or $path[-1] == "$defs"
          or $path[-1] == "definitions"
          or $path[-1] == "content"
          or $path[-1] == "encoding"
          or $path[-1] == "variables"
          or $path[-1] == "scopes"
          or $path[-1] == "mapping"
        ))
      or (($path | length) > 1 and $path[-2] == "callbacks")
      or (($path | length) > 1
          and $path[-2] == "security"
          and ($path[-1] | type) == "number");

    def is_link_object($path):
      ($path | length) > 1 and $path[-2] == "links";

    def canonical_json:
      if type == "object" then
        to_entries
        | sort_by(.key)
        | map(.value |= canonical_json)
        | from_entries
      elif type == "array" then
        map(canonical_json)
      else .
      end;

    def normalize_openapi_object:
      (if .deprecated? == false then del(.deprecated) else . end)
      | (if (.required? | type) == "boolean" and .required == false then
           del(.required)
         else .
         end)
      | (if (.required? | type) == "array" then
         .required |= sort
       else .
       end)
      | (if (.enum? | type) == "array" then
           .enum |= (map(canonical_json) | sort_by(tojson))
         else .
         end)
      | (if (.tags? | type) == "array" then
           .tags |= sort
         else .
         end)
      | (if (.parameters? | type) == "array" then
           .parameters |= sort_by(.in // "", .name // "", ."$ref" // "")
         else .
         end)
      | (if (.security? | type) == "array" then
           .security |= (
             map(
               if type == "object" then
                 (to_entries
                  | sort_by(.key)
                  | map(
                      if (.value | type) == "array" then .value |= sort else . end
                    )
                  | from_entries)
               else .
               end
             )
             | sort_by(tojson)
           )
         else .
         end);

    def normalize_value($path):
      if type == "object" then
        (is_named_map($path)) as $is_named_map
        | (if $is_named_map then .
           else
             (if has("description")
                 and ((.description | type) == "string"
                      or (.description | type) == "null")
               then del(.description)
               else .
               end)
             | (if has("summary")
                   and ((.summary | type) == "string"
                        or (.summary | type) == "null")
                 then del(.summary)
                 else .
                 end)
             | del(.example, .examples)
           end)
        | to_entries
        | map(
            .key as $key
            | if ($is_named_map | not)
                and ($key == "default" or $key == "enum" or $key == "const")
              then .
              elif is_link_object($path)
                  and ($key == "requestBody" or $key == "parameters")
              then .
              else .value |= normalize_value($path + [$key])
              end
          )
        | from_entries
        | if $is_named_map then . else normalize_openapi_object end
      elif type == "array" then
        to_entries
        | map(
            .key as $index
            | .value |= normalize_value($path + [$index])
          )
        | map(.value)
      else .
      end;

    {
      openapi,
      info: {
        title: (.info.title // null)
      },
      servers: (.servers // []),
      security: (.security // []),
      components: (
        (.components // {})
        | with_entries(select(.key | startswith("x-") | not))
      ),
      paths: (
        (.paths // {})
        | with_entries(select(.key | startswith("x-") | not))
      ),
      webhooks: (.webhooks // {})
    }
    | normalize_value([])
  ' "${input}" > "${output}"
}

extract_behavioral_descriptions() {
  local input="$1"
  local output="$2"

  jq -S '
    def normalized_description:
      if type != "string" then ""
      else gsub("[[:space:]]+"; " ") | sub("^ "; "") | sub(" $"; "")
      end;

    def is_named_map_name:
      . == "paths"
      or . == "webhooks"
      or . == "schemas"
      or . == "responses"
      or . == "parameters"
      or . == "requestBodies"
      or . == "headers"
      or . == "securitySchemes"
      or . == "links"
      or . == "callbacks"
      or . == "properties"
      or . == "patternProperties"
      or . == "$defs"
      or . == "definitions"
      or . == "content"
      or . == "encoding"
      or . == "variables"
      or . == "scopes"
      or . == "mapping";

    def is_identifier_key($path; $index):
      ($index > 0 and ($path[$index - 1] | is_named_map_name))
      or ($index > 1
          and $path[$index - 2] == "security"
          and ($path[$index - 1] | type) == "number");

    def contains_literal_payload($path):
      [
        range(0; $path | length) as $index
        | select(
            ((($path[$index] == "default"
               or $path[$index] == "enum"
               or $path[$index] == "const"
               or $path[$index] == "example"
               or $path[$index] == "examples")
              and (is_identifier_key($path; $index) | not))
            or ($index > 1
                and $path[$index - 2] == "links"
                and ($path[$index] == "requestBody"
                     or $path[$index] == "parameters")))
          )
      ]
      | length > 0;

    def path_label($path):
      reduce $path[] as $segment
        ("";
          if ($segment | type) == "number" then . + "[\($segment)]"
          elif . == "" then ($segment | tostring)
          else . + "." + ($segment | tostring)
          end
        );

    def semantic_path($document; $path):
      [
        range(0; $path | length) as $index
        | if $index > 0
            and $path[$index - 1] == "parameters"
            and ($path[$index] | type) == "number" then
            ($document | getpath($path[0:($index + 1)])) as $parameter
            | if ($parameter["$ref"] // "") != "" then
                "parameter:$ref:\($parameter["$ref"])"
              else
                "parameter:\($parameter.in // "unknown"):\($parameter.name // "unknown")"
              end
          elif $index > 0
              and $path[$index - 1] == "tags"
              and ($path[$index] | type) == "number" then
            ($document | getpath($path[0:($index + 1)])) as $tag
            | if ($tag | type) == "object" and ($tag.name | type) == "string" then
                "tag:\($tag.name)"
              else
                $path[$index]
              end
          else
            $path[$index]
          end
      ];

    (if (.paths? | type) == "object" then
       .paths |= with_entries(select(.key | startswith("x-") | not))
     else .
     end)
    | . as $document
    | [
      paths(scalars) as $path
      | select($path[-1] == "description" or $path[-1] == "summary")
      | select(contains_literal_payload($path) | not)
      | select(is_identifier_key($path; ($path | length) - 1) | not)
      | (getpath($path) | normalized_description) as $value
      | select($value != "")
      | semantic_path($document; $path) as $semantic_path
      | {
          id: ($semantic_path | tojson),
          kind: (if $path == ["info", "description"] then "info" else $path[-1] end),
          label: (if $path == ["info", "description"]
                  then "General API description"
                  else path_label($semantic_path)
                  end),
          value: $value
        }
    ]
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
    def is_http_method:
      . == "get"
      or . == "post"
      or . == "put"
      or . == "patch"
      or . == "delete"
      or . == "options"
      or . == "head"
      or . == "trace";

    ($reference[0].paths // {}) as $reference_paths
    | ($candidate[0].paths // {}) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | (
        (($reference_paths[$path] // {}) | keys | map(select(is_http_method)))
          + (($candidate_paths[$path] // {}) | keys | map(select(is_http_method)))
        | unique[]
      ) as $method
    | select(
        $reference_paths[$path][$method]
        != $candidate_paths[$path][$method]
      )
    | "\($method | ascii_upcase) \($path)"
  ' | sort > "${tmp_dir}/changed.operations"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].paths // {}) as $reference_paths
    | ($candidate[0].paths // {}) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | select(
        ($reference_paths[$path].servers // [])
        != ($candidate_paths[$path].servers // [])
      )
    | $path
  ' | sort > "${tmp_dir}/changed.path-servers"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].components // {}) as $reference_components
    | ($candidate[0].components // {}) as $candidate_components
    | (($reference_components | keys) + ($candidate_components | keys) | unique[])
      as $section
    | (
        (($reference_components[$section] // {}) | keys)
        + (($candidate_components[$section] // {}) | keys)
        | unique[]
      ) as $component_name
    | select(
        $reference_components[$section][$component_name]
        != $candidate_components[$section][$component_name]
      )
    | "\($section).\($component_name)"
  ' | sort > "${tmp_dir}/changed.components"

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
    echo "Changed path-level servers:"
    if [[ -s "${tmp_dir}/changed.path-servers" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.path-servers" | sed 's/$/`/'
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
    echo "Changed reusable components:"
    if [[ -s "${tmp_dir}/changed.components" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.components" | sed 's/$/`/'
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

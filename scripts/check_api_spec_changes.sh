#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${REPO_ROOT}"

REFERENCE_FILE="api/upstream/isbndb-openapi.json"
SOURCE_URL="${ISBNDB_OPENAPI_SOURCE_URL:-}"
SOURCE_FILE=""
WRITE_FETCHED=""

usage() {
  cat <<'USAGE'
Usage: scripts/check_api_spec_changes.sh [options]

Options:
  --reference <path>      Reference OpenAPI snapshot (default: api/upstream/isbndb-openapi.json)
  --source-url <url>      OpenAPI source URL to compare against
  --source-file <path>    Local OpenAPI file to compare against
  --write-fetched <path>  Persist fetched source JSON to this path
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

    {
      openapi,
      info: {
        title: .info.title,
        version: .info.version
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
        | map({
            key: .key,
            value: (
              (.value // {})
              | to_entries
              | sort_by(.key)
              | map({
                  key: .key,
                  value: {
                    summary: (.value.summary // null),
                    deprecated: (.value.deprecated // false),
                    parameters: (
                      (.value.parameters // [])
                      | map({
                          name,
                          in,
                          required: (.required // false),
                          schema: ((.schema // {}) | normalize_schema)
                        })
                      | sort_by(.in, .name)
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
          })
        | from_entries
      )
    }
  ' "${input}" > "${output}"
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

normalize_spec "${REFERENCE_FILE}" "${normalized_reference}"
normalize_spec "${candidate_file}" "${normalized_candidate}"

if diff -u "${normalized_reference}" "${normalized_candidate}" > "${tmp_dir}/spec.diff"; then
  echo "No OpenAPI drift detected."
  exit 0
fi

reference_version="$(jq -r '.info.version // "unknown"' "${REFERENCE_FILE}")"
candidate_version="$(jq -r '.info.version // "unknown"' "${candidate_file}")"

echo "OpenAPI drift detected."
echo "Reference version: ${reference_version}"
echo "Candidate version: ${candidate_version}"

echo "Changed endpoints (normalized diff):"
comm -3 \
  <(jq -r '.paths | keys[]' "${normalized_reference}" | sort) \
  <(jq -r '.paths | keys[]' "${normalized_candidate}" | sort) \
  | sed 's/^/  - /'

echo "Changed operations (method-level):"
jq -r '
  def ops:
    .paths
    | to_entries[] as $path
    | $path.value
    | to_entries[]
    | "\($path.key) \(.key):\(.value | @json)";
  ops
' "${normalized_reference}" | sort > "${tmp_dir}/reference.ops"

jq -r '
  def ops:
    .paths
    | to_entries[] as $path
    | $path.value
    | to_entries[]
    | "\($path.key) \(.key):\(.value | @json)";
  ops
' "${normalized_candidate}" | sort > "${tmp_dir}/candidate.ops"

comm -3 "${tmp_dir}/reference.ops" "${tmp_dir}/candidate.ops" \
  | sed 's/^/  - /' \
  | head -n 60

echo "Changed component schemas:"
jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    ($reference[0].components.schemas // {}) as $reference_schemas
    | ($candidate[0].components.schemas // {}) as $candidate_schemas
    | (($reference_schemas | keys) + ($candidate_schemas | keys) | unique[])
      as $schema_name
    | select($reference_schemas[$schema_name] != $candidate_schemas[$schema_name])
    | $schema_name
  ' | sed 's/^/  - /'

echo "Diff excerpt (first 120 lines):"
head -n 120 "${tmp_dir}/spec.diff"

if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
  {
    echo "## ISBNdb OpenAPI Drift"
    echo ""
    echo "- Reference version: \`${reference_version}\`"
    echo "- Candidate version: \`${candidate_version}\`"
    echo ""
    echo "Drift detected in normalized API contract."
  } >> "${GITHUB_STEP_SUMMARY}"
fi

exit 2

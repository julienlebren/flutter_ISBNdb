#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHECK_SCRIPT="${REPO_ROOT}/scripts/check_api_spec_changes.sh"
REFERENCE="${REPO_ROOT}/api/upstream/isbndb-openapi.json"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "${tmp_dir}"' EXIT

fail() {
  echo "Test failure: $1" >&2
  exit 1
}

assert_contains() {
  local file="$1"
  local expected="$2"

  grep -F -- "${expected}" "${file}" >/dev/null \
    || fail "Expected ${file} to contain: ${expected}"
}

run_check() {
  local name="$1"
  local expected_status="$2"
  local candidate="$3"
  local reference="${4:-${REFERENCE}}"
  local log="${tmp_dir}/${name}.log"
  local report="${tmp_dir}/${name}.md"
  local actual_status

  set +e
  "${CHECK_SCRIPT}" \
    --reference "${reference}" \
    --source-file "${candidate}" \
    --write-report "${report}" \
    > "${log}" 2>&1
  actual_status=$?
  set -e

  if [[ "${actual_status}" -ne "${expected_status}" ]]; then
    cat "${log}" >&2
    fail "${name} returned ${actual_status}; expected ${expected_status}"
  fi
}

run_check "no-drift" 0 "${REFERENCE}"
assert_contains "${tmp_dir}/no-drift.log" "No OpenAPI drift detected."

jq '.info.description |= gsub("[[:space:]]+"; "    ")' \
  "${REFERENCE}" > "${tmp_dir}/whitespace.json"
run_check "description-whitespace-only" 0 "${tmp_dir}/whitespace.json"
assert_contains \
  "${tmp_dir}/description-whitespace-only.log" \
  "No OpenAPI drift detected."

jq '.paths["/books/{query}"].get.parameters |= reverse' \
  "${REFERENCE}" > "${tmp_dir}/parameter-order.json"
run_check "parameter-order-only" 0 "${tmp_dir}/parameter-order.json"
assert_contains \
  "${tmp_dir}/parameter-order-only.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/book/{isbn}"].get.parameters[0].example = {
    "description": "A documentation-only example payload",
    "value": "9780000000000"
  }
' \
  "${REFERENCE}" > "${tmp_dir}/example-only.json"
run_check "example-only" 0 "${tmp_dir}/example-only.json"
assert_contains "${tmp_dir}/example-only.log" "No OpenAPI drift detected."

jq '
  .components.schemas.LiteralDefault = {
    "type": "object",
    "default": {
      "example": "first",
      "tags": ["alpha", "beta"]
    }
  }
' "${REFERENCE}" > "${tmp_dir}/literal-default-reference.json"
jq '.components.schemas.LiteralDefault.default.example = "second"' \
  "${tmp_dir}/literal-default-reference.json" \
  > "${tmp_dir}/literal-default-example.json"
run_check \
  "literal-default-example" \
  2 \
  "${tmp_dir}/literal-default-example.json" \
  "${tmp_dir}/literal-default-reference.json"
assert_contains \
  "${tmp_dir}/literal-default-example.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/literal-default-example.md" \
  "- Behavioral descriptions: unchanged"

jq '.components.schemas.LiteralDefault.default.tags |= reverse' \
  "${tmp_dir}/literal-default-reference.json" \
  > "${tmp_dir}/literal-default-array-order.json"
run_check \
  "literal-default-array-order" \
  2 \
  "${tmp_dir}/literal-default-array-order.json" \
  "${tmp_dir}/literal-default-reference.json"
assert_contains \
  "${tmp_dir}/literal-default-array-order.md" \
  "- Structural contract: changed"

jq '.info.title = "Renamed ISBNdb API"' \
  "${REFERENCE}" > "${tmp_dir}/title.json"
run_check "title" 2 "${tmp_dir}/title.json"
assert_contains "${tmp_dir}/title.md" "- Structural contract: changed"

jq '.servers = [{"url":"https://primary.example.com"},{"url":"https://backup.example.com"}]' \
  "${REFERENCE}" > "${tmp_dir}/server-order-reference.json"
jq '.servers |= reverse' \
  "${tmp_dir}/server-order-reference.json" > "${tmp_dir}/server-order-candidate.json"
run_check \
  "server-order" \
  2 \
  "${tmp_dir}/server-order-candidate.json" \
  "${tmp_dir}/server-order-reference.json"
assert_contains "${tmp_dir}/server-order.md" "- Structural contract: changed"

jq '
  .paths["/book/{isbn}"].get.security = [
    {"OAuth": ["books:read", "prices:read"]}
  ]
' "${REFERENCE}" > "${tmp_dir}/security-scope-reference.json"
jq '.paths["/book/{isbn}"].get.security[0].OAuth |= reverse' \
  "${tmp_dir}/security-scope-reference.json" \
  > "${tmp_dir}/security-scope-candidate.json"
run_check \
  "security-scope-order" \
  0 \
  "${tmp_dir}/security-scope-candidate.json" \
  "${tmp_dir}/security-scope-reference.json"
assert_contains \
  "${tmp_dir}/security-scope-order.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/book/{isbn}"].get.security = [
    {"ZetaAuth": [], "AlphaAuth": []},
    {"MiddleAuth": []}
  ]
' "${REFERENCE}" > "${tmp_dir}/security-key-reference.json"
jq '
  .paths["/book/{isbn}"].get.security[0]
  = {"AlphaAuth": [], "ZetaAuth": []}
' "${tmp_dir}/security-key-reference.json" \
  > "${tmp_dir}/security-key-candidate.json"
run_check \
  "security-key-order" \
  0 \
  "${tmp_dir}/security-key-candidate.json" \
  "${tmp_dir}/security-key-reference.json"
assert_contains \
  "${tmp_dir}/security-key-order.log" \
  "No OpenAPI drift detected."

jq '.info.version = "9.9.9"' "${REFERENCE}" > "${tmp_dir}/version.json"
run_check "version-only" 2 "${tmp_dir}/version.json"
assert_contains "${tmp_dir}/version-only.md" "- Metadata version: changed"
assert_contains "${tmp_dir}/version-only.md" "- Structural contract: unchanged"
assert_contains "${tmp_dir}/version-only.md" "- Behavioral descriptions: unchanged"

jq '
  (.paths["/books/{query}"].get.parameters[]
    | select(.name == "pageSize")
    | (.description, .schema.description))
  = "How many items should be returned per page, maximum of 42"
' "${REFERENCE}" > "${tmp_dir}/description.json"
run_check "description-only" 2 "${tmp_dir}/description.json"
assert_contains "${tmp_dir}/description-only.md" "- Metadata version: unchanged"
assert_contains "${tmp_dir}/description-only.md" "- Structural contract: unchanged"
assert_contains "${tmp_dir}/description-only.md" "- Behavioral descriptions: changed (2)"
assert_contains "${tmp_dir}/description-only.md" "paths./books/{query}.get.parameters"
assert_contains "${tmp_dir}/description-only.md" 'Before: "How many items should be returned per page, maximum of 100.'
assert_contains "${tmp_dir}/description-only.md" 'After: "How many items should be returned per page, maximum of 42"'

jq '
  .paths["/book/{isbn}"].get.responses["404"].description
  = "The requested book is not currently indexed"
' "${REFERENCE}" > "${tmp_dir}/response-description.json"
run_check "response-description" 2 "${tmp_dir}/response-description.json"
assert_contains "${tmp_dir}/response-description.md" "- Structural contract: unchanged"
assert_contains "${tmp_dir}/response-description.md" "- Behavioral descriptions: changed (1)"
assert_contains \
  "${tmp_dir}/response-description.md" \
  "paths./book/{isbn}.get.responses.404.description"
assert_contains \
  "${tmp_dir}/response-description.md" \
  'After: "The requested book is not currently indexed"'

jq '
  .paths["/books/{query}"].parameters = [
    {
      "name": "locale",
      "in": "query",
      "description": "Locale applied to every operation on this path",
      "required": false,
      "schema": {"type": "string"}
    }
  ]
' "${REFERENCE}" > "${tmp_dir}/path-parameter.json"
run_check "path-parameter" 2 "${tmp_dir}/path-parameter.json"
assert_contains "${tmp_dir}/path-parameter.md" "- Structural contract: changed"
assert_contains "${tmp_dir}/path-parameter.md" "- Behavioral descriptions: changed (1)"
assert_contains "${tmp_dir}/path-parameter.md" "Changed path-level parameters:"
assert_contains "${tmp_dir}/path-parameter.md" '/books/{query}'
assert_contains \
  "${tmp_dir}/path-parameter.md" \
  "paths./books/{query}.parameters.parameter:query:locale.description"

jq '
  .paths["/books/{query}"].get.parameters += [
    {
      "name": "a-new-filter",
      "in": "query",
      "description": "A newly documented filter",
      "schema": {
        "type": "string",
        "description": "A newly documented filter value"
      }
    }
  ]
' "${REFERENCE}" > "${tmp_dir}/inserted-parameter.json"
run_check "inserted-parameter" 2 "${tmp_dir}/inserted-parameter.json"
assert_contains \
  "${tmp_dir}/inserted-parameter.md" \
  "- Behavioral descriptions: changed (2)"
assert_contains \
  "${tmp_dir}/inserted-parameter.md" \
  "parameter:query:a-new-filter.description"

jq '
  .components.responses.TooManyRequests.description
  = "Too many requests; retry after the documented delay"
' "${REFERENCE}" > "${tmp_dir}/reusable-response-description.json"
run_check \
  "reusable-response-description" \
  2 \
  "${tmp_dir}/reusable-response-description.json"
assert_contains \
  "${tmp_dir}/reusable-response-description.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/reusable-response-description.md" \
  "components.responses.TooManyRequests.description"

jq '
  .components.schemas.BookWithPrices.allOf[1].properties.prices.description
  = "Current offers grouped by seller"
' "${REFERENCE}" > "${tmp_dir}/composed-schema-description.json"
run_check \
  "composed-schema-description" \
  2 \
  "${tmp_dir}/composed-schema-description.json"
assert_contains \
  "${tmp_dir}/composed-schema-description.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/composed-schema-description.md" \
  "components.schemas.BookWithPrices.allOf[1].properties.prices.description"

jq '
  .paths["/book/{isbn}"].get.responses["200"].headers.ratelimit.description
  = "Remaining requests in the current rate-limit window"
' "${REFERENCE}" > "${tmp_dir}/response-header-description.json"
run_check \
  "response-header-description" \
  2 \
  "${tmp_dir}/response-header-description.json"
assert_contains \
  "${tmp_dir}/response-header-description.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/response-header-description.md" \
  "paths./book/{isbn}.get.responses.200.headers.ratelimit.description"

jq '
  .components.responses.BadRequest.headers["x-trace-id"] = {
    "description": "Trace identifier for this response",
    "schema": {"type": "string"}
  }
' "${REFERENCE}" > "${tmp_dir}/reusable-response-structure.json"
run_check \
  "reusable-response-structure" \
  2 \
  "${tmp_dir}/reusable-response-structure.json"
assert_contains \
  "${tmp_dir}/reusable-response-structure.md" \
  "Changed reusable components:"
assert_contains \
  "${tmp_dir}/reusable-response-structure.md" \
  "responses.BadRequest"

jq '
  .paths["/book/{isbn}"].get.summary = "Look up one book by ISBN"
' "${REFERENCE}" > "${tmp_dir}/operation-summary.json"
run_check "operation-summary" 2 "${tmp_dir}/operation-summary.json"
assert_contains \
  "${tmp_dir}/operation-summary.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/operation-summary.md" \
  "paths./book/{isbn}.get.summary"

jq '
  .paths["/books/{query}"].servers = [
    {"url": "https://regional.example.com/{region}"}
  ]
' "${REFERENCE}" > "${tmp_dir}/path-server.json"
run_check "path-server" 2 "${tmp_dir}/path-server.json"
assert_contains "${tmp_dir}/path-server.md" "- Structural contract: changed"
assert_contains "${tmp_dir}/path-server.md" "Changed path-level servers:"
assert_contains "${tmp_dir}/path-server.md" '/books/{query}'

jq '
  (.paths["/books/{query}"].get.parameters[]
    | select(.name == "pageSize")
    | .schema.default) = 42
  | .components.schemas.PaginationFilters.properties.pageSize.default = 42
' "${REFERENCE}" > "${tmp_dir}/structural.json"
run_check "structural" 2 "${tmp_dir}/structural.json"
assert_contains "${tmp_dir}/structural.md" "- Metadata version: unchanged"
assert_contains "${tmp_dir}/structural.md" "- Structural contract: changed"
assert_contains "${tmp_dir}/structural.md" "- Behavioral descriptions: unchanged"
assert_contains "${tmp_dir}/structural.md" 'Changed operations:'
assert_contains "${tmp_dir}/structural.md" 'GET /books/{query}'
assert_contains "${tmp_dir}/structural.md" 'PaginationFilters'

echo "API spec drift diagnostics tests passed."

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

jq '.tags |= reverse' \
  "${REFERENCE}" > "${tmp_dir}/tag-order.json"
run_check "tag-order-only" 0 "${tmp_dir}/tag-order.json"
assert_contains \
  "${tmp_dir}/tag-order-only.log" \
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

jq '
  .components.schemas.Wrapper = {
    "type": "object",
    "properties": {
      "headers": {
        "type": "string",
        "example": "first"
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/named-map-reference.json"
jq '.components.schemas.Wrapper.properties.headers.example = "second"' \
  "${tmp_dir}/named-map-reference.json" \
  > "${tmp_dir}/named-map-candidate.json"
run_check \
  "named-map-context" \
  0 \
  "${tmp_dir}/named-map-candidate.json" \
  "${tmp_dir}/named-map-reference.json"
assert_contains \
  "${tmp_dir}/named-map-context.log" \
  "No OpenAPI drift detected."

jq '
  .components.schemas.headers = {
    "type": "object",
    "properties": {
      "example": {
        "type": "string",
        "description": "First property description"
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/nested-map-name-reference.json"
jq '
  .components.schemas.headers.properties.example.description
  = "Second property description"
' "${tmp_dir}/nested-map-name-reference.json" \
  > "${tmp_dir}/nested-map-name-candidate.json"
run_check \
  "nested-map-name" \
  2 \
  "${tmp_dir}/nested-map-name-candidate.json" \
  "${tmp_dir}/nested-map-name-reference.json"
assert_contains \
  "${tmp_dir}/nested-map-name.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/nested-map-name.md" \
  "- Behavioral descriptions: changed (1)"

jq '
  .components.schemas.CallbackHolder = {
    "type": "object",
    "properties": {
      "callbacks": {
        "type": "array",
        "items": {
          "type": "string",
          "description": "First callback item description"
        }
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/callback-name-reference.json"
jq '
  .components.schemas.CallbackHolder.properties.callbacks.items.description
  = "Second callback item description"
' "${tmp_dir}/callback-name-reference.json" \
  > "${tmp_dir}/callback-name-candidate.json"
run_check \
  "callback-name-context" \
  2 \
  "${tmp_dir}/callback-name-candidate.json" \
  "${tmp_dir}/callback-name-reference.json"
assert_contains \
  "${tmp_dir}/callback-name-context.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/callback-name-context.md" \
  "- Behavioral descriptions: changed (1)"

jq '
  .openapi = "3.1.0"
  | .components.schemas.Conditional = {
    "type": "object",
    "dependentSchemas": {
      "example": {
        "properties": {
          "value": {"type": "string"}
        }
      }
    },
    "dependentRequired": {
      "example": ["second", "first"]
    }
  }
' "${REFERENCE}" > "${tmp_dir}/dependent-schema-reference.json"
jq '
  .components.schemas.Conditional.dependentSchemas.example
    .properties.value.type = "integer"
' "${tmp_dir}/dependent-schema-reference.json" \
  > "${tmp_dir}/dependent-schema-candidate.json"
run_check \
  "dependent-schema" \
  2 \
  "${tmp_dir}/dependent-schema-candidate.json" \
  "${tmp_dir}/dependent-schema-reference.json"
assert_contains \
  "${tmp_dir}/dependent-schema.md" \
  "- Structural contract: changed"

jq '
  .components.schemas.Conditional.dependentRequired.example |= reverse
' "${tmp_dir}/dependent-schema-reference.json" \
  > "${tmp_dir}/dependent-required-order.json"
run_check \
  "dependent-required-order" \
  0 \
  "${tmp_dir}/dependent-required-order.json" \
  "${tmp_dir}/dependent-schema-reference.json"
assert_contains \
  "${tmp_dir}/dependent-required-order.log" \
  "No OpenAPI drift detected."

jq '
  .components.schemas.Composed = {
    "oneOf": [
      {"type": "string", "description": "A string value"},
      {"type": "integer", "description": "An integer value"}
    ],
    "anyOf": [
      {"type": "boolean", "description": "A boolean value"},
      {"type": "null", "description": "A null value"}
    ],
    "allOf": [
      {
        "description": "The first object part",
        "properties": {"first": {"type": "string"}}
      },
      {
        "description": "The second object part",
        "properties": {"second": {"type": "integer"}}
      }
    ]
  }
' "${REFERENCE}" > "${tmp_dir}/composition-order-reference.json"
jq '
  .components.schemas.Composed.oneOf |= reverse
  | .components.schemas.Composed.anyOf |= reverse
  | .components.schemas.Composed.allOf |= reverse
' "${tmp_dir}/composition-order-reference.json" \
  > "${tmp_dir}/composition-order-candidate.json"
run_check \
  "composition-order" \
  0 \
  "${tmp_dir}/composition-order-candidate.json" \
  "${tmp_dir}/composition-order-reference.json"
assert_contains \
  "${tmp_dir}/composition-order.log" \
  "No OpenAPI drift detected."

jq '.components.schemas.Composed.oneOf[0].readOnly = false' \
  "${tmp_dir}/composition-order-reference.json" \
  > "${tmp_dir}/composition-default-candidate.json"
run_check \
  "composition-default" \
  0 \
  "${tmp_dir}/composition-default-candidate.json" \
  "${tmp_dir}/composition-order-reference.json"
assert_contains \
  "${tmp_dir}/composition-default.log" \
  "No OpenAPI drift detected."

jq '
  .components.links.Next = {
    "operationId": "getBooks",
    "requestBody": {
      "example": "first",
      "description": "Literal request data",
      "tags": ["alpha", "beta"]
    },
    "parameters": {
      "payload": {
        "example": "first",
        "tags": ["alpha", "beta"]
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/link-literal-reference.json"
jq '
  .components.links.Next.requestBody.example = "second"
  | .components.links.Next.requestBody.description = "Changed literal request data"
  | .components.links.Next.parameters.payload.example = "second"
' "${tmp_dir}/link-literal-reference.json" \
  > "${tmp_dir}/link-literal-candidate.json"
run_check \
  "link-literal" \
  2 \
  "${tmp_dir}/link-literal-candidate.json" \
  "${tmp_dir}/link-literal-reference.json"
assert_contains "${tmp_dir}/link-literal.md" "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/link-literal.md" \
  "- Behavioral descriptions: unchanged"

jq '.info.title = "Renamed ISBNdb API"' \
  "${REFERENCE}" > "${tmp_dir}/title.json"
run_check "title" 2 "${tmp_dir}/title.json"
assert_contains "${tmp_dir}/title.md" "- Structural contract: changed"

jq '.components.schemas.Book.title = "Documentation-only schema title"' \
  "${REFERENCE}" > "${tmp_dir}/schema-title.json"
run_check "schema-title" 0 "${tmp_dir}/schema-title.json"
assert_contains "${tmp_dir}/schema-title.log" "No OpenAPI drift detected."

jq '
  .paths["/book/{isbn}"].get.externalDocs = {
    "url": "https://docs.example.com/books",
    "description": "Additional book documentation"
  }
  | .components.schemas.Book.externalDocs = {
      "url": "https://docs.example.com/schemas/book",
      "description": "Additional schema documentation"
    }
' "${REFERENCE}" > "${tmp_dir}/external-docs.json"
run_check "external-docs" 2 "${tmp_dir}/external-docs.json"
assert_contains \
  "${tmp_dir}/external-docs.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/external-docs.md" \
  "- Behavioral descriptions: changed (2)"

jq '
  .paths["/book/{isbn}"].get.externalDocs.url
    = "https://docs.example.com/updated-books"
  | .components.schemas.Book.externalDocs.url
    = "https://docs.example.com/updated-schemas/book"
' "${tmp_dir}/external-docs.json" \
  > "${tmp_dir}/external-docs-url.json"
run_check \
  "external-docs-url" \
  0 \
  "${tmp_dir}/external-docs-url.json" \
  "${tmp_dir}/external-docs.json"
assert_contains \
  "${tmp_dir}/external-docs-url.log" \
  "No OpenAPI drift detected."

jq '
  .components.examples.ExternalDocsPayload = {
    "value": {
      "externalDocs": {
        "description": "Literal payload documentation"
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/external-docs-payload-reference.json"
jq '
  .components.examples.ExternalDocsPayload.value.externalDocs.description
    = "Changed literal payload documentation"
' "${tmp_dir}/external-docs-payload-reference.json" \
  > "${tmp_dir}/external-docs-payload-candidate.json"
run_check \
  "external-docs-payload" \
  0 \
  "${tmp_dir}/external-docs-payload-candidate.json" \
  "${tmp_dir}/external-docs-payload-reference.json"
assert_contains \
  "${tmp_dir}/external-docs-payload.log" \
  "No OpenAPI drift detected."

jq '.jsonSchemaDialect = "https://json-schema.org/draft/2020-12/schema"' \
  "${REFERENCE}" > "${tmp_dir}/json-schema-dialect.json"
run_check "json-schema-dialect" 2 "${tmp_dir}/json-schema-dialect.json"
assert_contains \
  "${tmp_dir}/json-schema-dialect.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/json-schema-dialect.md" \
  '- Reference JSON Schema dialect: `implicit`'
assert_contains \
  "${tmp_dir}/json-schema-dialect.md" \
  '- Candidate JSON Schema dialect: `https://json-schema.org/draft/2020-12/schema`'

jq '.openapi = "3.0.1"' \
  "${REFERENCE}" > "${tmp_dir}/openapi-version.json"
run_check "openapi-version" 2 "${tmp_dir}/openapi-version.json"
assert_contains \
  "${tmp_dir}/openapi-version.md" \
  '- Reference OpenAPI version: `3.0.0`'
assert_contains \
  "${tmp_dir}/openapi-version.md" \
  '- Candidate OpenAPI version: `3.0.1`'

jq '.openapi = "3.1.0" | del(.jsonSchemaDialect)' \
  "${REFERENCE}" > "${tmp_dir}/implicit-dialect-reference.json"
jq '.jsonSchemaDialect = "https://spec.openapis.org/oas/3.1/dialect/base"' \
  "${tmp_dir}/implicit-dialect-reference.json" \
  > "${tmp_dir}/implicit-dialect-candidate.json"
run_check \
  "implicit-dialect" \
  0 \
  "${tmp_dir}/implicit-dialect-candidate.json" \
  "${tmp_dir}/implicit-dialect-reference.json"
assert_contains \
  "${tmp_dir}/implicit-dialect.log" \
  "No OpenAPI drift detected."

jq '.openapi = "3.1.0" | del(.jsonSchemaDialect)' \
  "${REFERENCE}" > "${tmp_dir}/invalid-dialect-reference.json"
jq '.jsonSchemaDialect = false' \
  "${tmp_dir}/invalid-dialect-reference.json" \
  > "${tmp_dir}/invalid-dialect-candidate.json"
run_check \
  "invalid-dialect" \
  2 \
  "${tmp_dir}/invalid-dialect-candidate.json" \
  "${tmp_dir}/invalid-dialect-reference.json"
assert_contains \
  "${tmp_dir}/invalid-dialect.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/invalid-dialect.md" \
  '- Candidate JSON Schema dialect: `false`'

for root_field in security components paths webhooks; do
  jq --arg field "${root_field}" 'del(.[$field])' \
    "${REFERENCE}" > "${tmp_dir}/${root_field}-false-reference.json"
  jq --arg field "${root_field}" '.[$field] = false' \
    "${tmp_dir}/${root_field}-false-reference.json" \
    > "${tmp_dir}/${root_field}-false-candidate.json"
  run_check \
    "${root_field}-false" \
    2 \
    "${tmp_dir}/${root_field}-false-candidate.json" \
    "${tmp_dir}/${root_field}-false-reference.json"
  assert_contains \
    "${tmp_dir}/${root_field}-false.md" \
    "- Structural contract: changed"
done

jq '.paths = "malformed"' \
  "${REFERENCE}" > "${tmp_dir}/paths-string.json"
run_check "paths-string" 2 "${tmp_dir}/paths-string.json"
assert_contains \
  "${tmp_dir}/paths-string.md" \
  "- Structural contract: changed"

jq '.paths["/key"] = "malformed"' \
  "${REFERENCE}" > "${tmp_dir}/path-item-string.json"
run_check "path-item-string" 2 "${tmp_dir}/path-item-string.json"
assert_contains \
  "${tmp_dir}/path-item-string.md" \
  "- Structural contract: changed"

jq '
  .openapi = "3.1.0"
  | .components.schemas.NullableString = {
      "type": ["string", "null"]
    }
' "${REFERENCE}" > "${tmp_dir}/type-array-reference.json"
jq '.components.schemas.NullableString.type |= reverse' \
  "${tmp_dir}/type-array-reference.json" \
  > "${tmp_dir}/type-array-candidate.json"
run_check \
  "type-array-order" \
  0 \
  "${tmp_dir}/type-array-candidate.json" \
  "${tmp_dir}/type-array-reference.json"
assert_contains \
  "${tmp_dir}/type-array-order.log" \
  "No OpenAPI drift detected."

jq '
  .openapi = "3.1.0"
  | .components.schemas.BoundedNumber = {"type": "number"}
' "${REFERENCE}" > "${tmp_dir}/exclusive-bound-reference.json"
jq '
  .components.schemas.BoundedNumber.exclusiveMinimum = false
  | .components.schemas.BoundedNumber.exclusiveMaximum = false
' "${tmp_dir}/exclusive-bound-reference.json" \
  > "${tmp_dir}/exclusive-bound-candidate.json"
run_check \
  "exclusive-bound" \
  2 \
  "${tmp_dir}/exclusive-bound-candidate.json" \
  "${tmp_dir}/exclusive-bound-reference.json"
assert_contains \
  "${tmp_dir}/exclusive-bound.md" \
  "- Structural contract: changed"

jq '
  .openapi = "3.1.0"
  | .components.schemas.Commented = {
      "type": "string",
      "$comment": "First maintainer note"
    }
' "${REFERENCE}" > "${tmp_dir}/schema-comment-reference.json"
jq '.components.schemas.Commented["$comment"] = "Second maintainer note"' \
  "${tmp_dir}/schema-comment-reference.json" \
  > "${tmp_dir}/schema-comment-candidate.json"
run_check \
  "schema-comment" \
  0 \
  "${tmp_dir}/schema-comment-candidate.json" \
  "${tmp_dir}/schema-comment-reference.json"
assert_contains \
  "${tmp_dir}/schema-comment.log" \
  "No OpenAPI drift detected."

jq '.servers = [
  {"url":"https://primary.example.com", "description":"Primary endpoint"},
  {"url":"https://backup.example.com", "description":"Backup endpoint"}
]' \
  "${REFERENCE}" > "${tmp_dir}/server-order-reference.json"
jq '.servers |= reverse' \
  "${tmp_dir}/server-order-reference.json" > "${tmp_dir}/server-order-candidate.json"
run_check \
  "server-order" \
  2 \
  "${tmp_dir}/server-order-candidate.json" \
  "${tmp_dir}/server-order-reference.json"
assert_contains "${tmp_dir}/server-order.md" "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/server-order.md" \
  "- Behavioral descriptions: unchanged"

jq '.servers[0].url = "https://regional.example.com"' \
  "${REFERENCE}" > "${tmp_dir}/top-level-server.json"
run_check "top-level-server" 2 "${tmp_dir}/top-level-server.json"
assert_contains \
  "${tmp_dir}/top-level-server.md" \
  "Changed top-level servers:"
assert_contains \
  "${tmp_dir}/top-level-server.md" \
  "https://regional.example.com"

jq 'del(.servers)' \
  "${REFERENCE}" > "${tmp_dir}/implicit-root-server-reference.json"
jq '.servers = [{"url": "/", "variables": {}}]' \
  "${tmp_dir}/implicit-root-server-reference.json" \
  > "${tmp_dir}/implicit-root-server-candidate.json"
run_check \
  "implicit-root-server" \
  0 \
  "${tmp_dir}/implicit-root-server-candidate.json" \
  "${tmp_dir}/implicit-root-server-reference.json"
assert_contains \
  "${tmp_dir}/implicit-root-server.log" \
  "No OpenAPI drift detected."

jq '.servers = [
  {
    "url": "https://{environment}.example.com",
    "description": "Primary environment",
    "variables": {
      "environment": {"default": "primary"}
    }
  },
  {
    "url": "https://{environment}.example.com",
    "description": "Backup environment",
    "variables": {
      "environment": {"default": "backup"}
    }
  }
]' "${REFERENCE}" > "${tmp_dir}/duplicate-server-reference.json"
jq '.servers[0].description = "Updated primary environment"' \
  "${tmp_dir}/duplicate-server-reference.json" \
  > "${tmp_dir}/duplicate-server-description.json"
run_check \
  "duplicate-server-description" \
  2 \
  "${tmp_dir}/duplicate-server-description.json" \
  "${tmp_dir}/duplicate-server-reference.json"
assert_contains \
  "${tmp_dir}/duplicate-server-description.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/duplicate-server-description.md" \
  "- Behavioral descriptions: changed (1)"

jq '.servers[0].variables.environment.default = "updated-primary"' \
  "${tmp_dir}/duplicate-server-reference.json" \
  > "${tmp_dir}/duplicate-server-variable.json"
run_check \
  "duplicate-server-variable" \
  2 \
  "${tmp_dir}/duplicate-server-variable.json" \
  "${tmp_dir}/duplicate-server-reference.json"
assert_contains \
  "${tmp_dir}/duplicate-server-variable.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/duplicate-server-variable.md" \
  "- Behavioral descriptions: unchanged"

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

jq '
  .paths["/book/{isbn}"].get.deprecated = false
  | (.paths["/book/{isbn}"].get.parameters[]
     | select(.name == "with_prices")
     | (.required, .allowReserved, .allowEmptyValue)) = false
  | (.paths["/book/{isbn}"].get.parameters[]
     | select(.name == "with_prices")
     | .style) = "form"
  | (.paths["/book/{isbn}"].get.parameters[]
     | select(.name == "with_prices")
     | .explode) = true
  | (.paths["/book/{isbn}"].get.parameters[]
     | select(.name == "isbn")
     | .style) = "simple"
  | (.paths["/book/{isbn}"].get.parameters[]
     | select(.name == "isbn")
     | .explode) = false
  | (.components.schemas.Book
     | (.nullable, .readOnly, .writeOnly, .uniqueItems)) = false
' "${REFERENCE}" > "${tmp_dir}/explicit-defaults.json"
run_check "explicit-defaults" 0 "${tmp_dir}/explicit-defaults.json"
assert_contains \
  "${tmp_dir}/explicit-defaults.log" \
  "No OpenAPI drift detected."

jq '
  .components.headers.RequestId = {
    "schema": {"type": "string"}
  }
' "${REFERENCE}" > "${tmp_dir}/header-defaults-reference.json"
jq '
  .components.headers.RequestId.style = "simple"
  | .components.headers.RequestId.explode = false
  | .components.headers.RequestId.required = false
' "${tmp_dir}/header-defaults-reference.json" \
  > "${tmp_dir}/header-defaults-candidate.json"
run_check \
  "header-defaults" \
  0 \
  "${tmp_dir}/header-defaults-candidate.json" \
  "${tmp_dir}/header-defaults-reference.json"
assert_contains \
  "${tmp_dir}/header-defaults.log" \
  "No OpenAPI drift detected."

jq '
  .components.requestBodies.FormPayload = {
    "content": {
      "application/x-www-form-urlencoded": {
        "schema": {"type": "object"},
        "encoding": {
          "value": {}
        }
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/encoding-defaults-reference.json"
jq '
  .components.requestBodies.FormPayload.content
    ["application/x-www-form-urlencoded"].encoding.value.style = "form"
  | .components.requestBodies.FormPayload.content
    ["application/x-www-form-urlencoded"].encoding.value.explode = true
' "${tmp_dir}/encoding-defaults-reference.json" \
  > "${tmp_dir}/encoding-defaults-candidate.json"
run_check \
  "encoding-defaults" \
  0 \
  "${tmp_dir}/encoding-defaults-candidate.json" \
  "${tmp_dir}/encoding-defaults-reference.json"
assert_contains \
  "${tmp_dir}/encoding-defaults.log" \
  "No OpenAPI drift detected."

jq '
  .components.responses.CaseHeaders = {
    "description": "A response with a trace header",
    "headers": {
      "X-Trace-Id": {
        "description": "Trace identifier returned by the service",
        "schema": {"type": "string"}
      }
    }
  }
  | .components.requestBodies.EncodedHeaders = {
      "content": {
        "multipart/form-data": {
          "schema": {"type": "object"},
          "encoding": {
            "value": {
              "headers": {
                "X-Trace-Id": {
                  "description": "Trace identifier sent with this part",
                  "schema": {"type": "string"}
                }
              }
            }
          }
        }
      }
    }
' "${REFERENCE}" > "${tmp_dir}/header-map-case-reference.json"
jq '
  .components.responses.CaseHeaders.headers |= with_entries(.key |= ascii_downcase)
  | .components.requestBodies.EncodedHeaders.content["multipart/form-data"]
      .encoding.value.headers |= with_entries(.key |= ascii_downcase)
' "${tmp_dir}/header-map-case-reference.json" \
  > "${tmp_dir}/header-map-case-candidate.json"
run_check \
  "header-map-case" \
  0 \
  "${tmp_dir}/header-map-case-candidate.json" \
  "${tmp_dir}/header-map-case-reference.json"
assert_contains \
  "${tmp_dir}/header-map-case.log" \
  "No OpenAPI drift detected."

jq '
  .components.headers.TraceId = {
    "description": "Reusable trace header",
    "schema": {"type": "string"}
  }
' "${REFERENCE}" > "${tmp_dir}/component-header-name-reference.json"
jq '
  .components.headers.traceId = .components.headers.TraceId
  | del(.components.headers.TraceId)
' "${tmp_dir}/component-header-name-reference.json" \
  > "${tmp_dir}/component-header-name-candidate.json"
run_check \
  "component-header-name" \
  2 \
  "${tmp_dir}/component-header-name-candidate.json" \
  "${tmp_dir}/component-header-name-reference.json"
assert_contains \
  "${tmp_dir}/component-header-name.md" \
  "- Structural contract: changed"

jq '.components.schemas.Book.additionalProperties = true' \
  "${REFERENCE}" > "${tmp_dir}/additional-properties-default.json"
run_check \
  "additional-properties-default" \
  0 \
  "${tmp_dir}/additional-properties-default.json"
assert_contains \
  "${tmp_dir}/additional-properties-default.log" \
  "No OpenAPI drift detected."

jq '.paths["/key"].get.additionalProperties = true' \
  "${REFERENCE}" > "${tmp_dir}/invalid-operation-additional-properties.json"
run_check \
  "invalid-operation-additional-properties" \
  2 \
  "${tmp_dir}/invalid-operation-additional-properties.json"
assert_contains \
  "${tmp_dir}/invalid-operation-additional-properties.md" \
  "- Structural contract: changed"

jq '.components.callbacks = {}' \
  "${REFERENCE}" > "${tmp_dir}/empty-component-section.json"
run_check \
  "empty-component-section" \
  0 \
  "${tmp_dir}/empty-component-section.json"
assert_contains \
  "${tmp_dir}/empty-component-section.log" \
  "No OpenAPI drift detected."

jq '
  .components.responses.EmptyOptionalMaps = {
    "description": "Response without representation metadata"
  }
' "${REFERENCE}" > "${tmp_dir}/empty-response-maps-reference.json"
jq '
  .components.responses.EmptyOptionalMaps.headers = {}
  | .components.responses.EmptyOptionalMaps.links = {}
  | .components.responses.EmptyOptionalMaps.content = {}
' "${tmp_dir}/empty-response-maps-reference.json" \
  > "${tmp_dir}/empty-response-maps-candidate.json"
run_check \
  "empty-response-maps" \
  0 \
  "${tmp_dir}/empty-response-maps-candidate.json" \
  "${tmp_dir}/empty-response-maps-reference.json"
assert_contains \
  "${tmp_dir}/empty-response-maps.log" \
  "No OpenAPI drift detected."

jq 'del(.components.schemas.Book.required)' \
  "${REFERENCE}" > "${tmp_dir}/empty-required-reference.json"
jq '.components.schemas.Book.required = []' \
  "${tmp_dir}/empty-required-reference.json" \
  > "${tmp_dir}/empty-required-candidate.json"
run_check \
  "invalid-30-empty-required" \
  2 \
  "${tmp_dir}/empty-required-candidate.json" \
  "${tmp_dir}/empty-required-reference.json"
assert_contains \
  "${tmp_dir}/invalid-30-empty-required.md" \
  "- Structural contract: changed"

jq '.openapi = "3.1.0"' \
  "${tmp_dir}/empty-required-reference.json" \
  > "${tmp_dir}/empty-required-31-reference.json"
jq '.components.schemas.Book.required = []' \
  "${tmp_dir}/empty-required-31-reference.json" \
  > "${tmp_dir}/empty-required-31-candidate.json"
run_check \
  "empty-required-31" \
  0 \
  "${tmp_dir}/empty-required-31-candidate.json" \
  "${tmp_dir}/empty-required-31-reference.json"
assert_contains \
  "${tmp_dir}/empty-required-31.log" \
  "No OpenAPI drift detected."

jq '
  .openapi = "3.1.0"
  | .components.schemas.EmptySchemaMaps = {"type": "object"}
' "${REFERENCE}" > "${tmp_dir}/empty-schema-maps-reference.json"
jq '
  .components.schemas.EmptySchemaMaps.properties = {}
  | .components.schemas.EmptySchemaMaps.patternProperties = {}
  | .components.schemas.EmptySchemaMaps["$defs"] = {}
  | .components.schemas.EmptySchemaMaps.dependentSchemas = {}
  | .components.schemas.EmptySchemaMaps.dependentRequired = {}
' "${tmp_dir}/empty-schema-maps-reference.json" \
  > "${tmp_dir}/empty-schema-maps-candidate.json"
run_check \
  "empty-schema-maps" \
  0 \
  "${tmp_dir}/empty-schema-maps-candidate.json" \
  "${tmp_dir}/empty-schema-maps-reference.json"
assert_contains \
  "${tmp_dir}/empty-schema-maps.log" \
  "No OpenAPI drift detected."

jq '.components.schemas.Book.required = false' \
  "${tmp_dir}/empty-required-reference.json" \
  > "${tmp_dir}/invalid-required-schema.json"
run_check \
  "invalid-required-schema" \
  2 \
  "${tmp_dir}/invalid-required-schema.json" \
  "${tmp_dir}/empty-required-reference.json"
assert_contains \
  "${tmp_dir}/invalid-required-schema.md" \
  "- Structural contract: changed"

jq '
  .components.requestBodies.OptionalBody = {
    "content": {
      "application/json": {
        "schema": {"type": "string"}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/request-body-required-reference.json"
jq '.components.requestBodies.OptionalBody.required = false' \
  "${tmp_dir}/request-body-required-reference.json" \
  > "${tmp_dir}/request-body-required-candidate.json"
run_check \
  "request-body-required" \
  0 \
  "${tmp_dir}/request-body-required-candidate.json" \
  "${tmp_dir}/request-body-required-reference.json"
assert_contains \
  "${tmp_dir}/request-body-required.log" \
  "No OpenAPI drift detected."

jq '
  .["x-generator"] = {
    "description": "Root generator metadata"
  }
  | .components["x-generator"] = {
      "description": "Component generator metadata"
    }
' "${REFERENCE}" > "${tmp_dir}/ignored-extensions.json"
run_check "ignored-extensions" 0 "${tmp_dir}/ignored-extensions.json"
assert_contains \
  "${tmp_dir}/ignored-extensions.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/key"].get["x-tool"] = {
    "description": "First nested extension description"
  }
' "${REFERENCE}" > "${tmp_dir}/nested-extension-reference.json"
jq '
  .paths["/key"].get["x-tool"].description
    = "Second nested extension description"
' "${tmp_dir}/nested-extension-reference.json" \
  > "${tmp_dir}/nested-extension-candidate.json"
run_check \
  "nested-extension" \
  0 \
  "${tmp_dir}/nested-extension-candidate.json" \
  "${tmp_dir}/nested-extension-reference.json"
assert_contains \
  "${tmp_dir}/nested-extension.log" \
  "No OpenAPI drift detected."

jq '
  .components.schemas.ExtensionNamedProperty = {
    "type": "object",
    "properties": {
      "x-tool": {
        "type": "string",
        "description": "First schema property description"
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/extension-property-reference.json"
jq '
  .components.schemas.ExtensionNamedProperty.properties["x-tool"].description
    = "Second schema property description"
' "${tmp_dir}/extension-property-reference.json" \
  > "${tmp_dir}/extension-property-candidate.json"
run_check \
  "extension-property" \
  2 \
  "${tmp_dir}/extension-property-candidate.json" \
  "${tmp_dir}/extension-property-reference.json"
assert_contains \
  "${tmp_dir}/extension-property.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/extension-property.md" \
  "- Behavioral descriptions: changed (1)"

jq '.openapi = "3.1.0" | del(.webhooks)' \
  "${REFERENCE}" > "${tmp_dir}/webhook-extension-reference.json"
jq '
  .webhooks["x-generator"] = {
    "description": "Generator metadata for webhooks"
  }
' "${tmp_dir}/webhook-extension-reference.json" \
  > "${tmp_dir}/webhook-extension-candidate.json"
run_check \
  "webhook-extension" \
  0 \
  "${tmp_dir}/webhook-extension-candidate.json" \
  "${tmp_dir}/webhook-extension-reference.json"
assert_contains \
  "${tmp_dir}/webhook-extension.log" \
  "No OpenAPI drift detected."

jq '
  .components.examples.Sample = {
    "summary": "First example summary",
    "description": "First example description",
    "value": {
      "description": "Literal payload description"
    }
  }
' "${REFERENCE}" > "${tmp_dir}/example-metadata-reference.json"
jq '
  .components.examples.Sample.summary = "Second example summary"
  | .components.examples.Sample.description = "Second example description"
' "${tmp_dir}/example-metadata-reference.json" \
  > "${tmp_dir}/example-metadata-candidate.json"
run_check \
  "example-metadata" \
  2 \
  "${tmp_dir}/example-metadata-candidate.json" \
  "${tmp_dir}/example-metadata-reference.json"
assert_contains \
  "${tmp_dir}/example-metadata.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/example-metadata.md" \
  "- Behavioral descriptions: changed (2)"

jq '
  .components.securitySchemes.OAuth = {
    "type": "oauth2",
    "flows": {
      "clientCredentials": {
        "tokenUrl": "https://auth.example.com/token",
        "scopes": {
          "books:read": "Read book records"
        }
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/oauth-scope-reference.json"
jq '
  .components.securitySchemes.OAuth.flows.clientCredentials
    .scopes["books:read"] = "Read books and prices"
' "${tmp_dir}/oauth-scope-reference.json" \
  > "${tmp_dir}/oauth-scope-candidate.json"
run_check \
  "oauth-scope-description" \
  2 \
  "${tmp_dir}/oauth-scope-candidate.json" \
  "${tmp_dir}/oauth-scope-reference.json"
assert_contains \
  "${tmp_dir}/oauth-scope-description.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/oauth-scope-description.md" \
  "- Behavioral descriptions: changed (1)"
assert_contains \
  "${tmp_dir}/oauth-scope-description.md" \
  "scopes.books:read"

jq '
  .components.securitySchemes.InvalidScope = {
    "type": "oauth2",
    "flows": {
      "clientCredentials": {
        "tokenUrl": "https://auth.example.com/token",
        "scopes": {"books:read": ""}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/oauth-scope-type-reference.json"
jq '
  .components.securitySchemes.InvalidScope.flows.clientCredentials
    .scopes["books:read"] = 1
' "${tmp_dir}/oauth-scope-type-reference.json" \
  > "${tmp_dir}/oauth-scope-type-candidate.json"
run_check \
  "oauth-scope-type" \
  2 \
  "${tmp_dir}/oauth-scope-type-candidate.json" \
  "${tmp_dir}/oauth-scope-type-reference.json"
assert_contains \
  "${tmp_dir}/oauth-scope-type.md" \
  "- Structural contract: changed"

jq '.security = [{"ApiKeyAuth": []}]' \
  "${REFERENCE}" > "${tmp_dir}/top-level-security.json"
run_check "top-level-security" 2 "${tmp_dir}/top-level-security.json"
assert_contains \
  "${tmp_dir}/top-level-security.md" \
  "Changed top-level security requirements:"
assert_contains \
  "${tmp_dir}/top-level-security.md" \
  "ApiKeyAuth"

jq '
  .paths["/key"].get.parameters = []
  | .paths["/key"].parameters = []
' "${REFERENCE}" > "${tmp_dir}/empty-parameters.json"
run_check "empty-parameters" 0 "${tmp_dir}/empty-parameters.json"
assert_contains \
  "${tmp_dir}/empty-parameters.log" \
  "No OpenAPI drift detected."

jq '.paths["/key"].get.parameters += ["malformed"]' \
  "${REFERENCE}" > "${tmp_dir}/scalar-parameter.json"
run_check "scalar-parameter" 2 "${tmp_dir}/scalar-parameter.json"
assert_contains \
  "${tmp_dir}/scalar-parameter.md" \
  "- Structural contract: changed"

jq 'del(.paths["/key"].get.tags)' \
  "${REFERENCE}" > "${tmp_dir}/empty-tags-reference.json"
jq '.paths["/key"].get.tags = []' \
  "${tmp_dir}/empty-tags-reference.json" \
  > "${tmp_dir}/empty-tags-candidate.json"
run_check \
  "empty-tags" \
  0 \
  "${tmp_dir}/empty-tags-candidate.json" \
  "${tmp_dir}/empty-tags-reference.json"
assert_contains \
  "${tmp_dir}/empty-tags.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/key"].get.parameters += [{
    "name": "X-Trace-Id",
    "in": "header",
    "description": "Correlates the request across services",
    "schema": {"type": "string"}
  }]
' "${REFERENCE}" > "${tmp_dir}/header-name-case-reference.json"
jq '
  (.paths["/key"].get.parameters[]
    | select(.in == "header")
    | .name) = "x-trace-id"
' "${tmp_dir}/header-name-case-reference.json" \
  > "${tmp_dir}/header-name-case-candidate.json"
run_check \
  "header-name-case" \
  0 \
  "${tmp_dir}/header-name-case-candidate.json" \
  "${tmp_dir}/header-name-case-reference.json"
assert_contains \
  "${tmp_dir}/header-name-case.log" \
  "No OpenAPI drift detected."

jq '.info.version = "9.9.9"' "${REFERENCE}" > "${tmp_dir}/version.json"
run_check "version-only" 2 "${tmp_dir}/version.json"
assert_contains "${tmp_dir}/version-only.md" "- Metadata version: changed"
assert_contains "${tmp_dir}/version-only.md" "- Structural contract: unchanged"
assert_contains "${tmp_dir}/version-only.md" "- Behavioral descriptions: unchanged"

jq '.info.version = "1"' \
  "${REFERENCE}" > "${tmp_dir}/version-type-reference.json"
jq '.info.version = 1' \
  "${tmp_dir}/version-type-reference.json" \
  > "${tmp_dir}/version-type-candidate.json"
run_check \
  "version-type" \
  2 \
  "${tmp_dir}/version-type-candidate.json" \
  "${tmp_dir}/version-type-reference.json"
assert_contains \
  "${tmp_dir}/version-type.md" \
  "- Metadata version: changed"
assert_contains \
  "${tmp_dir}/version-type.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/version-type.md" \
  '- Reference version: `"1"`'
assert_contains \
  "${tmp_dir}/version-type.md" \
  '- Candidate version: `1`'

jq '
  .info.version = "` ![pixel](https://example.invalid/pixel) ` @org/team"
' "${REFERENCE}" > "${tmp_dir}/summary-sanitization.json"
export GITHUB_STEP_SUMMARY="${tmp_dir}/github-step-summary.md"
run_check "summary-sanitization" 2 "${tmp_dir}/summary-sanitization.json"
unset GITHUB_STEP_SUMMARY
assert_contains \
  "${tmp_dir}/github-step-summary.md" \
  "    ## ISBNdb OpenAPI drift report"
if grep -F -- '@org/team' "${tmp_dir}/github-step-summary.md" >/dev/null; then
  fail "Expected the GitHub step summary to neutralize mentions"
fi
if grep -F -- '![pixel]' "${tmp_dir}/github-step-summary.md" \
    | grep -v '^    ' >/dev/null; then
  fail "Expected injected Markdown images to remain in preformatted text"
fi

jq '
  .paths["x-generated-by"] = "test-generator"
  | .info.version = "9.9.9"
' "${REFERENCE}" > "${tmp_dir}/path-extension.json"
run_check "path-extension" 2 "${tmp_dir}/path-extension.json"
assert_contains "${tmp_dir}/path-extension.md" "- Metadata version: changed"
assert_contains "${tmp_dir}/path-extension.md" "- Structural contract: unchanged"

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
  "components.schemas.BookWithPrices.allOf.schema-branch:"
assert_contains \
  "${tmp_dir}/composed-schema-description.md" \
  ".properties.prices.description"

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

jq '.paths["/alias"] = {"$ref": "#/components/pathItems/First"}' \
  "${REFERENCE}" > "${tmp_dir}/path-reference-reference.json"
jq '.paths["/alias"]["$ref"] = "#/components/pathItems/Second"' \
  "${tmp_dir}/path-reference-reference.json" \
  > "${tmp_dir}/path-reference-candidate.json"
run_check \
  "path-reference" \
  2 \
  "${tmp_dir}/path-reference-candidate.json" \
  "${tmp_dir}/path-reference-reference.json"
assert_contains \
  "${tmp_dir}/path-reference.md" \
  "Changed path-level references:"
assert_contains "${tmp_dir}/path-reference.md" '/alias'

jq '
  .webhooks["book.updated"] = {
    "post": {
      "requestBody": {
        "content": {
          "application/json": {
            "schema": {"type": "string"}
          }
        }
      },
      "responses": {
        "200": {"description": "Webhook accepted"}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/webhook-reference.json"
jq '
  .webhooks["book.updated"].post.requestBody.content
    ["application/json"].schema.type = "object"
' "${tmp_dir}/webhook-reference.json" \
  > "${tmp_dir}/webhook-candidate.json"
run_check \
  "webhook" \
  2 \
  "${tmp_dir}/webhook-candidate.json" \
  "${tmp_dir}/webhook-reference.json"
assert_contains "${tmp_dir}/webhook.md" "Changed webhooks:"
assert_contains "${tmp_dir}/webhook.md" 'book.updated'

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

jq '
  .paths["/key"].get.nullable = false
  | .paths["/key"].get.readOnly = false
  | .paths["/key"].get.writeOnly = false
  | .paths["/key"].get.uniqueItems = false
' "${REFERENCE}" > "${tmp_dir}/invalid-operation-schema-defaults.json"
run_check \
  "invalid-operation-schema-defaults" \
  2 \
  "${tmp_dir}/invalid-operation-schema-defaults.json"
assert_contains \
  "${tmp_dir}/invalid-operation-schema-defaults.md" \
  "- Structural contract: changed"

jq '.openapi = "3.1.0" | del(.components.schemas.Book.nullable)' \
  "${REFERENCE}" > "${tmp_dir}/nullable-31-reference.json"
jq '.components.schemas.Book.nullable = false' \
  "${tmp_dir}/nullable-31-reference.json" \
  > "${tmp_dir}/nullable-31-candidate.json"
run_check \
  "nullable-31" \
  2 \
  "${tmp_dir}/nullable-31-candidate.json" \
  "${tmp_dir}/nullable-31-reference.json"
assert_contains \
  "${tmp_dir}/nullable-31.md" \
  "- Structural contract: changed"

jq '.info = "malformed"' \
  "${REFERENCE}" > "${tmp_dir}/malformed-info.json"
run_check "malformed-info" 2 "${tmp_dir}/malformed-info.json"
assert_contains \
  "${tmp_dir}/malformed-info.md" \
  "- Structural contract: changed"

jq '.servers += ["malformed"]' \
  "${REFERENCE}" > "${tmp_dir}/scalar-server.json"
run_check "scalar-server" 2 "${tmp_dir}/scalar-server.json"
assert_contains \
  "${tmp_dir}/scalar-server.md" \
  "- Structural contract: changed"

jq '
  .openapi = "3.1.0"
  | .components.schemas.AnnotatedExample = {
      "type": "object",
      "examples": [{"description": "First literal description"}]
    }
' "${REFERENCE}" > "${tmp_dir}/schema-examples-reference.json"
jq '
  .components.schemas.AnnotatedExample.examples[0].description
    = "Second literal description"
' "${tmp_dir}/schema-examples-reference.json" \
  > "${tmp_dir}/schema-examples-candidate.json"
run_check \
  "schema-examples-array" \
  0 \
  "${tmp_dir}/schema-examples-candidate.json" \
  "${tmp_dir}/schema-examples-reference.json"
assert_contains \
  "${tmp_dir}/schema-examples-array.log" \
  "No OpenAPI drift detected."

jq '.components.schemas = "malformed"' \
  "${REFERENCE}" > "${tmp_dir}/scalar-component-section.json"
run_check \
  "scalar-component-section" \
  2 \
  "${tmp_dir}/scalar-component-section.json"
assert_contains \
  "${tmp_dir}/scalar-component-section.md" \
  "- Structural contract: changed"

jq '.paths["/key"].get.callbacks = {}' \
  "${REFERENCE}" > "${tmp_dir}/empty-operation-callbacks.json"
run_check \
  "empty-operation-callbacks" \
  0 \
  "${tmp_dir}/empty-operation-callbacks.json"
assert_contains \
  "${tmp_dir}/empty-operation-callbacks.log" \
  "No OpenAPI drift detected."

jq -n 'null' > "${tmp_dir}/non-object-root.json"
run_check "non-object-root" 2 "${tmp_dir}/non-object-root.json"
assert_contains \
  "${tmp_dir}/non-object-root.md" \
  "- Structural contract: changed"

jq '
  .paths["/key"].get.allowReserved = false
  | .paths["/key"].get.allowEmptyValue = false
' "${REFERENCE}" > "${tmp_dir}/invalid-operation-parameter-defaults.json"
run_check \
  "invalid-operation-parameter-defaults" \
  2 \
  "${tmp_dir}/invalid-operation-parameter-defaults.json"
assert_contains \
  "${tmp_dir}/invalid-operation-parameter-defaults.md" \
  "- Structural contract: changed"

jq '.paths["/book/{isbn}"].get.responses["404"].description = ""' \
  "${REFERENCE}" > "${tmp_dir}/null-description-reference.json"
jq '.paths["/book/{isbn}"].get.responses["404"].description = null' \
  "${tmp_dir}/null-description-reference.json" \
  > "${tmp_dir}/null-description-candidate.json"
run_check \
  "null-description" \
  2 \
  "${tmp_dir}/null-description-candidate.json" \
  "${tmp_dir}/null-description-reference.json"
assert_contains \
  "${tmp_dir}/null-description.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/null-description.md" \
  "- Behavioral descriptions: unchanged"

jq '.unexpected = 1' \
  "${REFERENCE}" > "${tmp_dir}/unknown-root-field.json"
run_check "unknown-root-field" 2 "${tmp_dir}/unknown-root-field.json"
assert_contains \
  "${tmp_dir}/unknown-root-field.md" \
  "- Structural contract: changed"

jq '
  .components.schemas.ModifiedBranch = {
    "oneOf": [
      {"type": "string", "description": "The documented branch"},
      {"type": "boolean", "description": "The fallback branch"}
    ]
  }
' "${REFERENCE}" > "${tmp_dir}/modified-branch-reference.json"
jq '.components.schemas.ModifiedBranch.oneOf[0].type = "integer"' \
  "${tmp_dir}/modified-branch-reference.json" \
  > "${tmp_dir}/modified-branch-candidate.json"
run_check \
  "modified-branch-description" \
  2 \
  "${tmp_dir}/modified-branch-candidate.json" \
  "${tmp_dir}/modified-branch-reference.json"
assert_contains \
  "${tmp_dir}/modified-branch-description.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/modified-branch-description.md" \
  "- Behavioral descriptions: unchanged"

jq '.components.schemas.Book["$defs"] = {}' \
  "${REFERENCE}" > "${tmp_dir}/invalid-30-empty-defs.json"
run_check \
  "invalid-30-empty-defs" \
  2 \
  "${tmp_dir}/invalid-30-empty-defs.json"
assert_contains \
  "${tmp_dir}/invalid-30-empty-defs.md" \
  "- Structural contract: changed"

jq '
  .paths["/book/{isbn}"].get.responses["200"].headers.ratelimit
    as $original
  | .paths["/book/{isbn}"].get.responses["200"].headers.ratelimit
      .schema.type = "integer"
  | .paths["/book/{isbn}"].get.responses["200"].headers.RATELIMIT
      = $original
' "${REFERENCE}" > "${tmp_dir}/colliding-header-names.json"
run_check \
  "colliding-header-names" \
  2 \
  "${tmp_dir}/colliding-header-names.json"
assert_contains \
  "${tmp_dir}/colliding-header-names.md" \
  "- Structural contract: changed"

jq '
  .components.schemas.ModifiedBranch.oneOf[0].description
    as $first_description
  | .components.schemas.ModifiedBranch.oneOf[1].description
    as $second_description
  | .components.schemas.ModifiedBranch.oneOf[0].description
      = $second_description
  | .components.schemas.ModifiedBranch.oneOf[1].description
      = $first_description
' "${tmp_dir}/modified-branch-reference.json" \
  > "${tmp_dir}/swapped-branch-descriptions.json"
run_check \
  "swapped-branch-descriptions" \
  2 \
  "${tmp_dir}/swapped-branch-descriptions.json" \
  "${tmp_dir}/modified-branch-reference.json"
assert_contains \
  "${tmp_dir}/swapped-branch-descriptions.md" \
  "- Structural contract: unchanged"
assert_contains \
  "${tmp_dir}/swapped-branch-descriptions.md" \
  "- Behavioral descriptions: changed (2)"

jq '.components.unexpected = {}' \
  "${REFERENCE}" > "${tmp_dir}/unknown-empty-component-section.json"
run_check \
  "unknown-empty-component-section" \
  2 \
  "${tmp_dir}/unknown-empty-component-section.json"
assert_contains \
  "${tmp_dir}/unknown-empty-component-section.md" \
  "- Structural contract: changed"

jq '
  .servers += [{
    "url": "https://{environment}.example.com",
    "variables": {
      "environment": {
        "default": "prod",
        "enum": ["prod", "staging"]
      }
    }
  }]
' "${REFERENCE}" > "${tmp_dir}/server-variable-enum-reference.json"
jq '.servers[-1].variables.environment.enum |= reverse' \
  "${tmp_dir}/server-variable-enum-reference.json" \
  > "${tmp_dir}/server-variable-enum-candidate.json"
run_check \
  "server-variable-enum-order" \
  0 \
  "${tmp_dir}/server-variable-enum-candidate.json" \
  "${tmp_dir}/server-variable-enum-reference.json"
assert_contains \
  "${tmp_dir}/server-variable-enum-order.log" \
  "No OpenAPI drift detected."

jq '.components.schemas.Book["$comment"] = "Invalid 3.0 annotation"' \
  "${REFERENCE}" > "${tmp_dir}/invalid-30-schema-comment.json"
run_check \
  "invalid-30-schema-comment" \
  2 \
  "${tmp_dir}/invalid-30-schema-comment.json"
assert_contains \
  "${tmp_dir}/invalid-30-schema-comment.md" \
  "- Structural contract: changed"

jq '
  .components.schemas.Book.minLength = 0
  | .components.schemas.Book.minItems = 0
  | .components.schemas.Book.minProperties = 0
' "${REFERENCE}" > "${tmp_dir}/schema-zero-lower-bounds.json"
run_check \
  "schema-zero-lower-bounds" \
  0 \
  "${tmp_dir}/schema-zero-lower-bounds.json"
assert_contains \
  "${tmp_dir}/schema-zero-lower-bounds.log" \
  "No OpenAPI drift detected."

jq '.paths["/key"].get.minLength = 0' \
  "${REFERENCE}" > "${tmp_dir}/invalid-operation-zero-bound.json"
run_check \
  "invalid-operation-zero-bound" \
  2 \
  "${tmp_dir}/invalid-operation-zero-bound.json"
assert_contains \
  "${tmp_dir}/invalid-operation-zero-bound.md" \
  "- Structural contract: changed"

jq '.info.unexpected = 1' \
  "${REFERENCE}" > "${tmp_dir}/unknown-info-field.json"
run_check "unknown-info-field" 2 "${tmp_dir}/unknown-info-field.json"
assert_contains \
  "${tmp_dir}/unknown-info-field.md" \
  "- Structural contract: changed"

jq '.externalDocs = null' \
  "${REFERENCE}" > "${tmp_dir}/malformed-root-external-docs.json"
run_check \
  "malformed-root-external-docs" \
  2 \
  "${tmp_dir}/malformed-root-external-docs.json"
assert_contains \
  "${tmp_dir}/malformed-root-external-docs.md" \
  "- Structural contract: changed"

jq '
  .components.schemas.ModifiedBranch.oneOf[0].type = "integer"
  | .components.schemas.ModifiedBranch.oneOf[0].description
      as $first_description
  | .components.schemas.ModifiedBranch.oneOf[1].description
      as $second_description
  | .components.schemas.ModifiedBranch.oneOf[0].description
      = $second_description
  | .components.schemas.ModifiedBranch.oneOf[1].description
      = $first_description
' "${tmp_dir}/modified-branch-reference.json" \
  > "${tmp_dir}/modified-and-swapped-branch-candidate.json"
run_check \
  "modified-and-swapped-branch" \
  2 \
  "${tmp_dir}/modified-and-swapped-branch-candidate.json" \
  "${tmp_dir}/modified-branch-reference.json"
assert_contains \
  "${tmp_dir}/modified-and-swapped-branch.md" \
  "- Structural contract: changed"
assert_contains \
  "${tmp_dir}/modified-and-swapped-branch.md" \
  "- Behavioral descriptions: changed (2)"

jq '.paths["/key"].get.title = "Invalid operation title"' \
  "${REFERENCE}" > "${tmp_dir}/invalid-operation-title.json"
run_check \
  "invalid-operation-title" \
  2 \
  "${tmp_dir}/invalid-operation-title.json"
assert_contains \
  "${tmp_dir}/invalid-operation-title.md" \
  "- Structural contract: changed"

jq '.webhooks = {}' \
  "${REFERENCE}" > "${tmp_dir}/invalid-30-empty-webhooks.json"
run_check \
  "invalid-30-empty-webhooks" \
  2 \
  "${tmp_dir}/invalid-30-empty-webhooks.json"
assert_contains \
  "${tmp_dir}/invalid-30-empty-webhooks.md" \
  "- Structural contract: changed"

jq '.tags += ["malformed"]' \
  "${REFERENCE}" > "${tmp_dir}/malformed-root-tag.json"
run_check "malformed-root-tag" 2 "${tmp_dir}/malformed-root-tag.json"
assert_contains \
  "${tmp_dir}/malformed-root-tag.md" \
  "- Structural contract: changed"

jq '.paths["/key"].get.security += [.paths["/key"].get.security[0]]' \
  "${REFERENCE}" > "${tmp_dir}/duplicate-security-alternative.json"
run_check \
  "duplicate-security-alternative" \
  0 \
  "${tmp_dir}/duplicate-security-alternative.json"
assert_contains \
  "${tmp_dir}/duplicate-security-alternative.log" \
  "No OpenAPI drift detected."

jq '
  .openapi = "3.1.0"
  | del(.jsonSchemaDialect)
' "${REFERENCE}" > "${tmp_dir}/schema-dialect-keyword-reference.json"
jq '
  .components.schemas.Book["$schema"]
    = "https://spec.openapis.org/oas/3.1/dialect/base"
' "${tmp_dir}/schema-dialect-keyword-reference.json" \
  > "${tmp_dir}/schema-dialect-keyword-candidate.json"
run_check \
  "schema-dialect-keyword" \
  0 \
  "${tmp_dir}/schema-dialect-keyword-candidate.json" \
  "${tmp_dir}/schema-dialect-keyword-reference.json"
assert_contains \
  "${tmp_dir}/schema-dialect-keyword.log" \
  "No OpenAPI drift detected."

jq '
  .openapi = "3.1.0"
  | .jsonSchemaDialect = "https://json-schema.org/draft/2020-12/schema"
' "${REFERENCE}" > "${tmp_dir}/custom-schema-dialect-reference.json"
jq '
  .components.schemas.Book["$schema"] = .jsonSchemaDialect
' "${tmp_dir}/custom-schema-dialect-reference.json" \
  > "${tmp_dir}/custom-schema-dialect-candidate.json"
run_check \
  "custom-schema-dialect-keyword" \
  0 \
  "${tmp_dir}/custom-schema-dialect-candidate.json" \
  "${tmp_dir}/custom-schema-dialect-reference.json"
assert_contains \
  "${tmp_dir}/custom-schema-dialect-keyword.log" \
  "No OpenAPI drift detected."

jq 'del(.paths)' \
  "${REFERENCE}" > "${tmp_dir}/missing-required-paths.json"
run_check \
  "missing-required-paths" \
  2 \
  "${tmp_dir}/missing-required-paths.json"
assert_contains \
  "${tmp_dir}/missing-required-paths.md" \
  "- Structural contract: changed"

jq '
  .components.requestBodies.EncodingHeaders = {
    "content": {
      "multipart/form-data": {
        "schema": {"type": "object"},
        "encoding": {"value": {}}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/encoding-headers-reference.json"
jq '
  .components.requestBodies.EncodingHeaders.content["multipart/form-data"]
    .encoding.value.headers = {}
' "${tmp_dir}/encoding-headers-reference.json" \
  > "${tmp_dir}/encoding-headers-candidate.json"
run_check \
  "empty-encoding-headers" \
  0 \
  "${tmp_dir}/encoding-headers-candidate.json" \
  "${tmp_dir}/encoding-headers-reference.json"
assert_contains \
  "${tmp_dir}/empty-encoding-headers.log" \
  "No OpenAPI drift detected."

jq '
  .openapi = "3.1.0"
  | .components.schemas.Tuple = {"type": "array"}
' "${REFERENCE}" > "${tmp_dir}/empty-prefix-items-reference.json"
jq '.components.schemas.Tuple.prefixItems = []' \
  "${tmp_dir}/empty-prefix-items-reference.json" \
  > "${tmp_dir}/empty-prefix-items-candidate.json"
run_check \
  "empty-prefix-items" \
  0 \
  "${tmp_dir}/empty-prefix-items-candidate.json" \
  "${tmp_dir}/empty-prefix-items-reference.json"
assert_contains \
  "${tmp_dir}/empty-prefix-items.log" \
  "No OpenAPI drift detected."

jq '.paths["/book/{isbn}"].get.responses["404"].description = ""' \
  "${REFERENCE}" > "${tmp_dir}/required-response-description-reference.json"
jq 'del(.paths["/book/{isbn}"].get.responses["404"].description)' \
  "${tmp_dir}/required-response-description-reference.json" \
  > "${tmp_dir}/required-response-description-candidate.json"
run_check \
  "missing-response-description" \
  2 \
  "${tmp_dir}/required-response-description-candidate.json" \
  "${tmp_dir}/required-response-description-reference.json"
assert_contains \
  "${tmp_dir}/missing-response-description.md" \
  "- Structural contract: changed"

jq '
  .components.requestBodies.EmptyEncoding = {
    "content": {
      "multipart/form-data": {
        "schema": {"type": "object"}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/empty-media-encoding-reference.json"
jq '
  .components.requestBodies.EmptyEncoding.content["multipart/form-data"]
    .encoding = {}
' "${tmp_dir}/empty-media-encoding-reference.json" \
  > "${tmp_dir}/empty-media-encoding-candidate.json"
run_check \
  "empty-media-encoding" \
  0 \
  "${tmp_dir}/empty-media-encoding-candidate.json" \
  "${tmp_dir}/empty-media-encoding-reference.json"
assert_contains \
  "${tmp_dir}/empty-media-encoding.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/book/{isbn}"].get.parameters += [
    [{"description": "Nested malformed parameter description"}]
  ]
' "${REFERENCE}" > "${tmp_dir}/nested-malformed-parameter.json"
run_check \
  "nested-malformed-parameter" \
  2 \
  "${tmp_dir}/nested-malformed-parameter.json"
assert_contains \
  "${tmp_dir}/nested-malformed-parameter.md" \
  "- Structural contract: changed"

jq '
  (.paths["/book/{isbn}"].get.parameters[]
   | select(.name == "with_prices")
   | .examples) = null
' "${REFERENCE}" > "${tmp_dir}/malformed-parameter-examples.json"
run_check \
  "malformed-parameter-examples" \
  2 \
  "${tmp_dir}/malformed-parameter-examples.json"
assert_contains \
  "${tmp_dir}/malformed-parameter-examples.md" \
  "- Structural contract: changed"

for info_field in contact license termsOfService; do
  jq --arg field "${info_field}" '.info[$field] = null' \
    "${REFERENCE}" > "${tmp_dir}/malformed-info-${info_field}.json"
  run_check \
    "malformed-info-${info_field}" \
    2 \
    "${tmp_dir}/malformed-info-${info_field}.json"
  assert_contains \
    "${tmp_dir}/malformed-info-${info_field}.md" \
    "- Structural contract: changed"
done

jq '
  .openapi = "3.1.0"
  | .components.schemas.ContainsValue = {
      "type": "array",
      "contains": {"type": "string"}
    }
' "${REFERENCE}" > "${tmp_dir}/min-contains-reference.json"
jq '.components.schemas.ContainsValue.minContains = 1' \
  "${tmp_dir}/min-contains-reference.json" \
  > "${tmp_dir}/min-contains-candidate.json"
run_check \
  "default-min-contains" \
  0 \
  "${tmp_dir}/min-contains-candidate.json" \
  "${tmp_dir}/min-contains-reference.json"
assert_contains \
  "${tmp_dir}/default-min-contains.log" \
  "No OpenAPI drift detected."

jq '.components.schemas.Book.minContains = 1' \
  "${REFERENCE}" > "${tmp_dir}/invalid-30-min-contains.json"
run_check \
  "invalid-30-min-contains" \
  2 \
  "${tmp_dir}/invalid-30-min-contains.json"
assert_contains \
  "${tmp_dir}/invalid-30-min-contains.md" \
  "- Structural contract: changed"

jq '
  .paths["/book/{isbn}"].get.security[0].OAuth += ["books:read"]
' "${tmp_dir}/security-scope-reference.json" \
  > "${tmp_dir}/duplicate-security-scope.json"
run_check \
  "duplicate-security-scope" \
  0 \
  "${tmp_dir}/duplicate-security-scope.json" \
  "${tmp_dir}/security-scope-reference.json"
assert_contains \
  "${tmp_dir}/duplicate-security-scope.log" \
  "No OpenAPI drift detected."

jq '
  .components.links.EmptyParameters = {
    "operationId": "getBooks"
  }
' "${REFERENCE}" > "${tmp_dir}/empty-link-parameters-reference.json"
jq '.components.links.EmptyParameters.parameters = {}' \
  "${tmp_dir}/empty-link-parameters-reference.json" \
  > "${tmp_dir}/empty-link-parameters-candidate.json"
run_check \
  "empty-link-parameters" \
  0 \
  "${tmp_dir}/empty-link-parameters-candidate.json" \
  "${tmp_dir}/empty-link-parameters-reference.json"
assert_contains \
  "${tmp_dir}/empty-link-parameters.log" \
  "No OpenAPI drift detected."

jq '
  .components.schemas.Discriminated = {
    "type": "object",
    "discriminator": {"propertyName": "kind"}
  }
' "${REFERENCE}" > "${tmp_dir}/empty-discriminator-mapping-reference.json"
jq '.components.schemas.Discriminated.discriminator.mapping = {}' \
  "${tmp_dir}/empty-discriminator-mapping-reference.json" \
  > "${tmp_dir}/empty-discriminator-mapping-candidate.json"
run_check \
  "empty-discriminator-mapping" \
  0 \
  "${tmp_dir}/empty-discriminator-mapping-candidate.json" \
  "${tmp_dir}/empty-discriminator-mapping-reference.json"
assert_contains \
  "${tmp_dir}/empty-discriminator-mapping.log" \
  "No OpenAPI drift detected."

jq '
  .components.securitySchemes.EmptyScope = {
    "type": "oauth2",
    "flows": {
      "clientCredentials": {
        "tokenUrl": "https://auth.example.com/token",
        "scopes": {"books:read": ""}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/malformed-scope-description-reference.json"
jq '
  .components.securitySchemes.EmptyScope.flows.clientCredentials
    .scopes["books:read"] = null
' "${tmp_dir}/malformed-scope-description-reference.json" \
  > "${tmp_dir}/malformed-scope-description-candidate.json"
run_check \
  "malformed-scope-description" \
  2 \
  "${tmp_dir}/malformed-scope-description-candidate.json" \
  "${tmp_dir}/malformed-scope-description-reference.json"
assert_contains \
  "${tmp_dir}/malformed-scope-description.md" \
  "- Structural contract: changed"

jq '
  .components.requestBodies.DefaultContentType = {
    "content": {
      "multipart/form-data": {
        "schema": {
          "type": "object",
          "properties": {
            "payload": {"type": "object"}
          }
        },
        "encoding": {"payload": {}}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/encoding-content-type-reference.json"
jq '
  .components.requestBodies.DefaultContentType.content["multipart/form-data"]
    .encoding.payload.contentType = "application/json"
' "${tmp_dir}/encoding-content-type-reference.json" \
  > "${tmp_dir}/encoding-content-type-candidate.json"
run_check \
  "default-encoding-content-type" \
  0 \
  "${tmp_dir}/encoding-content-type-candidate.json" \
  "${tmp_dir}/encoding-content-type-reference.json"
assert_contains \
  "${tmp_dir}/default-encoding-content-type.log" \
  "No OpenAPI drift detected."

jq '
  .paths["/book/{isbn}"].get.responses["404"].externalDocs = {
    "url": "https://example.com/invalid-response-docs"
  }
' "${REFERENCE}" > "${tmp_dir}/invalid-response-external-docs.json"
run_check \
  "invalid-response-external-docs" \
  2 \
  "${tmp_dir}/invalid-response-external-docs.json"
assert_contains \
  "${tmp_dir}/invalid-response-external-docs.md" \
  "- Structural contract: changed"

jq '.tags[0].unexpected = 1' \
  "${REFERENCE}" > "${tmp_dir}/invalid-root-tag-field.json"
run_check \
  "invalid-root-tag-field" \
  2 \
  "${tmp_dir}/invalid-root-tag-field.json"
assert_contains \
  "${tmp_dir}/invalid-root-tag-field.md" \
  "- Structural contract: changed"

jq '.paths["/book/{isbn}"].get.tags += [.paths["/book/{isbn}"].get.tags[0]]' \
  "${REFERENCE}" > "${tmp_dir}/duplicate-operation-tag.json"
run_check \
  "duplicate-operation-tag" \
  0 \
  "${tmp_dir}/duplicate-operation-tag.json"
assert_contains \
  "${tmp_dir}/duplicate-operation-tag.log" \
  "No OpenAPI drift detected."

jq '
  .components.requestBodies.MediaTypeCase = {
    "content": {
      "application/json": {
        "schema": {"type": "object"}
      }
    }
  }
' "${REFERENCE}" > "${tmp_dir}/media-type-case-reference.json"
jq '
  .components.requestBodies.MediaTypeCase.content
    |= with_entries(.key = "Application/JSON")
' "${tmp_dir}/media-type-case-reference.json" \
  > "${tmp_dir}/media-type-case-candidate.json"
run_check \
  "media-type-case" \
  0 \
  "${tmp_dir}/media-type-case-candidate.json" \
  "${tmp_dir}/media-type-case-reference.json"
assert_contains \
  "${tmp_dir}/media-type-case.log" \
  "No OpenAPI drift detected."

jq '
  .components.requestBodies.MediaTypeCase.content["Application/JSON"] = {
    "schema": {"type": "string"}
  }
' "${tmp_dir}/media-type-case-reference.json" \
  > "${tmp_dir}/media-type-case-collision.json"
run_check \
  "media-type-case-collision" \
  2 \
  "${tmp_dir}/media-type-case-collision.json" \
  "${tmp_dir}/media-type-case-reference.json"
assert_contains \
  "${tmp_dir}/media-type-case-collision.md" \
  "- Structural contract: changed"

jq '
  .components.links.ServerLink = {
    "operationId": "getBooks",
    "server": {"url": "https://api.example.com"}
  }
' "${REFERENCE}" > "${tmp_dir}/link-server-reference.json"
jq '.components.links.ServerLink.server.variables = {}' \
  "${tmp_dir}/link-server-reference.json" \
  > "${tmp_dir}/link-server-candidate.json"
run_check \
  "empty-link-server-variables" \
  0 \
  "${tmp_dir}/link-server-candidate.json" \
  "${tmp_dir}/link-server-reference.json"
assert_contains \
  "${tmp_dir}/empty-link-server-variables.log" \
  "No OpenAPI drift detected."

jq '.components.schemas.Book.additionalProperties = {}' \
  "${REFERENCE}" > "${tmp_dir}/empty-additional-properties.json"
run_check \
  "empty-additional-properties" \
  0 \
  "${tmp_dir}/empty-additional-properties.json"
assert_contains \
  "${tmp_dir}/empty-additional-properties.log" \
  "No OpenAPI drift detected."

echo "API spec drift diagnostics tests passed."

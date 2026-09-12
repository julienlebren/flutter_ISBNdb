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
  .components.schemas.Conditional = {
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
run_check "external-docs" 0 "${tmp_dir}/external-docs.json"
assert_contains "${tmp_dir}/external-docs.log" "No OpenAPI drift detected."

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

for root_field in security components webhooks; do
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
jq '.servers = [{"url": "/"}]' \
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
  "empty-required" \
  0 \
  "${tmp_dir}/empty-required-candidate.json" \
  "${tmp_dir}/empty-required-reference.json"
assert_contains \
  "${tmp_dir}/empty-required.log" \
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

echo "API spec drift diagnostics tests passed."

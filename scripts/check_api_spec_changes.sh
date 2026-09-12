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
    def is_map_keyword:
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
      or . == "pathItems"
      or . == "properties"
      or . == "patternProperties"
      or . == "$defs"
      or . == "definitions"
      or . == "dependentSchemas"
      or . == "dependentRequired"
      or . == "content"
      or . == "encoding"
      or . == "examples"
      or . == "variables"
      or . == "scopes"
      or . == "mapping";

    def is_named_map($path):
      if ($path | length) == 0 then false
      elif ($path | length) > 1
          and $path[-2] == "callbacks"
          and is_named_map($path[0:-1]) then true
      elif ($path | length) > 1
          and $path[-2] == "security"
          and ($path[-1] | type) == "number"
          and (is_named_map($path[0:-2]) | not) then true
      elif ($path[-1] | is_map_keyword) then
        is_named_map($path[0:-1]) | not
      else false
      end;

    def is_identifier_key($path; $index):
      $index > 0 and is_named_map($path[0:$index]);

    def is_schema_map_keyword:
      . == "schemas"
      or . == "properties"
      or . == "patternProperties"
      or . == "$defs"
      or . == "definitions"
      or . == "dependentSchemas";

    def is_schema_child_keyword:
      . == "items"
      or . == "additionalProperties"
      or . == "unevaluatedProperties"
      or . == "not"
      or . == "if"
      or . == "then"
      or . == "else"
      or . == "contains"
      or . == "propertyNames"
      or . == "unevaluatedItems"
      or . == "contentSchema";

    def is_schema_array_keyword:
      . == "oneOf"
      or . == "anyOf"
      or . == "allOf"
      or . == "prefixItems";

    def is_schema_object($path):
      if ($path | length) == 0 then false
      elif ($path | length) > 1
          and ($path[-2] | type) == "string"
          and ($path[-2] | is_schema_map_keyword)
          and is_named_map($path[0:-1]) then true
      elif $path[-1] == "schema"
          and (is_identifier_key($path; ($path | length) - 1) | not) then true
      elif ($path[-1] | type) == "string"
          and ($path[-1] | is_schema_child_keyword)
          and is_schema_object($path[0:-1]) then true
      elif ($path | length) > 1
          and ($path[-1] | type) == "number"
          and ($path[-2] | type) == "string"
          and ($path[-2] | is_schema_array_keyword)
          and is_schema_object($path[0:-2]) then true
      else false
      end;

    def is_link_object($path):
      ($path | length) > 1
      and $path[-2] == "links"
      and is_named_map($path[0:-1]);

    def is_header_object($path):
      ($path | length) > 1
      and $path[-2] == "headers"
      and is_named_map($path[0:-1]);

    def is_encoding_object($path):
      ($path | length) > 1
      and $path[-2] == "encoding"
      and is_named_map($path[0:-1]);

    def is_media_type_object($path):
      ($path | length) > 1
      and $path[-2] == "content"
      and is_named_map($path[0:-1]);

    def is_discriminator_object($path):
      ($path | length) > 0
      and $path[-1] == "discriminator"
      and is_schema_object($path[0:-1]);

    def is_response_object($path):
      ($path | length) > 1
      and $path[-2] == "responses"
      and is_named_map($path[0:-1]);

    def is_server_object($path):
      ($path | length) > 1
      and $path[-2] == "servers"
      and ($path[-1] | type) == "number"
      and (is_identifier_key($path; ($path | length) - 2) | not);

    def is_server_variable_object($path):
      ($path | length) > 1
      and $path[-2] == "variables"
      and is_named_map($path[0:-1]);

    def is_http_method:
      . == "get"
      or . == "post"
      or . == "put"
      or . == "patch"
      or . == "delete"
      or . == "options"
      or . == "head"
      or . == "trace";

    def is_request_body_object($path):
      (($path | length) > 1
       and $path[-2] == "requestBodies"
       and is_named_map($path[0:-1]))
      or (($path | length) > 1
          and $path[-1] == "requestBody"
          and ($path[-2] | type) == "string"
          and ($path[-2] | is_http_method));

    def is_parameter_object($path):
      ($path | length) > 1
      and $path[-2] == "parameters"
      and is_named_map($path[0:-1]);

    def is_operation_object($path):
      ($path | length) > 0
      and ($path[-1] | type) == "string"
      and ($path[-1] | is_http_method)
      and (is_identifier_key($path; ($path | length) - 1) | not);

    def is_path_item_object($path):
      (($path | length) > 1
       and ($path[-2] == "paths"
            or $path[-2] == "webhooks"
            or $path[-2] == "pathItems")
       and is_named_map($path[0:-1]))
      or (($path | length) > 2
          and $path[-3] == "callbacks"
          and is_named_map($path[0:-2]));

    def is_xml_object($path):
      ($path | length) > 0
      and $path[-1] == "xml"
      and is_schema_object($path[0:-1]);

    def is_deprecated_context($path):
      is_schema_object($path)
      or is_parameter_object($path)
      or is_header_object($path)
      or is_operation_object($path);

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

    def default_json_schema_dialect($version):
      if ($version | type) != "string" then null
      else
        ($version
         | try capture("^(?<major>[0-9]+)\\.(?<minor>[0-9]+)\\.") catch null)
          as $parts
        | if $parts != null
            and ($parts.major | tonumber) == 3
            and ($parts.minor | tonumber) >= 1 then
            "https://spec.openapis.org/oas/\($parts.major).\($parts.minor)/dialect/base"
          else null
          end
      end;

    def supports_json_schema_2020_12($version):
      if ($version | type) != "string" then false
      else
        ($version
         | try capture("^(?<major>[0-9]+)\\.(?<minor>[0-9]+)\\.") catch null)
          as $parts
        | $parts != null
          and ($parts.major | tonumber) == 3
          and ($parts.minor | tonumber) >= 1
      end;

    def is_known_component_section($key; $version):
      ([
         "schemas",
         "responses",
         "parameters",
         "examples",
         "requestBodies",
         "headers",
         "securitySchemes",
         "links",
         "callbacks"
       ] | index($key)) != null
      or ($key == "pathItems" and supports_json_schema_2020_12($version));

    def has_case_insensitive_key_collision:
      (keys | map(ascii_downcase)) as $normalized_keys
      | ($normalized_keys | length) != ($normalized_keys | unique | length);

    def unknown_root_fields:
      with_entries(
        .key as $key
        | select(
            ($key | startswith("x-") | not)
            and ([
              "openapi",
              "info",
              "jsonSchemaDialect",
              "servers",
              "paths",
              "webhooks",
              "components",
              "security",
              "tags",
              "externalDocs"
            ] | index($key) | not)
          )
      );

    def normalize_serialization_defaults($path):
      (if is_header_object($path) then "simple"
       elif is_encoding_object($path) then "form"
       elif is_parameter_object($path) and (.in? | type) == "string" then
         (if .in == "query" or .in == "cookie" then "form"
          elif .in == "path" or .in == "header" then "simple"
          else null
          end)
       else null
       end) as $default_style
      | if $default_style == null then .
        else
          (.style // $default_style) as $effective_style
          | (if .style? == $default_style then del(.style) else . end)
          | (if (.explode? | type) == "boolean"
                and .explode == ($effective_style == "form")
             then del(.explode)
             else .
             end)
        end;

    def schema_default_content_type($schema):
      if ($schema | type) != "object" then null
      elif $schema.type? == "string"
          and ($schema.format? == "binary" or $schema.format? == "base64") then
        "application/octet-stream"
      elif $schema.type? == "object"
          or ($schema.properties? | type) == "object"
          or ($schema.allOf? | type) == "array"
          or ($schema.oneOf? | type) == "array"
          or ($schema.anyOf? | type) == "array" then
        "application/json"
      elif $schema.type? == "array" then
        (schema_default_content_type($schema.items)) as $item_content_type
        | if $item_content_type == "application/json" then
            "application/json"
          elif $item_content_type == "application/octet-stream" then
            "application/octet-stream"
          else
            "text/plain"
          end
      elif $schema.type? == "string"
          or $schema.type? == "number"
          or $schema.type? == "integer"
          or $schema.type? == "boolean" then
        "text/plain"
      else null
      end;

    def default_encoding_content_type($path; $document):
      if is_encoding_object($path)
          and ($path[-1] | type) == "string" then
        ($path[0:-2]) as $media_type_path
        | ($path[-1]) as $property_name
        | (try ($document | getpath($media_type_path + ["schema"])) catch null)
          as $media_schema
        | if ($media_schema | type) == "object"
            and ($media_schema.properties? | type) == "object"
            and ($media_schema.properties | has($property_name)) then
            schema_default_content_type($media_schema.properties[$property_name])
          else null
          end
      else null
      end;

    def normalize_openapi_object(
      $path;
      $openapi_version;
      $schema_dialect;
      $document
    ):
      normalize_serialization_defaults($path)
      | (if is_deprecated_context($path) and .deprecated? == false then
           del(.deprecated)
         else .
         end)
      | (if .required? == false
           and ((is_parameter_object($path)
                 and (.in? == "query" or .in? == "header" or .in? == "cookie"))
                or is_request_body_object($path)
                or is_header_object($path)) then
           del(.required)
         else .
         end)
      | (if .allowReserved? == false
           and (is_encoding_object($path)
                or (is_parameter_object($path) and .in? == "query")) then
           del(.allowReserved)
         else .
         end)
      | (if .allowEmptyValue? == false
           and is_parameter_object($path)
           and .in? == "query" then
           del(.allowEmptyValue)
         else .
         end)
      | (if is_schema_object($path)
           and ($openapi_version | type) == "string"
           and ($openapi_version | startswith("3.0."))
           and .nullable? == false then
           del(.nullable)
         else .
         end)
      | (if is_schema_object($path) and .readOnly? == false then
           del(.readOnly)
         else .
         end)
      | (if is_schema_object($path) and .writeOnly? == false then
           del(.writeOnly)
         else .
         end)
      | (if is_schema_object($path) and .uniqueItems? == false then
           del(.uniqueItems)
         else .
         end)
      | (if is_schema_object($path)
           and (.minLength? | type) == "number"
           and .minLength == 0 then
           del(.minLength)
         else .
         end)
      | (if is_schema_object($path)
           and (.minItems? | type) == "number"
           and .minItems == 0 then
           del(.minItems)
         else .
         end)
      | (if is_schema_object($path)
           and (.minProperties? | type) == "number"
           and .minProperties == 0 then
           del(.minProperties)
         else .
         end)
      | (if is_schema_object($path)
           and supports_json_schema_2020_12($openapi_version)
           and has("contains")
           and (.minContains? | type) == "number"
           and .minContains == 1 then
           del(.minContains)
         else .
         end)
      | (if is_schema_object($path)
           and ($openapi_version | type) == "string"
           and ($openapi_version | startswith("3.0."))
           and .exclusiveMinimum? == false then
           del(.exclusiveMinimum)
         else .
         end)
      | (if is_schema_object($path)
           and ($openapi_version | type) == "string"
           and ($openapi_version | startswith("3.0."))
           and .exclusiveMaximum? == false then
           del(.exclusiveMaximum)
         else .
         end)
      | (if is_xml_object($path) and .attribute? == false then
           del(.attribute)
         else .
         end)
      | (if is_xml_object($path) and .wrapped? == false then
           del(.wrapped)
         else .
         end)
      | (if is_schema_object($path) and .additionalProperties? == true then
           del(.additionalProperties)
         else .
         end)
      | (if is_schema_object($path) and (.required? | type) == "array" then
           .required |= sort
         else .
         end)
      | (if is_schema_object($path)
           and supports_json_schema_2020_12($openapi_version)
           and .required? == [] then
           del(.required)
         else .
         end)
      | (if is_schema_object($path)
           and supports_json_schema_2020_12($openapi_version)
           and .prefixItems? == [] then
           del(.prefixItems)
         else .
         end)
      | (if is_schema_object($path) and (.type? | type) == "array" then
           .type |= sort_by(tostring)
         else .
         end)
      | (if is_schema_object($path) and (.enum? | type) == "array" then
           .enum |= (map(canonical_json) | sort_by(tojson))
         elif is_server_variable_object($path)
             and (.enum? | type) == "array"
             and all(.enum[]; type == "string") then
           .enum |= sort
         else .
         end)
      | (if is_schema_object($path) and (.oneOf? | type) == "array" then
           .oneOf |= (map(canonical_json) | sort_by(tojson))
         else .
         end)
      | (if is_schema_object($path) and (.anyOf? | type) == "array" then
           .anyOf |= (map(canonical_json) | sort_by(tojson))
         else .
         end)
      | (if is_schema_object($path) and (.allOf? | type) == "array" then
           .allOf |= (map(canonical_json) | sort_by(tojson))
         else .
         end)
      | (if (($path | length) == 0 or is_operation_object($path))
           and (.tags? | type) == "array" then
           .tags |= sort
         else .
         end)
      | (if (($path | length) == 0 or is_operation_object($path))
           and .tags? == [] then
           del(.tags)
         else .
         end)
      | (if is_parameter_object($path)
           and .in? == "header"
           and (.name? | type) == "string" then
           .name |= ascii_downcase
         else .
         end)
      | (if (is_path_item_object($path) or is_operation_object($path))
           and (.parameters? | type) == "array" then
           .parameters |= sort_by(
             if type == "object" then
               [0, .in // "", .name // "", ."$ref" // ""]
             else
               [1, type, tojson]
             end
           )
         else .
         end)
      | (if (is_path_item_object($path) or is_operation_object($path))
           and .parameters? == [] then
           del(.parameters)
         else .
         end)
      | (if (($path | length) == 0 or is_operation_object($path))
           and (.security? | type) == "array" then
           .security |= (
             map(
               if type == "object" then
                 (to_entries
                  | sort_by(.key)
                  | map(
                      if (.value | type) == "array"
                          and all(.value[]; type == "string") then
                        .value |= (sort | unique)
                      else .
                      end
                    )
                  | from_entries)
               else .
               end
             )
             | sort_by(tojson)
             | unique_by(tojson)
           )
         else .
         end)
      | (if is_operation_object($path) and .callbacks? == {} then
           del(.callbacks)
         else .
         end)
      | (if is_link_object($path) and .parameters? == {} then
           del(.parameters)
         else .
         end)
      | (if is_discriminator_object($path) and .mapping? == {} then
           del(.mapping)
         else .
         end)
      | (if is_response_object($path) then
           (if .headers? == {} then del(.headers) else . end)
           | (if .links? == {} then del(.links) else . end)
           | (if .content? == {} then del(.content) else . end)
         else .
         end)
      | (if is_encoding_object($path) and .headers? == {} then
           del(.headers)
         else .
         end)
      | (default_encoding_content_type($path; $document))
        as $default_content_type
      | (if $default_content_type != null
           and (.contentType? | type) == "string"
           and .contentType == $default_content_type then
           del(.contentType)
         else .
         end)
      | (if is_media_type_object($path) and .encoding? == {} then
           del(.encoding)
         else .
         end)
      | (if is_server_object($path) and .variables? == {} then
           del(.variables)
         else .
         end)
      | (if is_schema_object($path) then
           (if supports_json_schema_2020_12($openapi_version) then
              del(."$comment")
            else .
            end)
           | (if ($schema_dialect | type) == "string"
                 and (."$schema"? | type) == "string"
                 and ."$schema" == $schema_dialect then
                del(."$schema")
              else .
              end)
           | (
               ["properties"]
               + (if supports_json_schema_2020_12($openapi_version) then
                    [
                      "patternProperties",
                      "$defs",
                      "dependentSchemas",
                      "dependentRequired"
                    ]
                  else []
                  end)
             ) as $empty_schema_maps
           | reduce $empty_schema_maps[] as $key
             (.; if .[$key]? == {} then del(.[$key]) else . end)
         else .
         end);

    def normalize_value($path; $openapi_version; $schema_dialect; $document):
      if type == "object" then
        (is_named_map($path)) as $is_named_map
        | (if $is_named_map
              and $path[-1] == "headers"
              and $path != ["components", "headers"] then
             if has_case_insensitive_key_collision then .
             else with_entries(.key |= ascii_downcase)
             end
           elif $is_named_map and $path[-1] == "scopes" then
             with_entries(
               if (.value | type) == "string" then .value = "" else . end
             )
           elif $is_named_map
               and $path[-1] == "dependentRequired"
               and supports_json_schema_2020_12($openapi_version) then
             with_entries(
               if (.value | type) == "array" then .value |= sort else . end
             )
           elif $is_named_map then .
           else
            (if is_response_object($path)
                and has("description")
                and (.description | type) == "string" then
               .description = ""
             elif has("description")
                and (.description | type) == "string" then
               del(.description)
              else .
              end)
            | (if has("summary")
                  and (.summary | type) == "string"
                then del(.summary)
                else .
                end)
             | (if has("externalDocs")
                   and (.externalDocs | type) == "object" then
                  del(.externalDocs)
                else .
                end)
            | (if is_schema_object($path)
                   and has("title")
                   and (.title | type) == "string"
                 then del(.title)
                 else .
                 end)
             | (if has("example")
                   and (is_schema_object($path)
                        or is_parameter_object($path)
                        or is_header_object($path)
                        or is_media_type_object($path)) then
                  del(.example)
                else .
                end)
             | (if has("examples")
                   and (((is_parameter_object($path)
                          or is_header_object($path)
                          or is_media_type_object($path))
                         and (.examples | type) == "object")
                        or (is_schema_object($path)
                            and supports_json_schema_2020_12($openapi_version)
                            and (.examples | type) == "array")
                        or ($path == ["components"]
                            and (.examples | type) == "object")) then
                  del(.examples)
                else .
                end)
           end)
        | to_entries
        | map(
            .key as $key
            | if $is_named_map
                and ($path[-1] == "scopes" or $path[-1] == "dependentRequired")
              then
                .
              elif ($is_named_map | not)
                and ($key == "default" or $key == "enum" or $key == "const")
              then .
              elif is_link_object($path)
                  and ($key == "requestBody" or $key == "parameters")
              then .
              else .value |= normalize_value(
                $path + [$key];
                $openapi_version;
                $schema_dialect;
                $document
              )
              end
          )
        | from_entries
        | if $is_named_map then .
          else normalize_openapi_object(
            $path;
            $openapi_version;
            $schema_dialect;
            $document
          )
          end
      elif type == "array" then
        to_entries
        | map(
            .key as $index
            | .value |= normalize_value(
              $path + [$index];
              $openapi_version;
              $schema_dialect;
              $document
            )
          )
        | map(.value)
      else .
      end;

    if type != "object" then
      {"__invalid_openapi_root__": .}
    else
      . as $root
      | .openapi as $openapi_version
      | (if has("jsonSchemaDialect") then
           if (.jsonSchemaDialect | type) == "string" then
             .jsonSchemaDialect
           else null
           end
         else
           default_json_schema_dialect($openapi_version)
         end) as $schema_dialect
      | (
        {
          openapi,
          info: (
            if has("info") then
              .info as $info
              | if ($info | type) == "object" then
                  ($info
                   | with_entries(select(.key | startswith("x-") | not))
                   | del(.version)
                   | (if (.termsOfService? | type) == "string" then
                        del(.termsOfService)
                      else .
                      end)
                   | (if (.contact? | type) == "object" then
                        del(.contact)
                      else .
                      end)
                   | (if (.license? | type) == "object" then
                        del(.license)
                      else .
                      end))
                else $info
                end
            else null
            end
          ),
        servers: (if has("servers") then .servers else [] end),
        security: (if has("security") then .security else [] end),
        components: (
          (if has("components") then .components else {} end)
          | if type == "object" then
              with_entries(select(.key | startswith("x-") | not))
              | with_entries(
                  select(
                    .value != {}
                    or (is_known_component_section(.key; $openapi_version) | not)
                  )
                )
            else .
            end
        )
        }
        + (
          if supports_json_schema_2020_12($openapi_version) then
            {paths: (
              (if has("paths") then .paths else {} end)
              | if type == "object" then
                  with_entries(select(.key | startswith("x-") | not))
                else .
                end
            )}
          elif has("paths") then
            {paths: (
              .paths
              | if type == "object" then
                  with_entries(select(.key | startswith("x-") | not))
                else .
                end
            )}
          else {}
          end
        )
        + (
          if supports_json_schema_2020_12($openapi_version) then
            {webhooks: (
              (if has("webhooks") then .webhooks else {} end)
              | if type == "object" then
                  with_entries(select(.key | startswith("x-") | not))
                else .
                end
            )}
          elif has("webhooks") then
            {webhooks: .webhooks}
          else {}
          end
        )
        + (
          if has("externalDocs")
              and (.externalDocs | type) != "object" then
            {externalDocs: .externalDocs}
          else {}
          end
        )
        + (
          if has("tags") then
            if (.tags | type) == "array" then
              ([.tags[]
                | select(
                    type != "object"
                    or (.name | type) != "string"
                  )
               ]) as $invalid_tags
              | if ($invalid_tags | length) > 0 then
                  {tags: $invalid_tags}
                else {}
                end
            else
              {tags: .tags}
            end
          else {}
          end
        )
        + (
        (default_json_schema_dialect(.openapi)) as $default_dialect
        | if has("jsonSchemaDialect") then
            if (.jsonSchemaDialect | type) == "string"
                and $default_dialect != null
                and .jsonSchemaDialect == $default_dialect then
              {}
            else
              {jsonSchemaDialect: .jsonSchemaDialect}
            end
          else {}
          end
        )
        + ($root | unknown_root_fields)
      )
      | normalize_value([]; $openapi_version; $schema_dialect; $root)
      | if .servers == [{"url": "/"}] then .servers = [] else . end
    end
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

    def is_map_keyword:
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
      or . == "pathItems"
      or . == "properties"
      or . == "patternProperties"
      or . == "$defs"
      or . == "definitions"
      or . == "dependentSchemas"
      or . == "dependentRequired"
      or . == "content"
      or . == "encoding"
      or . == "examples"
      or . == "variables"
      or . == "scopes"
      or . == "mapping";

    def is_named_map($path):
      if ($path | length) == 0 then false
      elif ($path | length) > 1
          and $path[-2] == "callbacks"
          and is_named_map($path[0:-1]) then true
      elif ($path | length) > 1
          and $path[-2] == "security"
          and ($path[-1] | type) == "number"
          and (is_named_map($path[0:-2]) | not) then true
      elif ($path[-1] | is_map_keyword) then
        is_named_map($path[0:-1]) | not
      else false
      end;

    def is_identifier_key($path; $index):
      $index > 0 and is_named_map($path[0:$index]);

    def is_schema_map_keyword:
      . == "schemas"
      or . == "properties"
      or . == "patternProperties"
      or . == "$defs"
      or . == "definitions"
      or . == "dependentSchemas";

    def is_schema_child_keyword:
      . == "items"
      or . == "additionalProperties"
      or . == "unevaluatedProperties"
      or . == "not"
      or . == "if"
      or . == "then"
      or . == "else"
      or . == "contains"
      or . == "propertyNames"
      or . == "unevaluatedItems"
      or . == "contentSchema";

    def is_schema_array_keyword:
      . == "oneOf"
      or . == "anyOf"
      or . == "allOf"
      or . == "prefixItems";

    def is_schema_object($path):
      if ($path | length) == 0 then false
      elif ($path | length) > 1
          and ($path[-2] | type) == "string"
          and ($path[-2] | is_schema_map_keyword)
          and is_named_map($path[0:-1]) then true
      elif $path[-1] == "schema"
          and (is_identifier_key($path; ($path | length) - 1) | not) then true
      elif ($path[-1] | type) == "string"
          and ($path[-1] | is_schema_child_keyword)
          and is_schema_object($path[0:-1]) then true
      elif ($path | length) > 1
          and ($path[-1] | type) == "number"
          and ($path[-2] | type) == "string"
          and ($path[-2] | is_schema_array_keyword)
          and is_schema_object($path[0:-2]) then true
      else false
      end;

    def is_link_object($path):
      ($path | length) > 1
      and $path[-2] == "links"
      and is_named_map($path[0:-1]);

    def is_oauth_scope_value($path):
      ($path | length) > 1
      and is_named_map($path[0:-1])
      and $path[-2] == "scopes";

    def is_example_object($path):
      ($path | length) > 1
      and $path[-2] == "examples"
      and is_named_map($path[0:-1])
      and (is_schema_object($path[0:-2]) | not);

    def is_example_metadata($path):
      ($path | length) > 0
      and ($path[-1] == "description" or $path[-1] == "summary")
      and is_example_object($path[0:-1]);

    def is_external_docs_description($path):
      ($path | length) > 1
      and $path[-1] == "description"
      and $path[-2] == "externalDocs"
      and (is_identifier_key($path; ($path | length) - 2) | not);

    def is_header_map_key($path; $index):
      $index > 1
      and $path[$index - 1] == "headers"
      and ($path[$index] | type) == "string"
      and is_named_map($path[0:$index])
      and $path[0:$index] != ["components", "headers"];

    def is_server_array_index($path; $index):
      $index > 0
      and $path[$index - 1] == "servers"
      and ($path[$index] | type) == "number"
      and (is_identifier_key($path; $index - 1) | not);

    def is_composition_array_index($path; $index):
      $index > 0
      and ($path[$index] | type) == "number"
      and ($path[$index - 1] == "oneOf"
           or $path[$index - 1] == "anyOf"
           or $path[$index - 1] == "allOf")
      and (is_identifier_key($path; $index - 1) | not);

    def contains_literal_payload($path):
      [
        range(0; $path | length) as $index
        | select(
            ((($path[$index] == "default"
               or $path[$index] == "enum"
             or $path[$index] == "const"
             or $path[$index] == "example"
             or $path[$index] == "examples"
             or $path[$index] == "externalDocs")
              and (is_identifier_key($path; $index) | not))
            or (is_link_object($path[0:$index])
                and ($path[$index] == "requestBody"
                     or $path[$index] == "parameters")))
          )
      ]
      | length > 0;

    def contains_specification_extension($path):
      [
        range(0; $path | length) as $index
        | select(
            ($path[$index] | type) == "string"
            and ($path[$index] | startswith("x-"))
            and (is_identifier_key($path; $index) | not)
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

    def parameter_semantic_name($parameter):
      if $parameter.in == "header" and ($parameter.name | type) == "string" then
        $parameter.name | ascii_downcase
      else
        $parameter.name // "unknown"
      end;

    def canonical_json_identity:
      if type == "object" then
        to_entries
        | sort_by(.key)
        | map(.value |= canonical_json_identity)
        | from_entries
      elif type == "array" then
        map(canonical_json_identity)
      else .
      end;

    def supports_json_schema_2020_12($version):
      if ($version | type) != "string" then false
      else
        ($version
         | try capture("^(?<major>[0-9]+)\\.(?<minor>[0-9]+)\\.") catch null)
          as $parts
        | $parts != null
          and ($parts.major | tonumber) == 3
          and ($parts.minor | tonumber) >= 1
      end;

    def default_json_schema_dialect($version):
      if supports_json_schema_2020_12($version) then
        ($version
         | capture("^(?<major>[0-9]+)\\.(?<minor>[0-9]+)\\.")
         | "https://spec.openapis.org/oas/\(.major).\(.minor)/dialect/base")
      else null
      end;

    def canonical_schema_identity($openapi_version; $schema_dialect):
      if type == "object" then
        del(
          .description,
          .summary,
          .title,
          .externalDocs,
          .example,
          .examples
        )
        | (if supports_json_schema_2020_12($openapi_version) then
             del(."$comment")
           else .
           end)
        | (if ($schema_dialect | type) == "string"
              and (."$schema"? | type) == "string"
              and ."$schema" == $schema_dialect then
             del(."$schema")
           else .
           end)
        | to_entries
        | sort_by(.key)
        | map(
            .key as $key
            | if ($key == "properties"
                  or $key == "patternProperties"
                  or $key == "$defs"
                  or $key == "definitions"
                  or $key == "dependentSchemas")
                and (.value | type) == "object" then
                .value |= (
                  to_entries
                  | sort_by(.key)
                  | map(.value |= canonical_schema_identity(
                    $openapi_version;
                    $schema_dialect
                  ))
                  | from_entries
                )
              elif $key == "dependentRequired"
                  and supports_json_schema_2020_12($openapi_version)
                  and (.value | type) == "object" then
                .value |= with_entries(
                  if (.value | type) == "array" then
                    .value |= sort_by(tojson)
                  else .
                  end
                )
              elif $key == "default" or $key == "enum" or $key == "const" then
                .value |= canonical_json_identity
              else
                .value |= canonical_schema_identity(
                  $openapi_version;
                  $schema_dialect
                )
              end
          )
        | from_entries
        | (if .deprecated? == false then del(.deprecated) else . end)
        | (if .allowReserved? == false then del(.allowReserved) else . end)
        | (if .allowEmptyValue? == false then del(.allowEmptyValue) else . end)
        | (if .nullable? == false then del(.nullable) else . end)
        | (if .readOnly? == false then del(.readOnly) else . end)
        | (if .writeOnly? == false then del(.writeOnly) else . end)
        | (if .uniqueItems? == false then del(.uniqueItems) else . end)
        | (if (.minLength? | type) == "number" and .minLength == 0 then
             del(.minLength)
           else .
           end)
        | (if (.minItems? | type) == "number" and .minItems == 0 then
             del(.minItems)
           else .
           end)
        | (if (.minProperties? | type) == "number" and .minProperties == 0 then
             del(.minProperties)
           else .
           end)
        | (if supports_json_schema_2020_12($openapi_version)
              and has("contains")
              and (.minContains? | type) == "number"
              and .minContains == 1 then
             del(.minContains)
           else .
           end)
        | (if .attribute? == false then del(.attribute) else . end)
        | (if .wrapped? == false then del(.wrapped) else . end)
        | (if .additionalProperties? == true then
             del(.additionalProperties)
           else .
           end)
        | (if ($openapi_version | type) == "string"
             and ($openapi_version | startswith("3.0."))
             and .exclusiveMinimum? == false then
             del(.exclusiveMinimum)
           else .
           end)
        | (if ($openapi_version | type) == "string"
             and ($openapi_version | startswith("3.0."))
             and .exclusiveMaximum? == false then
             del(.exclusiveMaximum)
           else .
           end)
        | (if (.required? | type) == "array" then
             .required |= sort_by(tojson)
           else .
           end)
        | (if supports_json_schema_2020_12($openapi_version)
              and .required? == [] then
             del(.required)
           else .
           end)
        | (if supports_json_schema_2020_12($openapi_version)
              and .prefixItems? == [] then
             del(.prefixItems)
           else .
           end)
        | (if (.enum? | type) == "array" then
             .enum |= (map(canonical_json_identity) | sort_by(tojson))
           else .
           end)
        | (if (.type? | type) == "array" then
             .type |= sort_by(tojson)
           else .
           end)
        | (if (.oneOf? | type) == "array" then
             .oneOf |= sort_by(tojson)
           else .
           end)
        | (if (.anyOf? | type) == "array" then
             .anyOf |= sort_by(tojson)
           else .
           end)
        | (if (.allOf? | type) == "array" then
             .allOf |= sort_by(tojson)
           else .
           end)
        | (
            ["properties"]
            + (if supports_json_schema_2020_12($openapi_version) then
                 [
                   "patternProperties",
                   "$defs",
                   "dependentSchemas",
                   "dependentRequired"
                 ]
               else []
               end)
          ) as $empty_schema_maps
        | reduce $empty_schema_maps[] as $key
            (.; if .[$key]? == {} then del(.[$key]) else . end)
      elif type == "array" then
        map(canonical_schema_identity($openapi_version; $schema_dialect))
      else .
      end;

    def semantic_path($document; $path):
      (if ($document | has("jsonSchemaDialect")) then
         if ($document.jsonSchemaDialect | type) == "string" then
           $document.jsonSchemaDialect
         else null
         end
       else
         default_json_schema_dialect($document.openapi)
       end) as $schema_dialect
      | [
        range(0; $path | length) as $index
        | if $index > 0
            and $path[$index - 1] == "parameters"
            and ($path[$index] | type) == "number" then
            ($document | getpath($path[0:($index + 1)])) as $parameter
            | if ($parameter | type) != "object" then
                $path[$index]
              elif ($parameter["$ref"] // "") != "" then
                "parameter:$ref:\($parameter["$ref"])"
              else
                "parameter:\($parameter.in // "unknown"):\(parameter_semantic_name($parameter))"
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
          elif is_header_map_key($path; $index) then
            $path[$index] | ascii_downcase
          elif is_server_array_index($path; $index) then
            ($document | getpath($path[0:$index])) as $servers
            | $path[$index] as $server_index
            | $servers[$server_index] as $server
            | if ($server | type) == "object"
                and ($server.url | type) == "string"
                and $server.url != "" then
                ([
                   $servers[]
                   | select(
                       type == "object"
                       and (.url | type) == "string"
                       and .url == $server.url
                     )
                 ] | length) as $matching_url_count
                | if $matching_url_count == 1 then
                    "server:\($server.url)"
                  else
                    ([
                         range(0; $server_index) as $prior
                         | $servers[$prior] as $prior_server
                         | select(
                             ($prior_server | type) == "object"
                             and ($prior_server.url | type) == "string"
                             and $prior_server.url == $server.url
                           )
                       ] | length) as $occurrence
                    | "server:\($server.url)#\($occurrence)"
                  end
              else
                $path[$index]
              end
          elif is_composition_array_index($path; $index) then
            ($document | getpath($path[0:$index])) as $branches
            | $path[$index] as $branch_index
            | ($branches[$branch_index]
               | canonical_schema_identity(
                 $document.openapi;
                 $schema_dialect
               )
               | tojson)
              as $identity
            | ([
                 range(0; $branch_index) as $prior
                 | select(
                     ($branches[$prior]
                      | canonical_schema_identity(
                        $document.openapi;
                        $schema_dialect
                      )
                      | tojson)
                     == $identity
                   )
               ] | length) as $occurrence
            | "schema-branch:\($identity)#\($occurrence)"
          else
            $path[$index]
          end
      ];

    if type != "object" then
      []
    else
      with_entries(select(.key | startswith("x-") | not))
      | (if (.components? | type) == "object" then
         .components |= with_entries(select(.key | startswith("x-") | not))
       else .
       end)
      | (if (.paths? | type) == "object" then
         .paths |= with_entries(select(.key | startswith("x-") | not))
       else .
       end)
      | (if (.webhooks? | type) == "object" then
         .webhooks |= with_entries(select(.key | startswith("x-") | not))
       else .
       end)
      | . as $document
      | [
      paths(scalars) as $path
      | (is_oauth_scope_value($path)) as $is_oauth_scope
      | select(
          $is_oauth_scope
          or (($path[-1] == "description" or $path[-1] == "summary")
              and (is_identifier_key($path; ($path | length) - 1) | not))
        )
      | select(
          is_example_metadata($path)
          or (is_external_docs_description($path)
              and (contains_literal_payload($path[0:-2]) | not))
          or (contains_literal_payload($path) | not)
        )
      | select(contains_specification_extension($path) | not)
      | (getpath($path) | normalized_description) as $value
      | select($value != "")
      | semantic_path($document; $path) as $semantic_path
      | {
          id: ($semantic_path | tojson),
          match_id: (
            $semantic_path
            | map(
                if type == "string" and startswith("schema-branch:") then
                  "schema-branch"
                else .
                end
              )
            | tojson
          ),
          kind: (if $path == ["info", "description"] then "info"
                 elif $is_oauth_scope then "oauth-scope"
                 else $path[-1]
                 end),
          label: (if $path == ["info", "description"]
                  then "General API description"
                  else path_label($semantic_path)
                  end),
          value: $value
        }
      ]
      | sort_by(.id)
    end
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

reference_version="$(
  jq -c '
    if type == "object" and (.info | type) == "object" then
      .info.version
    else null
    end
  ' "${REFERENCE_FILE}"
)"
candidate_version="$(
  jq -c '
    if type == "object" and (.info | type) == "object" then
      .info.version
    else null
    end
  ' "${candidate_file}"
)"
reference_openapi_version="$(jq -r '.openapi // "unknown"' "${normalized_reference}")"
candidate_openapi_version="$(jq -r '.openapi // "unknown"' "${normalized_candidate}")"
reference_schema_dialect="$(
  jq -r '
    if has("jsonSchemaDialect") then
      (.jsonSchemaDialect | if type == "string" then . else tojson end)
    else "implicit"
    end
  ' "${normalized_reference}"
)"
candidate_schema_dialect="$(
  jq -r '
    if has("jsonSchemaDialect") then
      (.jsonSchemaDialect | if type == "string" then . else tojson end)
    else "implicit"
    end
  ' "${normalized_candidate}"
)"

jq -S -n \
  --slurpfile reference "${reference_descriptions}" \
  --slurpfile candidate "${candidate_descriptions}" '
    def group_by_match_id:
      sort_by(.match_id)
      | group_by(.match_id)
      | map({key: .[0].match_id, value: .})
      | from_entries;

    def add_value_occurrences:
      sort_by(.value, .id)
      | group_by(.value)
      | map(
          to_entries
          | map(.value + {value_occurrence: .key})
        )
      | add // [];

    def changes_by_id($reference_entries; $candidate_entries):
      [
        $reference_entries[] as $reference_entry
        | ($candidate_entries
           | map(select(.id == $reference_entry.id))
           | .[0]) as $candidate_entry
        | select($reference_entry.value != $candidate_entry.value)
        | {
            id: $reference_entry.id,
            kind: $candidate_entry.kind,
            label: $candidate_entry.label,
            before: $reference_entry.value,
            after: $candidate_entry.value
          }
      ];

    def changes_by_value($match_id; $raw_reference_entries; $raw_candidate_entries):
      ($raw_reference_entries | add_value_occurrences) as $reference_entries
      | ($raw_candidate_entries | add_value_occurrences) as $candidate_entries
      | [
          $reference_entries[]
          | . as $entry
          | select(
              ([$candidate_entries[]
                | select(
                    .value == $entry.value
                    and .value_occurrence == $entry.value_occurrence
                  )
               ] | length) == 0
            )
        ] as $unmatched_reference
      | [
          $candidate_entries[]
          | . as $entry
          | select(
              ([$reference_entries[]
                | select(
                    .value == $entry.value
                    and .value_occurrence == $entry.value_occurrence
                  )
               ] | length) == 0
            )
        ] as $unmatched_candidate
      | ([
           ($unmatched_reference | length),
           ($unmatched_candidate | length)
         ] | max) as $change_count
      | [
          range(0; $change_count) as $index
          | ($unmatched_candidate[$index]
             // $unmatched_reference[$index]) as $display_entry
          | {
              id: "\($match_id)#\($index)",
              kind: $display_entry.kind,
              label: $display_entry.label,
              before: ($unmatched_reference[$index].value // null),
              after: ($unmatched_candidate[$index].value // null)
            }
        ];

    ($reference[0] | group_by_match_id) as $reference_groups
    | ($candidate[0] | group_by_match_id) as $candidate_groups
    | [
        (($reference_groups | keys) + ($candidate_groups | keys) | unique[])
          as $match_id
        | (($reference_groups[$match_id] // []) | sort_by(.id))
          as $raw_reference_entries
        | (($candidate_groups[$match_id] // []) | sort_by(.id))
          as $raw_candidate_entries
        | ($raw_reference_entries | map(.id) | sort) as $reference_ids
        | ($raw_candidate_entries | map(.id) | sort) as $candidate_ids
        | if $reference_ids == $candidate_ids then
            changes_by_id($raw_reference_entries; $raw_candidate_entries)
          else
            ([
               $reference_ids[] as $id
               | select(($candidate_ids | index($id)) != null)
               | $id
             ] | unique) as $surviving_ids
            | ($raw_reference_entries
               | map(.id as $id | select(($surviving_ids | index($id)) != null)))
              as $surviving_reference_entries
            | ($raw_candidate_entries
               | map(.id as $id | select(($surviving_ids | index($id)) != null)))
              as $surviving_candidate_entries
            | ($raw_reference_entries
               | map(.id as $id | select(($surviving_ids | index($id)) == null)))
              as $unmatched_reference_entries
            | ($raw_candidate_entries
               | map(.id as $id | select(($surviving_ids | index($id)) == null)))
              as $unmatched_candidate_entries
            | changes_by_id(
                $surviving_reference_entries;
                $surviving_candidate_entries
              )
              + changes_by_value(
                  $match_id;
                  $unmatched_reference_entries;
                  $unmatched_candidate_entries
                )
          end
        | .[]
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

jq -r 'if (.paths | type) == "object" then .paths | keys[] else empty end' \
  "${normalized_reference}" | sort \
  > "${tmp_dir}/reference.paths"
jq -r 'if (.paths | type) == "object" then .paths | keys[] else empty end' \
  "${normalized_candidate}" | sort \
  > "${tmp_dir}/candidate.paths"
comm -23 "${tmp_dir}/reference.paths" "${tmp_dir}/candidate.paths" \
  > "${tmp_dir}/removed.paths"
comm -13 "${tmp_dir}/reference.paths" "${tmp_dir}/candidate.paths" \
  > "${tmp_dir}/added.paths"

reference_servers="$(jq -c '.servers' "${normalized_reference}")"
candidate_servers="$(jq -c '.servers' "${normalized_candidate}")"
top_level_servers_changed=false
if [[ "${reference_servers}" != "${candidate_servers}" ]]; then
  top_level_servers_changed=true
fi

reference_security="$(jq -c '.security' "${normalized_reference}")"
candidate_security="$(jq -c '.security' "${normalized_candidate}")"
top_level_security_changed=false
if [[ "${reference_security}" != "${candidate_security}" ]]; then
  top_level_security_changed=true
fi

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].paths | object_or_empty) as $reference_paths
    | ($candidate[0].paths | object_or_empty) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | ($reference_paths[$path] | object_or_empty) as $reference_path_item
    | ($candidate_paths[$path] | object_or_empty) as $candidate_path_item
    | select(
        ($reference_path_item.parameters // [])
        != ($candidate_path_item.parameters // [])
      )
    | $path
  ' | sort > "${tmp_dir}/changed.path-parameters"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].paths | object_or_empty) as $reference_paths
    | ($candidate[0].paths | object_or_empty) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | ($reference_paths[$path] | object_or_empty) as $reference_path_item
    | ($candidate_paths[$path] | object_or_empty) as $candidate_path_item
    | select(
        ($reference_path_item["$ref"] // null)
        != ($candidate_path_item["$ref"] // null)
      )
    | $path
  ' | sort > "${tmp_dir}/changed.path-references"

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

    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].paths | object_or_empty) as $reference_paths
    | ($candidate[0].paths | object_or_empty) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | ($reference_paths[$path] | object_or_empty) as $reference_path_item
    | ($candidate_paths[$path] | object_or_empty) as $candidate_path_item
    | (
        ($reference_path_item | keys | map(select(is_http_method)))
          + ($candidate_path_item | keys | map(select(is_http_method)))
        | unique[]
      ) as $method
    | select(
        $reference_path_item[$method]
        != $candidate_path_item[$method]
      )
    | "\($method | ascii_upcase) \($path)"
  ' | sort > "${tmp_dir}/changed.operations"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].paths | object_or_empty) as $reference_paths
    | ($candidate[0].paths | object_or_empty) as $candidate_paths
    | (($reference_paths | keys) + ($candidate_paths | keys) | unique[])
      as $path
    | ($reference_paths[$path] | object_or_empty) as $reference_path_item
    | ($candidate_paths[$path] | object_or_empty) as $candidate_path_item
    | select(
        ($reference_path_item.servers // [])
        != ($candidate_path_item.servers // [])
      )
    | $path
  ' | sort > "${tmp_dir}/changed.path-servers"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].webhooks | object_or_empty) as $reference_webhooks
    | ($candidate[0].webhooks | object_or_empty) as $candidate_webhooks
    | (($reference_webhooks | keys) + ($candidate_webhooks | keys) | unique[])
      as $webhook
    | select($reference_webhooks[$webhook] != $candidate_webhooks[$webhook])
    | $webhook
  ' | sort > "${tmp_dir}/changed.webhooks"

jq -r -n \
  --slurpfile reference "${normalized_reference}" \
  --slurpfile candidate "${normalized_candidate}" '
    def object_or_empty: if type == "object" then . else {} end;

    ($reference[0].components | object_or_empty) as $reference_components
    | ($candidate[0].components | object_or_empty) as $candidate_components
    | (($reference_components | keys) + ($candidate_components | keys) | unique[])
      as $section
    | ($reference_components[$section] | object_or_empty) as $reference_section
    | ($candidate_components[$section] | object_or_empty) as $candidate_section
    | (
        ($reference_section | keys)
        + ($candidate_section | keys)
        | unique[]
      ) as $component_name
    | select(
        $reference_section[$component_name]
        != $candidate_section[$component_name]
      )
    | "\($section).\($component_name)"
  ' | sort > "${tmp_dir}/changed.components"

report="${tmp_dir}/drift-report.md"
{
  echo "## ISBNdb OpenAPI drift report"
  echo ""
  echo "- Reference version: \`${reference_version}\`"
  echo "- Candidate version: \`${candidate_version}\`"
  echo "- Reference OpenAPI version: \`${reference_openapi_version}\`"
  echo "- Candidate OpenAPI version: \`${candidate_openapi_version}\`"
  echo "- Reference JSON Schema dialect: \`${reference_schema_dialect}\`"
  echo "- Candidate JSON Schema dialect: \`${candidate_schema_dialect}\`"
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
    echo "Changed path-level references:"
    if [[ -s "${tmp_dir}/changed.path-references" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.path-references" | sed 's/$/`/'
    else
      echo "- None"
    fi
    echo ""
    echo "Changed top-level servers:"
    if [[ "${top_level_servers_changed}" == true ]]; then
      echo "- Reference: \`${reference_servers}\`"
      echo "- Candidate: \`${candidate_servers}\`"
    else
      echo "- None"
    fi
    echo ""
    echo "Changed top-level security requirements:"
    if [[ "${top_level_security_changed}" == true ]]; then
      echo "- Reference: \`${reference_security}\`"
      echo "- Candidate: \`${candidate_security}\`"
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
    echo "Changed webhooks:"
    if [[ -s "${tmp_dir}/changed.webhooks" ]]; then
      sed 's/^/- `/' "${tmp_dir}/changed.webhooks" | sed 's/$/`/'
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
  node "${REPO_ROOT}/scripts/sanitize_github_issue_report.cjs" \
    < "${report}" >> "${GITHUB_STEP_SUMMARY}"
fi

exit 2

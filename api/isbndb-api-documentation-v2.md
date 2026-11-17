# ISBNdb API Documentation v2 (OpenAPI 2.9.0)

Source: `https://api2.isbndb.com/doc.json` (OpenAPI 3.0.0)

## API metadata

- Title: `ISBNdb API Documentation v2`
- Version: `2.9.0`
- Server: `https://api2.isbndb.com`
- Security: `ApiKeyAuth` (`Authorization` header)

## Authentication

Use your REST key in the `Authorization` header on every request.

```http
GET /book/9780134093413 HTTP/1.1
Host: api2.isbndb.com
Authorization: YOUR_REST_KEY
Accept: application/json
```

### Important note from API docs

A `404 Not Found` for ISBN lookup can mean the book is not yet indexed and may appear later.

Search and detail endpoints limit `pageSize` to 100 and reject larger values
with `400 Bad Request` for all API keys. The legacy allowance ended on
October 10, 2026. The
`GET /feeds/books/updates` endpoint keeps its separate limit of 1,000.
Book searches with the `thema` filter and `GET /thema/{code}/books` stop at
1,000 books, and their `total` is capped at 1,000.

Subject search and lookups, the `Book.subjects` field, the `subject` filter on
`GET /search/books`, and the `subjects` column filter are deprecated and will be
removed in a future API version. Thema is the replacement; no removal date is announced.

## Versioning

ISBNdb runs one live API version, numbered `GENERATION.MAJOR.MINOR.PATCH`.
A zero patch is omitted, as in `2.9.0` rather than `2.9.0.0`.

- Generation changes, such as `2` to `3`, introduce a new API edition with separate documentation.
- Major changes, such as `2.8.4` to `2.9.0`, can break clients. They follow a deprecation announcement with a removal date in the API changelog.
- Minor changes, such as `2.8.4` to `2.8.5`, add fields, parameters or endpoints, or announce deprecations while preserving compatibility.
- Patch changes, such as `2.8.4` to `2.8.4.1`, fix behavior or documentation without changing the contract.

Clients should accept unknown response fields because minor releases can add them.

## API changelog

### 2.9.0 (November 16, 2026)

- Added `thema` on books: subject codes and qualifiers with their names and types, with the main subject first. It replaces the deprecated `subjects` field.
- Added `GET /thema` and `GET /thema/{code}` to browse Thema classifications, including ranked code/name searches, batch lookup of up to 100 codes, and ancestors for breadcrumbs.
- Added `GET /thema/{code}/books` for ranked book results, capped at 1,000 per code and filter combination.
- Added the `thema` filter to `GET /books/{query}` and `GET /search/books`: up to five comma-separated codes, all of which must match, with a 1,000-book ceiling.
- Removed `page` from `GET /feeds/books/updates` request parameters and response fields. This is a breaking API change; use `next` cursors.

### 2.8.4.1 (November 3, 2026)

- Added API documentation explaining version numbering and recording changes in a changelog.

### 2.8.4 (November 2, 2026)

- Added `code` to HTTP 429 error bodies: `rate_limited` for the per-minute limit and `quota_exceeded` for exhausted quota.
- Added `bulk_limit` to `GET /key`.
- Changed English book `title` and `title_long` values to Title Case.

### 2.8.3 (October 16, 2026)

- Deprecated `subjects` on books; removal is planned for a future version, with a replacement to be announced.
- Deprecated `GET /subject/{name}` and `GET /subjects/{query}` under the same removal and replacement policy.

## Endpoints summary

| Path | Method | Tag | Deprecated | Operation ID | Success schema |
| --- | --- | --- | --- | --- | --- |
| `/author/{name}` | GET | Author | no | `get_app_api_author_authordetails__invoke` | `AuthorDetailsResponse` |
| `/authors/{query}` | GET | Author | no | `get_app_api_author_searchauthors__invoke` | `SearchAuthorsResponse` |
| `/book/{isbn}` | GET | Books | no | `get_app_api_book_book__invoke` | `GetBookResponse` |
| `/books` | POST | Books | no | `post_app_api_book_bookmultiple__invoke` | `GetBooksMultipleResponse` |
| `/books/{query}` | GET | Books | no | `get_app_api_book_searchbook__invoke` | `SearchBooksPaginatedResponse` |
| `/feeds/books/updates` | GET | Feed | no | `get_app_api_feed_updatedbooks__invoke` | `UpdatedBooksResponse` |
| `/key` | GET | default | no | `get_app_api_key__invoke` | `KeyResponse` |
| `/publisher/{name}` | GET | Publisher | no | `get_app_api_publisher_publisherdetails__invoke` | `DetailsResponse` |
| `/publishers/{query}` | GET | Publisher | no | `get_app_api_publisher_searchpublishers__invoke` | `SearchPublishersResponse` |
| `/search/authors` | GET | Search | yes | `get_app_api_search_searchauthors__invoke` | `SearchBaseResponse` |
| `/search/books` | GET | Search | no | `get_app_api_search_searchbooks__invoke` | `SearchBookResponse` |
| `/search/publishers` | GET | Search | yes | `get_app_api_search_searchpublishers__invoke` | `SearchBaseResponse` |
| `/search/subjects` | GET | Search | yes | `get_app_api_search_searchsubjects__invoke` | `SearchBaseResponse` |
| `/stats` | GET | default | no | `get_app_api_stats_getstats__invoke` | `BaseStatsResponse` |
| `/subjects/{query}` | GET | Subject | yes | `get_app_api_subject_searchsubjects__invoke` | `SearchSubjectResponse` |
| `/subject/{name}` | GET | Subject | yes | `get_app_api_subject_subjectsdetails__invoke` | `SubjectDetailsResponse` |
| `/thema` | GET | Thema | no | `listThemaCodes` | `ThemaListResponse` |
| `/thema/{code}` | GET | Thema | no | `getThemaCode` | `ThemaDetailsResponse` |
| `/thema/{code}/books` | GET | Thema | no | `getThemaBooks` | `ThemaBooksResponse` |

## Endpoint details

### `GET /author/{name}`

Returns the author name and a list of books.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Author name |
| `language` | query | string | no | `null` | yes | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |
| `publishedFrom` | query | string | no | `null` | yes | Only return books published on or after this date (`YYYY-MM-DD`) |
| `publishedTo` | query | string | no | `null` | yes | Only return books published on or before this date (`YYYY-MM-DD`) |

Responses:
- `200`: `AuthorDetailsResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /authors/{query}`

Search authors by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchAuthorsResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /book/{isbn}`

Returns book details.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `with_prices` | query | boolean | no | `false` | no | Include real-time vendor prices |
| `isbn` | path | string | yes | - | no | ISBN |

Responses:
- `200`: `GetBookResponse`
- `404`: `ErrorResponse`
- `400`, `401`, `429`, `503`: error response

### `POST /books`

Returns details for multiple ISBNs (plan limits apply).

Request body:
- Required: yes
- Content types:
- `application/json` -> `GetBooksMultipleRequest`
- `application/x-www-form-urlencoded` -> `GetBooksMultipleRequest`

Responses:
- `200`: `GetBooksMultipleResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /books/{query}`

Search books by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `year` | query | integer | no | `null` | yes | Publication year |
| `edition` | query | integer | no | `null` | yes | Edition |
| `shouldMatchAll` | query | boolean | no | `false` | yes | Match all words in title/author |
| `language` | query | string | no | `null` | yes | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `column` | query | enum(`Column`) | no | - | yes | One of: `title`, `author`, `date_published`, `subjects` (deprecated; planned for removal) |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |
| `publishedFrom` | query | string | no | `null` | yes | Only return books published on or after this date (`YYYY-MM-DD`) |
| `publishedTo` | query | string | no | `null` | yes | Only return books published on or before this date (`YYYY-MM-DD`) |
| `thema` | query | string | no | `null` | yes | Up to 5 comma-separated, case-insensitive codes; all codes must match, including narrower codes; at most 1,000 books |

Responses:
- `200`: `SearchBooksPaginatedResponse`
- `400`, `401`, `429`, `503`: error response

Thema filters replace retired codes with their successors. An unknown code or a
retired code without a successor returns HTTP 400. Blank stationery, journals,
and diaries are excluded unless a supplied code is `WZS` or below it. Pages
starting beyond the 1,000-book limit return HTTP 400.

### `GET /feeds/books/updates`

Returns a paginated feed of recently updated ISBNs. Each entry includes a `status`
of `new` or `updated`.

Important notes from the OpenAPI description:
- Pro plans and higher
- History limited to the last 7 days
- Does not count against daily API quota
- Repeat requests with the response `next` as `cursor` until `next` is null
- Cursors are opaque and remain valid while their history exists; with a cursor, only `pageSize` is honored among the other filters
- Offset pagination was removed on November 7, 2026. The 2.9.0 contract has no `page` request parameter or response field. Use `cursor` for following pages; the upstream description states that legacy `page` values other than `1` return HTTP 400.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `pageSize` | query | integer | no | `100` | yes | How many items should be returned per page, maximum of 1,000 |
| `lastUpdated` | query | string | no | `null` | yes | Filter by last updated date (`YYYY-MM-DD`) |
| `cursor` | query | string (max 255) | no | `null` | yes | Opaque `next` cursor from the previous response |

Responses:
- `200`: `UpdatedBooksResponse`
- `400`, `401`, `403`, `429`, `503`: error response

### `GET /key`

Returns key details.

Responses:
- `200`: `KeyResponse`
- `401`, `429`, `503`: error response

### `GET /publisher/{name}`

Returns publisher details and books.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Publisher name |
| `language` | query | string | no | `null` | yes | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |
| `publishedFrom` | query | string | no | `null` | yes | Only return books published on or after this date (`YYYY-MM-DD`) |
| `publishedTo` | query | string | no | `null` | yes | Only return books published on or before this date (`YYYY-MM-DD`) |

Responses:
- `200`: `DetailsResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /publishers/{query}`

Search publishers by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchPublishersResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /search/authors` (deprecated)

Deprecated in favor of `/authors/{query}`.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchBaseResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /search/books`

Search the books index by fields. At least one filter is required: either `isbn`
or `isbn13`, or one or more of `author`, `text`, `subject`, `publisher`, or `thema`.
Mixing an identifier with those search fields, or supplying none, returns HTTP
400. Either ISBN field accepts ISBN-10 or ISBN-13 and resolves directly, without
the search index. Prices are not returned.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |
| `isbn` | query | string | no | - | yes | ISBN-10 or ISBN-13; cannot be combined with search fields |
| `isbn13` | query | string | no | - | yes | ISBN-10 or ISBN-13; cannot be combined with search fields |
| `author` | query | string | no | - | yes | Author name |
| `text` | query | string | no | - | yes | Free text |
| `subject` | query | string | no | - | yes | Subject; deprecated and planned for removal in a future API version |
| `publisher` | query | string | no | - | yes | Publisher name |
| `publishedFrom` | query | string | no | `null` | yes | Only return books published on or after this date (`YYYY-MM-DD`) |
| `publishedTo` | query | string | no | `null` | yes | Only return books published on or before this date (`YYYY-MM-DD`) |
| `thema` | query | string | no | `null` | yes | Up to 5 comma-separated, case-insensitive codes; all codes must match, including narrower codes; at most 1,000 books |

Responses:
- `200`: `SearchBookResponse`
- `400`, `401`, `429`, `503`: error response

Thema filters replace retired codes with their successors. An unknown code or a
retired code without a successor returns HTTP 400. Blank stationery, journals,
and diaries are excluded unless a supplied code is `WZS` or below it. Pages
starting beyond the 1,000-book limit return HTTP 400.

### `GET /search/publishers` (deprecated)

Deprecated in favor of `/publishers/{query}`.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchBaseResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /search/subjects` (deprecated)

Deprecated subject search; planned for removal in a future API version.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchBaseResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /stats`

Returns global counts.

Responses:
- `200`: `BaseStatsResponse`
- `401`, `429`, `503`: error response

### `GET /subjects/{query}` (deprecated)

Search subjects by query. Deprecated and planned for removal in a future API version.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |

Responses:
- `200`: `SearchSubjectResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /subject/{name}` (deprecated)

Returns subject details and related books. Deprecated and planned for removal in a future API version.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Subject name |
| `language` | query | string | no | `null` | yes | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page (max 100); larger values return `400 Bad Request` |
| `publishedFrom` | query | string | no | `null` | yes | Only return books published on or after this date (`YYYY-MM-DD`) |
| `publishedTo` | query | string | no | `null` | yes | Only return books published on or before this date (`YYYY-MM-DD`) |

Responses:
- `200`: `SubjectDetailsResponse`
- `400`, `401`, `429`, `503`: error response

### `GET /thema`

Browse the Thema scheme (release 1.7). Without filters, returns top-level codes
in code order. `parent` lists direct children; with `q`, it limits search to codes
below that parent. Searches rank exact code/name matches first, then code or
word-prefix matches, then substring matches. Subjects precede qualifiers within
each group, followed by broader codes and shorter names.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `parent` | query | string | no | `null` | yes | Parent code; combined with `q`, search only below it |
| `type` | query | string | no | `null` | yes | One of `subject`, `place`, `language`, `time`, `education`, `interest`, `style` |
| `q` | query | string | no | `null` | yes | Code prefix or case-insensitive name substring, 2–100 characters |
| `codes` | query | string | no | `null` | yes | Up to 100 comma-separated codes, returned in requested order; other filters and paging are ignored |
| `withAncestors` | query | boolean | no | `false` | no | With `codes`, prepend broader codes for breadcrumbs; duplicates are removed |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page, maximum 100; larger values return HTTP 400 |

Retired codes are not listed except as replacements of codes requested through
`codes`. Unknown codes in `codes` are skipped.

Responses:
- `200`: `ThemaListResponse`
- `404`: `parent` is not a Thema code
- `400`, `401`, `429`, `503`: error response

### `GET /thema/{code}`

Returns a code with its ancestors from the top level to its parent and its
direct children in code order. A retired code with a successor resolves to that
successor and records the requested code in `replaced_from`; a retired code
without one is returned as-is.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `code` | path | string | yes | - | no | Case-insensitive Thema code |

Responses:
- `200`: `ThemaDetailsResponse`
- `404`: unknown Thema code
- `400`, `401`, `429`, `503`: error response

### `GET /thema/{code}/books`

Returns books classified under a code, best matches first. Main-subject matches
(including narrower codes), newer books, and popular books receive higher
ranking. Blank stationery, journals, and diaries are excluded unless the
requested code is `WZS` or below it. Retired codes with a successor resolve to
that successor, exposed as `thema` in the response.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `code` | path | string | yes | - | no | Case-insensitive Thema code |
| `includeDescendants` | query | boolean | no | `true` | no | Include books classified only under narrower codes; `false` requires the code itself |
| `language` | query | string | no | `null` | yes | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `page` | query | integer | no | `1` | yes | Page number |
| `pageSize` | query | integer | no | `20` | yes | Items per page, maximum 100; larger values return HTTP 400 |
| `publishedFrom` | query | string | no | `null` | yes | Inclusive lower publication date, `YYYY`, `YYYY-MM`, or `YYYY-MM-DD` |
| `publishedTo` | query | string | no | `null` | yes | Inclusive upper publication date, `YYYY`, `YYYY-MM`, or `YYYY-MM-DD` |

At most 1,000 books are returned per code and filter combination. `total` is
capped at 1,000, the final page is trimmed to that ceiling, and a page starting
beyond it returns HTTP 400. Resolved records can be fewer than `page_size`.

Responses:
- `200`: `ThemaBooksResponse`
- `404`: unknown code or retired code without a successor
- `400`, `401`, `429`, `503`: error response

## Components

### Security schemes

- `ApiKeyAuth`
- Type: `apiKey`
- Header name: `Authorization`
- In: `header`

### Schemas overview

| Schema | Required fields | Key properties |
| --- | --- | --- |
| `LanguageFilters` | - | `language` |
| `CursorFilter` | - | `cursor` |
| `UnlimitedPaginationFilter` | - | `pageSize` |
| `PaginationFilters` | `offset` | `page`, `pageSize`, `offset` |
| `GetBooksMultipleRequest` | `isbns` | `isbns` (`array<string>`, max 1000) |
| `Column` | - | enum: `title`, `author`, `date_published`, `subjects` (deprecated) |
| `SearchBookFilters` | - | `year`, `edition`, `shouldMatchAll`, `language`, `column`, `publishedFrom`, `publishedTo`, `thema` |
| `SearchQueryFilters` | - | `isbn`, `isbn13`, `author`, `text`, `subject` (deprecated), `publisher`, `thema` |
| `Point` | `x`, `y` | `x`, `y` |
| `Price` | `condition`, `merchant`, `merchant_logo`, `merchant_logo_offset`, `shipping`, `price`, `total`, `link` | price row fields |
| `Book` | `title`, `title_long`, `isbn`, `isbn13`, `date_published` | book metadata; prices are excluded |
| `BookWithPrices` | inherited from `Book` | `Book` plus optional live `prices` |
| `ThemaEntry` | `code`, `name`, `type`, `main` | book classification or qualifier |
| `ThemaNode` | `code`, `name`, `type`, `has_children` | classification tree node |
| `ThemaListFilters` | - | `parent`, `type`, `q`, `codes`, `withAncestors` |
| `ThemaListResponse` | `total`, `page`, `page_size`, `codes` | codes + pagination |
| `ThemaDetailsResponse` | `code`, `name`, `type`, `ancestors`, `children` | hierarchy + optional `replaced_from` |
| `ThemaBooksResponse` | `thema`, `books`, `total`, `page`, `page_size` | resolved classification + books + pagination |
| `AuthorDetailsResponse` | `author`, `name`, `books`, `total`, `page`, `page_size` | author + books + pagination |
| `SearchAuthorsResponse` | `name`, `authors`, `total`, `page`, `page_size` | authors list + pagination |
| `GetBookResponse` | `book` | `book` |
| `ErrorResponse` | `message`, `errorMessage` | `message` (deprecated), `errorMessage`, optional quota `code` |
| `GetBooksMultipleResponse` | `total`, `data` | `data`, `requested` |
| `SearchBooksPaginatedResponse` | `books`, `total`, `page`, `page_size` | books + pagination |
| `UpdatedBook` | `isbn13`, `updated_at`, `status` | `isbn13`, `updated_at`, `status` |
| `UpdatedBooksResponse` | `data`, `page_size` | `data`, `page_size`, `next` |
| `PlanLimit` | `total`, `spent`, `left` | subscription and per-key quota counters |
| `KeyResponse` | `api_host`, `plan_limit`, `plan_name`, `bulk_limit` | host + plan name + usage and batch limits |
| `DetailsResponse` | `name`, `books`, `total`, `page`, `page_size` | publisher details |
| `SearchPublishersResponse` | `name`, `publishers`, `total`, `page`, `page_size` | publishers list + pagination |
| `SearchBaseResponse` | `name`, `data`, `total`, `page`, `page_size` | generic search payload |
| `SearchBookResponse` | `data`, `total`, `page`, `page_size` | books payload + pagination |
| `BaseStatsResponse` | `books`, `authors`, `publishers`, `subjects` | global counters |
| `SearchSubjectResponse` | `name`, `subjects`, `total`, `page`, `page_size` | subjects list + pagination |
| `SubjectDetailsResponse` | `subject`, `name`, `books`, `total`, `page`, `page_size` | subject details |

## Tags

- `Author`
- `Books`
- `Feed`
- `Publisher`
- `Search`
- `Subject`
- `Thema`

## Schema details

### `LanguageFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `language` | string | no | yes | no | `null` | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |

### `PaginationFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `page` | integer | no | yes | no | `1` | Page number |
| `pageSize` | integer | no | yes | no | `20` | Items per page (max 100); larger values return `400 Bad Request` |
| `offset` | integer | yes | no | no | - | Offset |

### `GetBooksMultipleRequest`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbns` | `array<string>` (max 1000) | yes | no | no | - | ISBN-10 or ISBN-13 values; plan-specific limits also apply |

### `CursorFilter`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `cursor` | string (max 255) | no | yes | no | `null` | Opaque `next` cursor; other filters except `pageSize` are ignored |

### `UnlimitedPaginationFilter`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `pageSize` | integer (1–1000) | no | yes | no | `100` | Number of items per page |

### `UpdatedBook`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbn13` | string | yes | no | no | - | ISBN-13 |
| `updated_at` | string(date-time) | yes | no | no | - | Timestamp when the book was last updated |
| `status` | enum(`new`, `updated`) | yes | no | no | - | Whether the entry represents a new book or an update |

The Dart client exposes `status` as `UpdatedBookStatus.newBook` for `new` and
`UpdatedBookStatus.updated` for `updated`. Although the current API requires the
field, the client accepts older responses without it and unrecognized future
values as `UpdatedBookStatus.unknown`. The constructor also defaults to `unknown`.
The existing two-field `UpdatedBook.when`, `maybeWhen`, and `whenOrNull` callbacks
remain supported; access `status` directly on the entry.

### `UpdatedBooksResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `data` | `array<UpdatedBook>` | yes | no | no | - | Updated ISBN entries |
| `next` | string | no | yes | no | - | Opaque cursor for the next page; null when finished |
| `page_size` | integer | yes | no | no | - | Page size |

The Dart client's deprecated `UpdatedBookFeed.page` remains available for
compatibility and defaults to `1` when missing or null. It is not part of the
2.9.0 API response contract. The client never sends a `page` parameter, and the
deprecated method argument is ignored with a cursor; otherwise values other than
`1` throw `ArgumentError`.
Use `next` for pagination; existing four-field feed callbacks remain supported.

### `Column`

Type: `string`  
Enum values: `title`, `author`, `date_published`, `subjects`

The `subjects` value is deprecated and will be removed in a future API version; use the `thema` filter instead.

### `SearchBookFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `year` | integer | no | yes | no | `null` | Filter books by publication year |
| `edition` | integer | no | yes | no | `null` | Filter books by edition |
| `should_match_all` | boolean | no | yes | no | `false` | Match all words in title/author |
| `language` | string | no | yes | no | `null` | ISO 639-3 code (e.g. `eng` or `fra`); ISBNdb also normalizes two-letter codes (`en`) and full names (`English`) |
| `column_enum` | `oneOf(Column)` | no | yes | no | - | Column filter |
| `thema` | string | no | yes | no | `null` | Up to 5 comma-separated Thema codes; all must match, including narrower codes; at most 1,000 books |

### `SearchQueryFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbn` | string | no | yes | no | - | ISBN-10 or ISBN-13; cannot be combined with other search fields |
| `isbn13` | string | no | yes | no | - | ISBN-10 or ISBN-13; cannot be combined with other search fields |
| `author` | string | no | yes | no | - | Author name |
| `text` | string | no | yes | no | - | Generic text query |
| `subject` | string | no | yes | yes | - | Subject; planned for removal in a future API version |
| `publisher` | string | no | yes | no | - | Publisher name |
| `thema` | string | no | yes | no | `null` | Up to 5 comma-separated Thema codes; all must match, including narrower codes; at most 1,000 books |

### `Point`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `x` | string | yes | no | no | - | X coordinate |
| `y` | string | yes | no | no | - | Y coordinate |

### `Price`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `condition` | string | yes | no | no | - | Book condition |
| `merchant` | string | yes | no | no | - | Merchant name |
| `merchant_logo` | string | yes | no | no | - | Merchant logo URL |
| `merchant_logo_offset` | `Point` | yes | no | no | - | Merchant logo position data |
| `shipping` | string | yes | no | no | - | Shipping amount |
| `price` | string | yes | no | no | - | Item price |
| `total` | string | yes | no | no | - | Total amount |
| `link` | string | yes | no | no | - | Merchant link |

### `ListPrice`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `amount` | number(float) | yes | no | no | - | Price amount, rounded to two decimal places |
| `currency` | string | yes | no | no | - | ISO 4217 currency code |

### `Book`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `title` | string | yes | no | no | - | Title |
| `title_long` | string | yes | no | yes | - | Legacy long title |
| `isbn` | string | yes | no | yes | - | Legacy ISBN-13 field |
| `isbn13` | string | yes | no | no | - | ISBN-13 |
| `isbn10` | string | no | yes | no | - | ISBN-10 if available |
| `binding` | string | no | yes | no | - | Binding |
| `publisher` | string | no | yes | no | - | Publisher |
| `language` | string | no | yes | no | - | ISO 639-3 code; regional tags include `pt-br`, `fr-ca`, `zh-tw`, `es-419`; may be absent when no value is available |
| `date_published` | string | yes | no | no | - | Publication date (`YYYY-MM-DD`, `YYYY-MM`, or `YYYY`); partial dates are common |
| `edition` | string | no | yes | yes | - | Legacy string edition; use `edition_number` |
| `edition_number` | integer | no | yes | no | - | Edition number |
| `pages` | integer | no | yes | no | - | Number of pages |
| `dimensions` | string | no | yes | yes | - | Legacy dimensions |
| `dimensions_structured` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Structured dimensions |
| `overview` | string | no | yes | yes | - | Legacy overview |
| `image` | string | no | yes | no | - | Cover image URL; maximum height 450px; may be a placeholder when no cover is available |
| `image_original` | string | no | yes | no | - | Cover image URL at the highest available resolution; may be a placeholder; expires 2 hours after the API response is generated |
| `msrp` | number(float) | no | yes | yes | - | Legacy MSRP in USD; use `list_price` |
| `list_price` | `oneOf(ListPrice)` | no | yes | no | - | List price with its currency |
| `excerpt` | string | no | yes | yes | - | Legacy excerpt |
| `synopsis` | string | no | yes | no | - | Synopsis |
| `authors` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Authors |
| `subjects` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | yes | - | Subjects; planned for removal; use `thema` |
| `thema` | `array<ThemaEntry>` | no | yes | no | `null` | Thema subject codes and qualifiers; main subject first when one exists |
| `reviews` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | yes | - | Legacy reviews |
| `related` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | yes | - | Legacy related books |
| `other_isbns` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Other ISBNs |

### `BookWithPrices`

Extends `Book` with an optional `prices` array. Prices are returned only by
`GET /book/{isbn}` when `with_prices=1` and the subscription plan includes
price access.

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `prices` | `array<Price>` | no | yes | no | - | Live merchant offers |

### `AuthorDetailsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `author` | string | yes | no | no | - | Author identifier/name |
| `name` | string | yes | no | no | - | Display name |
| `books` | `oneOf(array<Book>, object<string,Book>)` | yes | no | no | - | Books |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `SearchAuthorsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | string | yes | no | no | - | Query string |
| `authors` | `oneOf(array<string>, object<string,string>)` | yes | no | no | - | Author names |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `GetBookResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `book` | `BookWithPrices` | yes | no | no | - | Book payload, optionally including live prices |

### `ErrorResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `message` | string | yes | no | yes | - | Legacy error field |
| `errorMessage` | string | yes | no | no | - | Current error field |
| `code` | string (`rate_limited`, `quota_exceeded`) | no | yes | no | `null` | HTTP 429 only: per-minute limit (`rate_limited`) or daily quota (`quota_exceeded`) |

### `GetBooksMultipleResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `total` | integer | yes | no | no | - | Number of returned books |
| `data` | `array<Book>` | yes | no | no | - | Books matching submitted ISBNs |
| `requested` | integer | no | yes | no | `null` | Number of requested ISBNs |

### `SearchBooksPaginatedResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `books` | `array<Book>` | yes | no | no | - | Matching books for the requested page |
| `total` | integer | yes | no | no | - | Matching records, capped at 10,000 |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Requested page size |

### `PlanLimit`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `total` | integer | yes | no | no | - | Daily subscription quota shared by every key |
| `spent` | integer | yes | no | no | - | Calls charged today across the subscription |
| `left` | integer | yes | no | no | - | Calls remaining under whichever subscription or key allowance is lower |
| `key_total` | integer | no | yes | no | `null` | Daily allowance attached to this key, when capped |
| `key_spent` | integer | no | no | no | `0` | Calls charged today to this key |
| `key_left` | integer | no | yes | no | `null` | Calls remaining under this key's own cap |
| `limited_by` | string (`subject`, `key`) | no | no | no | `subject` | Allowance that runs out first |

### `KeyResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `api_host` | string | yes | no | no | - | API host |
| `plan_limit` | `PlanLimit` | yes | no | no | - | Plan quota details |
| `plan_name` | string | yes | no | no | - | Subscription plan name |
| `bulk_limit` | integer | yes | no | no | - | Maximum ISBNs accepted by one `POST /books` request |

### `DetailsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | string | yes | no | no | - | Entity name |
| `books` | `oneOf(array<Book>, object<string,Book>)` | yes | no | no | - | Books list |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `SearchPublishersResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | string | yes | no | no | - | Query string |
| `publishers` | `oneOf(array<string>, object<string,string>)` | yes | no | no | - | Publisher names |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `SearchBaseResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | string | yes | no | no | - | Query string |
| `data` | `oneOf(array<string>, object<string,string>)` | yes | no | no | - | Generic data list |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `SearchBookResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `data` | `Book` | yes | no | no | - | Book payload |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `BaseStatsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `books` | integer | yes | no | no | - | Number of books |
| `authors` | integer | yes | no | no | - | Number of authors |
| `publishers` | integer | yes | no | no | - | Number of publishers |
| `subjects` | integer | yes | no | no | - | Number of subjects |

### `SearchSubjectResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | string | yes | no | no | - | Query string |
| `subjects` | `oneOf(array<string>, object<string,string>)` | yes | no | no | - | Subject names |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `SubjectDetailsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `subject` | string | yes | no | no | - | Subject identifier/name |
| `name` | string | yes | no | no | - | Display name |
| `books` | `oneOf(array<Book>, object<string,Book>)` | yes | no | no | - | Books |
| `total` | integer | yes | no | no | - | Total results |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `ThemaEntry`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `code` | string | yes | no | no | - | Thema code |
| `name` | string | yes | no | no | - | English name of the code |
| `type` | string (`subject`, `place`, `language`, `time`, `education`, `interest`, `style`) | yes | no | no | - | What the code describes: the subject itself, or a qualifier for place, language, time, education, interest or style |
| `main` | boolean | yes | no | no | - | True for the main subject of the book, which is always the first entry. A book classified only by qualifiers has no main entry. |

### `ThemaNode`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `code` | string | yes | no | no | - | Thema code |
| `name` | string | yes | no | no | - | English name of the code |
| `type` | string (`subject`, `place`, `language`, `time`, `education`, `interest`, `style`) | yes | no | no | - | What the code describes: the subject itself, or a qualifier |
| `parent` | string | no | yes | no | - | Code of the parent; absent for a top-level code |
| `has_children` | boolean | yes | no | no | - | True when narrower codes sit under this one |

### `ThemaListFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `parent` | string | no | yes | no | `null` | List the codes directly under this code. Combined with `q`, search only below this code. Without `parent` and `q`, the top-level codes are listed. |
| `type` | string (`subject`, `place`, `language`, `time`, `education`, `interest`, `style`) | no | yes | no | `null` | Only codes of this type |
| `q` | string | no | yes | no | `null` | Search codes by name (case-insensitive substring) or by code prefix. 2 to 100 characters. |
| `codes` | string | no | yes | no | `null` | Return exactly these codes, comma-separated, up to 100, in the order given. Retired codes come back as their replacement; unknown codes are skipped. `parent`, `type`, `q` and paging are ignored. |
| `withAncestors` | boolean | no | no | no | `false` | With `codes`: also return every broader code of each code, before it, so breadcrumbs can be built from one call. |

### `ThemaListResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `total` | integer | yes | no | no | - | Number of matching codes; with `codes`, the number of codes returned |
| `page` | integer | yes | no | no | - | The page this response was built from |
| `page_size` | integer | yes | no | no | - | Page size the response was built with; with `codes`, the number of codes returned |
| `codes` | `array<ThemaNode>` | yes | no | no | - | Matching codes: in code order when listing a level, by relevance with `q`, and in the requested order with `codes` (each code preceded by its broader codes with `withAncestors`, duplicates removed) |

### `ThemaDetailsResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `code` | string | yes | no | no | - | Thema code |
| `name` | string | yes | no | no | - | English name of the code |
| `type` | string (`subject`, `place`, `language`, `time`, `education`, `interest`, `style`) | yes | no | no | - | What the code describes: the subject itself, or a qualifier |
| `parent` | string | no | yes | no | - | Code of the parent; absent for a top-level code |
| `ancestors` | `array<ThemaNode>` | yes | no | no | - | Broader codes from the top level down to the parent |
| `children` | `array<ThemaNode>` | yes | no | no | - | Codes directly under this one, ordered by code |
| `replaced_from` | string | no | yes | no | `null` | The retired code from the request when it was replaced by this one; absent otherwise |

### `ThemaBooksResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `thema` | `ThemaNode` | yes | no | no | - | Resolved Thema classification |
| `books` | `array<Book>` | yes | no | no | - | Books for the requested page |
| `total` | integer | yes | no | no | - | Number of matching books, counted up to 1,000. Larger subjects report exactly 1000, and paging stops there as well. |
| `page` | integer | yes | no | no | - | The page this response was built from |
| `page_size` | integer | yes | no | no | - | Page size the response was built with. The result array can be shorter than this: records that cannot be resolved are dropped after the match. |

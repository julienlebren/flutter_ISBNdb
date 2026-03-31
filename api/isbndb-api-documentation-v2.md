# ISBNdb API v2 (OpenAPI 2.7.0)

Source: user-provided `doc.json` (OpenAPI 3.0.0)

## API metadata

- Title: `ISBNdb API v2`
- Version: `2.7.0`
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

## Endpoints summary

| Path | Method | Tag | Deprecated | Operation ID | Success schema |
| --- | --- | --- | --- | --- | --- |
| `/author/{name}` | GET | Author | no | `get_app_api_author_authordetails__invoke` | `AuthorDetailsResponse` |
| `/authors/{query}` | GET | Author | no | `get_app_api_author_searchauthors__invoke` | `SearchAuthorsResponse` |
| `/book/{isbn}` | GET | Books | no | `get_app_api_book_book__invoke` | `GetBookResponse` |
| `/books` | POST | Books | no | `post_app_api_book_bookmultiple__invoke` | `GetBooksMultipleResponse` |
| `/books/{query}` | GET | Books | no | `get_app_api_book_searchbook__invoke` | `GetBooksMultipleResponse` |
| `/feeds/books/updates` | GET | Feed | no | `get_app_api_feed_updatedbooks__invoke` | `UpdatedBooksResponse` |
| `/key` | GET | default | no | `get_app_api_key__invoke` | `KeyResponse` |
| `/publisher/{name}` | GET | Publisher | no | `get_app_api_publisher_publisherdetails__invoke` | `DetailsResponse` |
| `/publishers/{query}` | GET | Publisher | no | `get_app_api_publisher_searchpublishers__invoke` | `SearchPublishersResponse` |
| `/search/authors` | GET | Search | yes | `get_app_api_search_searchauthors__invoke` | `SearchBaseResponse` |
| `/search/books` | GET | Search | no | `get_app_api_search_searchbooks__invoke` | `SearchBookResponse` |
| `/search/publishers` | GET | Search | yes | `get_app_api_search_searchpublishers__invoke` | `SearchBaseResponse` |
| `/search/subjects` | GET | Search | yes | `get_app_api_search_searchsubjects__invoke` | `SearchBaseResponse` |
| `/stats` | GET | default | no | `get_app_api_stats_getstats__invoke` | `BaseStatsResponse` |
| `/subjects/{query}` | GET | Subject | no | `get_app_api_subject_searchsubjects__invoke` | `SearchSubjectResponse` |
| `/subject/{name}` | GET | Subject | no | `get_app_api_subject_subjectsdetails__invoke` | `SubjectDetailsResponse` |

## Endpoint details

### `GET /author/{name}`

Returns the author name and a list of books.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Author name |
| `language` | query | string | no | `null` | yes | Language code (`en`, `fr`, ...) |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `AuthorDetailsResponse`

### `GET /authors/{query}`

Search authors by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `SearchAuthorsResponse`

### `GET /book/{isbn}`

Returns book details.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `with_prices` | query | boolean | no | `false` | no | Include real-time vendor prices |
| `isbn` | path | string | yes | - | no | ISBN |

Responses:
- `200`: `GetBookResponse`
- `404`: `ErrorResponse`

### `POST /books`

Returns details for multiple ISBNs (plan limits apply).

Request body:
- Required: yes
- Content types:
- `application/json` -> `GetBooksMultipleRequest`
- `application/x-www-form-urlencoded` -> `GetBooksMultipleRequest`

Responses:
- `200`: `GetBooksMultipleResponse`

### `GET /books/{query}`

Search books by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `year` | query | integer | no | `null` | yes | Publication year |
| `edition` | query | integer | no | `null` | yes | Edition |
| `should_match_all` | query | boolean | no | `false` | yes | Match all words in title/author |
| `language` | query | string | no | `null` | yes | Language code |
| `column_enum` | query | enum(`Column`) | no | - | yes | One of: `title`, `author`, `date_published`, `subjects` |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `GetBooksMultipleResponse`

### `GET /feeds/books/updates`

Returns a paginated feed of recently updated ISBNs.

Important notes from the OpenAPI description:
- Premium plans only
- History limited to the last 7 days
- Does not count against daily API quota
- Response may omit `total`; keep paging until `data` is empty

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `page` | query | integer | no | `1` | yes | The number of page to retrieve |
| `pageSize` | query | integer | no | `100` | yes | How many items should be returned per page, maximum of 1,000 |
| `lastUpdated` | query | string | no | `null` | yes | Filter by last updated date (`YYYY-MM-DD`) |

Responses:
- `200`: `UpdatedBooksResponse`

### `GET /key`

Returns key details.

Responses:
- `200`: `KeyResponse`

### `GET /publisher/{name}`

Returns publisher details and books.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Publisher name |
| `language` | query | string | no | `null` | yes | Language code |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `DetailsResponse`

### `GET /publishers/{query}`

Search publishers by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `SearchPublishersResponse`

### `GET /search/authors` (deprecated)

Deprecated in favor of `/authors/{query}`.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page |
| `offset` | query | integer | yes | - | no | Offset |

Responses:
- `200`: `SearchBaseResponse`

### `GET /search/books`

Search the books index with optional filters.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page |
| `offset` | query | integer | yes | - | no | Offset |
| `isbn` | query | string | no | - | yes | ISBN-10 |
| `isbn13` | query | string | no | - | yes | ISBN-13 |
| `author` | query | string | no | - | yes | Author name |
| `text` | query | string | no | - | yes | Free text |
| `subject` | query | string | no | - | yes | Subject |
| `publisher` | query | string | no | - | yes | Publisher name |

Responses:
- `200`: `SearchBookResponse`

### `GET /search/publishers` (deprecated)

Deprecated in favor of `/publishers/{query}`.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page |
| `offset` | query | integer | yes | - | no | Offset |

Responses:
- `200`: `SearchBaseResponse`

### `GET /search/subjects` (deprecated)

Deprecated endpoint.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `text` | query | string | yes | - | no | Search text |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page |
| `offset` | query | integer | yes | - | no | Offset |

Responses:
- `200`: `SearchBaseResponse`

### `GET /stats`

Returns global counts.

Responses:
- `200`: `BaseStatsResponse`

### `GET /subjects/{query}`

Search subjects by query.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `query` | path | string | yes | - | no | Search string |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `SearchSubjectResponse`

### `GET /subject/{name}`

Returns subject details and related books.

| Name | In | Type | Required | Default | Nullable | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `name` | path | string | yes | - | no | Subject name |
| `language` | query | string | no | `null` | yes | Language code |
| `page` | query | integer | no | `1` | yes | Page number |
| `page_size` | query | integer | no | `20` | yes | Items per page (max 1000) |
| `offset` | query | integer | no | - | no | Offset |

Responses:
- `200`: `SubjectDetailsResponse`

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
| `PaginationFilters` | `offset` | `page`, `page_size`, `offset` |
| `GetBooksMultipleRequest` | `isbns` | `isbns` (array or object) |
| `Column` | - | enum: `title`, `author`, `date_published`, `subjects` |
| `SearchBookFilters` | - | `year`, `edition`, `should_match_all`, `language`, `column_enum` |
| `SearchBookFilters2` | - | `isbn`, `isbn13`, `author`, `text`, `subject`, `publisher` |
| `Point` | `x`, `y` | `x`, `y` |
| `Price` | `condition`, `merchant`, `merchant_logo`, `merchant_logo_offset`, `shipping`, `price`, `total`, `link` | price row fields |
| `Book` | `title`, `title_long`, `isbn`, `isbn13`, `date_published` | `isbn10`, `dewey_decimal`, `binding`, `publisher`, `language`, `edition`, `pages`, `dimensions`, `dimensions_structured`, `overview`, `image`, `image_original`, `msrp`, `excerpt`, `synopsis`, `authors`, `subjects`, `reviews`, `prices`, `related`, `other_isbns` |
| `AuthorDetailsResponse` | `author`, `name`, `books`, `total`, `page`, `page_size` | author + books + pagination |
| `SearchAuthorsResponse` | `name`, `authors`, `total`, `page`, `page_size` | authors list + pagination |
| `GetBookResponse` | `book` | `book` |
| `ErrorResponse` | `message`, `error_message` | `message` (deprecated), `error_message` |
| `GetBooksMultipleResponse` | `total`, `data` | `data`, `requested` |
| `UpdatedBook` | `isbn13`, `updated_at` | `isbn13`, `updated_at` |
| `UpdatedBooksResponse` | `data`, `page`, `page_size` | `data`, `page`, `page_size` |
| `PlanLimit` | `total`, `spent`, `left` | quota counters |
| `KeyResponse` | `api_host`, `plan_limit` | host + limits |
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

## Schema details

### `LanguageFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `language` | string | no | yes | no | `null` | Language code (`en`, `fr`, ...) |

### `PaginationFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `page` | integer | no | yes | no | `1` | Page number |
| `page_size` | integer | no | yes | no | `20` | Items per page (max 1000) |
| `offset` | integer | yes | no | no | - | Offset |

### `GetBooksMultipleRequest`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbns` | `oneOf(array<oneOf(integer,string)>, object<string,oneOf(integer,string)>)` | yes | no | no | - | ISBN list (array) or ISBN map (object) |

### `UpdatedBook`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbn13` | string | yes | no | no | - | ISBN-13 |
| `updated_at` | string(date-time) | yes | no | no | - | Timestamp when the book was last updated |

### `UpdatedBooksResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `data` | `array<UpdatedBook>` | yes | no | no | - | Updated ISBN entries |
| `page` | integer | yes | no | no | - | Current page |
| `page_size` | integer | yes | no | no | - | Page size |

### `Column`

Type: `string`  
Enum values: `title`, `author`, `date_published`, `subjects`

### `SearchBookFilters`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `year` | integer | no | yes | no | `null` | Filter books by publication year |
| `edition` | integer | no | yes | no | `null` | Filter books by edition |
| `should_match_all` | boolean | no | yes | no | `false` | Match all words in title/author |
| `language` | string | no | yes | no | `null` | Language code (`en`, `fr`, ...) |
| `column_enum` | `oneOf(Column)` | no | yes | no | - | Column filter |

### `SearchBookFilters2`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `isbn` | string | no | yes | no | - | ISBN-10 |
| `isbn13` | string | no | yes | no | - | ISBN-13 |
| `author` | string | no | yes | no | - | Author name |
| `text` | string | no | yes | no | - | Generic text query |
| `subject` | string | no | yes | no | - | Subject |
| `publisher` | string | no | yes | no | - | Publisher name |

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

### `Book`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `title` | string | yes | no | no | - | Title |
| `title_long` | string | yes | no | yes | - | Legacy long title |
| `isbn` | string | yes | no | yes | - | Legacy ISBN-13 field |
| `isbn13` | string | yes | no | no | - | ISBN-13 |
| `isbn10` | string | no | yes | no | - | ISBN-10 if available |
| `dewey_decimal` | `array<string>` | no | yes | no | - | Dewey decimals |
| `binding` | string | no | yes | no | - | Binding |
| `publisher` | string | no | yes | no | - | Publisher |
| `language` | string | no | yes | no | - | Language |
| `date_published` | string(date) | yes | no | no | - | Publication date (`YYYY-MM-DD`, `YYYY-MM`, or `YYYY`) |
| `edition` | string | no | yes | no | - | Edition |
| `pages` | integer | no | yes | no | - | Number of pages |
| `dimensions` | string | no | yes | yes | - | Legacy dimensions |
| `dimensions_structured` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Structured dimensions |
| `overview` | string | no | yes | yes | - | Legacy overview |
| `image` | string | no | yes | no | - | Cover image URL |
| `image_original` | string | no | yes | no | - | Original image URL |
| `msrp` | number(float) | no | yes | no | - | MSRP |
| `excerpt` | string | no | yes | no | - | Excerpt |
| `synopsis` | string | no | yes | no | - | Synopsis |
| `authors` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Authors |
| `subjects` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Subjects |
| `reviews` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | yes | - | Legacy reviews |
| `prices` | `array<Price>` | no | yes | no | - | Vendor prices |
| `related` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | yes | - | Legacy related books |
| `other_isbns` | `oneOf(array<nullable>, object<string,nullable>)` | no | yes | no | - | Other ISBNs |

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
| `book` | `Book` | yes | no | no | - | Book payload |

### `ErrorResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `message` | string | yes | no | yes | - | Legacy error field |
| `error_message` | string | yes | no | no | - | Current error field |

### `GetBooksMultipleResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `total` | integer | yes | no | no | - | Number of returned books |
| `data` | `oneOf(array<Book>, object<string,Book>)` | yes | no | no | - | Books payload |
| `requested` | integer | no | yes | no | `null` | Number of requested ISBNs |

### `PlanLimit`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `total` | integer | yes | no | no | - | Plan total quota |
| `spent` | integer | yes | no | no | - | Used quota |
| `left` | integer | yes | no | no | - | Remaining quota |

### `KeyResponse`

| Field | Type | Required | Nullable | Deprecated | Default | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `api_host` | string | yes | no | no | - | API host |
| `plan_limit` | `PlanLimit` | yes | no | no | - | Plan quota details |

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

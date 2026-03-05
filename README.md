[![@hikeland](https://img.shields.io/twitter/follow/hikeland?label=Hikeland&style=social)](https://twitter.com/hikeland)
![https://dart.dev/](https://img.shields.io/badge/Dart-2.0-blue)
![https://flutter.dev/](https://img.shields.io/badge/Flutter-2.0-blue)

# Dart/Flutter package for using ISBNdb API

This package is a ready-to-use API for ISBNdb.

![App preview](https://raw.githubusercontent.com/julienlebren/flutter_ISBNdb/main/assets/screenshot.jpg)

⚠️  You need an API key to use this service. To get it, create an account on [ISBNdb](https://isbndb.com/).

You can have a 7-day trial for free.

## Features of the API

This package allows you to use the main ISBNdb API features for books, authors, publishers, and subjects.

Before any request to the API, you need to init the service class with the following code:

```dart
final isbnDb = ISBNdb("your_key_here");
```

## Error handling

All request and parsing failures from `ISBNdb` methods throw `ISBNdbException`.

`ISBNdbException` contains:
- `message`: readable error description
- `method`: HTTP method (`GET`, `POST`, ...)
- `path`: API path (for example `book/9781092297370`)
- `statusCode`: optional HTTP status code (when available)
- `cause`: original underlying error

Example:

```dart
try {
  final book = await isbnDb.getBook("9781092297370");
  // use book
} on ISBNdbException catch (e) {
  print("ISBNdb error: ${e.message}");
  print("request: ${e.method} ${e.path}");
  print("status: ${e.statusCode}");
}
```

### Books

* **Get book details**

```dart
final book = isbnDb.getBook("9781092297370");
final book = isbnDb.getBook("9781092297370", withPrices: true);
```

Param | Description
------------ | -------------
String isbn | an ISBN 10 or ISBN 13 in the Books database
bool withPrices = false | indicate if shows Real Time Prices. Only with the Pro plan

* **Get many books with ISBNs**

```dart
final books = isbnDb.getBooksFromISBNs(["9781092297370", "9781680506952"]);
```

This endpoint supports all plans with limits per request depending on your plan:
- Academic: up to 10 ISBNs
- Basic: up to 100 ISBNs
- Pro/Premium: up to 1,000 ISBNs

Param | Description
------------ | -------------
List<String> isbns | a list of ISBN 10 or ISBN 13 in the Books database

* **Search books**

```dart
final books = isbnDb.getBooks(
  "Google Flutter",
  page: 1,
  pageSize: 20,
  year: 2024,
  edition: 2,
  shouldMatchAll: true,
  language: "en",
  column: BookColumn.subjects,
  offset: 0,
);
```

Param | Description
------------ | -------------
String query | A string to search for in the Book’s database
int page | The number of page to retrieve. The API returns up to 10,000 results in total
int pageSize | How many items should be returned per page, maximum of 1,000
int? year | Filter books by year of publication
int? edition | Filter books by edition
bool? shouldMatchAll | If true, title/author must contain all searched words
String? language | Language code filter (for example `en`, `fr`)
BookColumn? column | Search limited to a column
int? offset | Offset to start results from

`BookColumn` is an enum with the following values:
* title - Only searches in Books Title
* author - Only searches books by the given Author
* date_published - Only searches books in a given year, e.g. 1998
* subjects - Only searches in subjects

### Authors

* **Get author details**

```dart
final book = isbnDb.getAuthor(
  "Bussi Michel",
  page: 1,
  pageSize: 20,
);
```

Param | Description
------------ | -------------
String name | The name of an author in the Author's database
String page | The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them
String pageSize | How many items should be returned per page, maximum of 1,000

* **Search authors**

```dart
final book = isbnDb.getAuthors(
  "werber",
  page: 1,
  pageSize: 20,
);
```

Param | Description
------------ | -------------
String query | A string to search for in the Author’s database
String page | The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them
String pageSize | How many items should be returned per page, maximum of 1,000

### Publishers

* **Get publisher details**

```dart
final book = isbnDb.getPublisher(
  "Nathan",
  page: 1,
  pageSize: 20,
);
```

Param | Description
------------ | -------------
String name | The name of a publisher in the Publisher's database
String page | The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them
String pageSize | How many items should be returned per page, maximum of 1,000

* **Search publishers**

```dart
final book = isbnDb.getPublishers(
  "Nathan",
  page: 1,
  pageSize: 20,
);
```

Param | Description
------------ | -------------
String query | A string to search for in the Publisher’s database
String page | The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them
String pageSize | How many items should be returned per page, maximum of 1,000

### Subjects

* **Get subject details**

```dart
final book = isbnDb.getSubject("Flutter");
```

Param | Description
------------ | -------------
String name | A subject in the Subject's database

* **Search subjects**

```dart
final book = isbnDb.getSubjects(
  "flutter",
  page: 1,
  pageSize: 20,
);
```

Param | Description
------------ | -------------
String query | A string to search for in the Subject’s database
String page | The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them
String pageSize | How many items should be returned per page, maximum of 1,000

### Account & API stats

* **Get key details**

```dart
final keyDetails = isbnDb.getKeyDetails();
```

Returns your API host and current plan usage (`total`, `spent`, `left`).

* **Get global API stats**

```dart
final stats = isbnDb.getStats();
```

Returns global dataset counters (`books`, `authors`, `publishers`, `subjects`).

## Testing

- Offline tests: `flutter test --exclude-tags live`
- Live tests (requires secret): `ISBNDB_API_KEY=your_key flutter test --tags live`

Live tests are skipped automatically when `ISBNDB_API_KEY` is not set.

## Code generation

Regenerate `freezed`/`json_serializable` files with:

```sh
./scripts/generate.sh
```

This script also clears stale local `build_runner` snapshots before generation.

## Models

**AuthorQueryResult**

Name | Type | Description
------------ | ------------- | -------------
total | int | Number of results
authors | List<String> | An array containing the authors

**Author**

Name | Type | Description
------------ | ------------- | -------------
author | String | The name of the author
books | List<Book> | An array containing the books of this author

**BookQueryResult**

Name | Type | Description
------------ | ------------- | -------------
total | int | Number of results
books | List<Book> | An array containing the books of this query

**Book**

Name | Type | Description
------------ | ------------- | -------------
title | String | Title of the book
titleLong | String | Long version of the title
isbn | String | ISBN 
isbn13 | String | New 13-digit ISBN
deweyDecimal | String | Not documented in the official API
binding | String | Not documented in the official API
publisher | String | The name of the publisher
datePublished | DateTime | Date when the book was published. Can be a year or a full date.
edition | String | Details about the edition
pages | int | Number of pages of the book
dimensions | String | Dimensions of the book
overview | String | Not documented in the official API
image | String | URL of the cover
msrp | double | Not documented in the official API
excerpt | String | Excerpt of the book
synopsys | String | Synopsys of the book
authors | List<String> | List of the authors
subjects | List<String> | List of the subjects of the book
reviews | List<String> | Not documented in the official API
prices | List<Merchant> | List of the merchants selling this book with real-time prices
related | List<String> | Not documented in the official API

**Merchant**

Name | Type | Description
------------ | ------------- | -------------
condition | String | Number of results
merchant | String | Name of the merchant
merchantLogo | String | URL of the merchant logo
merchantLogoOffset | Map | Not documented in the official API
shipping | String | Shipping cost
price | String | Price of the book
total | String | Not documented in the official API
link | String | Link to the purchase url

**PublisherQueryResult**

Name | Type | Description
------------ | ------------- | -------------
total | int | Number of results
publishers | List<String> | An array containing the publishers

**Publisher**

Name | Type | Description
------------ | ------------- | -------------
name | String | The name of the publisher
books | List<Book> | An array containing the books of this publisher

**SubjectQueryResult**

Name | Type | Description
------------ | ------------- | -------------
total | int | Number of results
subjects | List<String> | An array containing the subjects

**Subject**

Name | Type | Description
------------ | ------------- | -------------
subject | String | The subject
books | List<Book> | An array containing the books related to this subject

**KeyDetails**

Name | Type | Description
------------ | ------------- | -------------
apiHost | String | API host attached to your key
planLimit | PlanLimit | Usage details of the current API plan

**PlanLimit**

Name | Type | Description
------------ | ------------- | -------------
total | int | Total requests available on the current period
spent | int | Requests already used
left | int | Requests remaining

**Stats**

Name | Type | Description
------------ | ------------- | -------------
books | int | Number of books indexed by ISBNdb
authors | int | Number of authors indexed by ISBNdb
publishers | int | Number of publishers indexed by ISBNdb
subjects | int | Number of subjects indexed by ISBNdb

## Third party packages

This app uses some external librairies:

- [x] [Freezed](https://pub.dev/packages/freezed) to generate immutable models
- [x] [Dio](https://pub.dev/packages/dio) for http requests

## Credits

This package was originally created for my personnal needs but feel free to use it, it covers all the features of the ISBNdb API and I will maintain it.

I am not related to ISBNdb in any way, I am just a developer who needed to use this API and created this library to do so.

If you have questions, feel free to ask on [Twitter](https://twitter.com/hikeland).

## [LICENSE: MIT](LICENSE.md)

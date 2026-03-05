import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';

void main() {
  group("ISBNdb", () {
    test('Should get books from Michel Bussi', () async {
      final isbndb = _createClient();
      final author = await isbndb.getAuthor("Bussi Michel");
      expect(author, isA<Author>());
      expect(author!.author, "Bussi Michel");
    });

    test('Should get authors matching name werber', () async {
      final isbndb = _createClient();
      final authors = await isbndb.getAuthors("werber");
      expect(authors, isA<AuthorQueryResult>());
      expect(authors.authors, contains("Bernard Werber"));
    });

    test('Should get "Learn Google Flutter Fast"', () async {
      final isbndb = _createClient();
      final book = await isbndb.getBook("9781092297370");
      expect(book, isA<Book>());
      expect(book!.title, "Learn Google Flutter Fast");
    });

    test('Should get books about Flutter', () async {
      final isbndb = _createClient();
      final books = await isbndb.getBooks("Google Flutter");
      expect(books, isA<BookQueryResult>());
      expect(books.books.length, 1);
    });

    test('Should parse getBooks response from data array', () async {
      final isbndb = _createClient(
        responses: {
          ..._defaultResponses(),
          "GET books/flutter-data": {
            "total": 1,
            "data": [
              _book(
                title: "Data Response Book",
                isbn: "1234567890",
                isbn13: "9781234567897",
              ),
            ],
          },
        },
      );

      final books = await isbndb.getBooks("flutter-data");

      expect(books.total, 1);
      expect(books.books, hasLength(1));
      expect(books.books.first.isbn13, "9781234567897");
    });

    test('Should parse getBooks response from data object map', () async {
      final isbndb = _createClient(
        responses: {
          ..._defaultResponses(),
          "GET books/flutter-map": {
            "total": 2,
            "data": {
              "9781092297370": _book(
                title: "Learn Google Flutter Fast",
                isbn: "1092297370",
                isbn13: "9781092297370",
              ),
              "9781680506952": _book(
                title: "Programming Flutter",
                isbn: "1680506955",
                isbn13: "9781680506952",
              ),
            },
          },
        },
      );

      final books = await isbndb.getBooks("flutter-map");

      expect(books.total, 2);
      expect(books.books, hasLength(2));
      expect(
        books.books.map((book) => book.isbn13).toSet(),
        containsAll(<String>["9781092297370", "9781680506952"]),
      );
    });

    test('Should get books from ISBNs', () async {
      final isbndb = _createClient();
      final books = await isbndb.getBooksFromISBNs([
        "9781092297370",
        "9781680506952",
      ]);
      expect(books, isA<BookQueryResult>());
      expect(books.books.length, 2);
      expect(books.books.first, isA<Book>());
    });

    test('Should send ISBN list payload for batch endpoint', () async {
      RequestOptions? options;
      final isbndb = _createClient(
        onRequestCallback: (requestOptions) => options = requestOptions,
      );
      const isbns = ["9781092297370", "9781680506952"];

      await isbndb.getBooksFromISBNs(isbns);

      expect(options, isNotNull);
      expect(options!.method.toUpperCase(), "POST");
      expect(options!.data, isA<Map<String, dynamic>>());
      expect((options!.data as Map<String, dynamic>)["isbns"], equals(isbns));
    });

    test('Should get list of publishers matching "Nathan"', () async {
      final isbndb = _createClient();
      final publishers = await isbndb.getPublishers("Nathan");
      expect(publishers, isA<PublisherQueryResult>());
      expect(publishers.publishers, contains("Nathan"));
    });

    test('Should get books from publisher Nathan', () async {
      final isbndb = _createClient();
      final publisher = await isbndb.getPublisher("Nathan");
      expect(publisher, isA<Publisher>());
      expect(publisher!.name, "Nathan");
    });

    test('Should get list of subjects matching "flutter"', () async {
      final isbndb = _createClient();
      final subjects = await isbndb.getSubjects("flutter");
      expect(subjects, isA<SubjectQueryResult>());
      expect(subjects.subjects, contains("flutter"));
    });

    test('Should get books matching subject "flutter"', () async {
      final isbndb = _createClient();
      final subject = await isbndb.getSubject("flutter");
      expect(subject, isA<Subject>());
      expect(subject!.subject, "flutter");
    });

    test('Should send column enum name to API', () async {
      RequestOptions? options;
      final isbndb = _createClient(
        onRequestCallback: (requestOptions) => options = requestOptions,
      );

      await isbndb.getBooks("Google Flutter", column: BookColumn.title);

      expect(options, isNotNull);
      expect(options!.queryParameters["column_enum"], "title");
      expect(options!.queryParameters["column"], "title");
    });

    test(
      'Should send expected query parameters for getBooks filters',
      () async {
        RequestOptions? options;
        final isbndb = _createClient(
          onRequestCallback: (requestOptions) => options = requestOptions,
        );

        await isbndb.getBooks(
          "Google Flutter",
          page: 2,
          pageSize: 5,
          year: 2024,
          edition: 2,
          shouldMatchAll: true,
          language: "en",
          column: BookColumn.subjects,
          offset: 10,
        );

        expect(options, isNotNull);
        expect(options!.queryParameters["page"], 2);
        expect(options!.queryParameters["page_size"], 5);
        expect(options!.queryParameters["pageSize"], 5);
        expect(options!.queryParameters["year"], 2024);
        expect(options!.queryParameters["edition"], 2);
        expect(options!.queryParameters["should_match_all"], true);
        expect(options!.queryParameters["language"], "en");
        expect(options!.queryParameters["column_enum"], "subjects");
        expect(options!.queryParameters["column"], "subjects");
        expect(options!.queryParameters["offset"], 10);
      },
    );

    test('Should not send optional filters when not provided', () async {
      RequestOptions? options;
      final isbndb = _createClient(
        onRequestCallback: (requestOptions) => options = requestOptions,
      );

      await isbndb.getBooks("Google Flutter");

      expect(options, isNotNull);
      expect(options!.queryParameters["page"], 1);
      expect(options!.queryParameters["page_size"], 20);
      expect(options!.queryParameters["pageSize"], 20);
      expect(options!.queryParameters.containsKey("year"), isFalse);
      expect(options!.queryParameters.containsKey("edition"), isFalse);
      expect(options!.queryParameters.containsKey("should_match_all"), isFalse);
      expect(options!.queryParameters.containsKey("language"), isFalse);
      expect(options!.queryParameters.containsKey("column_enum"), isFalse);
      expect(options!.queryParameters.containsKey("column"), isFalse);
      expect(options!.queryParameters.containsKey("offset"), isFalse);
    });

    test(
      'Should send should_match_all=false when explicitly provided',
      () async {
        RequestOptions? options;
        final isbndb = _createClient(
          onRequestCallback: (requestOptions) => options = requestOptions,
        );

        await isbndb.getBooks("Google Flutter", shouldMatchAll: false);

        expect(options, isNotNull);
        expect(options!.queryParameters["should_match_all"], isFalse);
      },
    );

    test('Should not throw when msrp is non-numeric', () async {
      final isbndb = _createClient(
        responses: {
          ..._defaultResponses(),
          "GET book/9780000000000": {
            "book": {
              ..._book(
                title: "Unknown MSRP",
                isbn: "0000000000",
                isbn13: "9780000000000",
              ),
              "msrp": "N/A",
            },
          },
        },
      );

      final book = await isbndb.getBook("9780000000000");
      expect(book, isNotNull);
      expect(book!.msrp, isNull);
    });

    test('Should throw ISBNdbException when API returns 401', () async {
      final isbndb = _createClient(
        statusCodes: {"GET book/9781092297370": 401},
      );

      await expectLater(
        () => isbndb.getBook("9781092297370"),
        throwsA(
          isA<ISBNdbException>()
              .having((exception) => exception.statusCode, "statusCode", 401)
              .having((exception) => exception.method, "method", "GET")
              .having(
                (exception) => exception.path,
                "path",
                "book/9781092297370",
              ),
        ),
      );
    });

    test(
      'Should throw ISBNdbException when response JSON is not an object',
      () async {
        final isbndb = _createClient(
          rawResponses: {
            "GET book/9784444444444": utf8.encode('["unexpected", "shape"]'),
          },
        );

        await expectLater(
          () => isbndb.getBook("9784444444444"),
          throwsA(
            isA<ISBNdbException>()
                .having(
                  (exception) => exception.message,
                  "message",
                  "Received an invalid response format from API server",
                )
                .having((exception) => exception.method, "method", "GET")
                .having(
                  (exception) => exception.path,
                  "path",
                  "book/9784444444444",
                ),
          ),
        );
      },
    );

    test('Should throw ISBNdbException when network call fails', () async {
      final isbndb = _createClient(
        failureTypes: {
          "GET book/9785555555555": DioExceptionType.connectionError,
        },
      );

      await expectLater(
        () => isbndb.getBook("9785555555555"),
        throwsA(
          isA<ISBNdbException>()
              .having((exception) => exception.statusCode, "statusCode", isNull)
              .having((exception) => exception.method, "method", "GET")
              .having(
                (exception) => exception.path,
                "path",
                "book/9785555555555",
              )
              .having(
                (exception) => exception.cause,
                "cause",
                isA<DioException>(),
              ),
        ),
      );
    });

    test('Should throw ISBNdbException when model parsing fails', () async {
      final isbndb = _createClient(
        responses: {
          ..._defaultResponses(),
          "GET book/9783333333333": {
            "book": {"isbn": "3333333333", "isbn13": "9783333333333"},
          },
        },
      );

      await expectLater(
        () => isbndb.getBook("9783333333333"),
        throwsA(
          isA<ISBNdbException>()
              .having(
                (exception) => exception.message,
                "message",
                "Received an unexpected data format from API server",
              )
              .having((exception) => exception.method, "method", "GET")
              .having(
                (exception) => exception.path,
                "path",
                "book/9783333333333",
              )
              .having((exception) => exception.cause, "cause", isNotNull),
        ),
      );
    });

    test('Should parse year-only and ISO date_published values', () async {
      final yearBook = Book.fromJson({
        ..._book(
          title: "Year Book",
          isbn: "1111111111",
          isbn13: "9781111111111",
        ),
        "date_published": "1998",
      });
      final isoBook = Book.fromJson({
        ..._book(
          title: "ISO Book",
          isbn: "2222222222",
          isbn13: "9782222222222",
        ),
        "date_published": "2022-03-25t10:20:30z",
      });

      expect(yearBook.datePublished, DateTime(1998));
      expect(isoBook.datePublished, DateTime.parse("2022-03-25T10:20:30Z"));
    });
  });
}

ISBNdb _createClient({
  Map<String, Map<String, dynamic>>? responses,
  Map<String, int>? statusCodes,
  Map<String, List<int>>? rawResponses,
  Map<String, DioExceptionType>? failureTypes,
  void Function(RequestOptions options)? onRequestCallback,
}) {
  final dio = Dio()
    ..interceptors.add(
      _StubApiInterceptor(
        responses: responses ?? _defaultResponses(),
        statusCodes: statusCodes ?? const {},
        rawResponses: rawResponses ?? const {},
        failureTypes: failureTypes ?? const {},
        onRequestCallback: onRequestCallback,
      ),
    );
  return ISBNdb("test-api-key", dio: dio);
}

Map<String, Map<String, dynamic>> _defaultResponses() => {
  "GET author/Bussi Michel": {
    "author": "Bussi Michel",
    "books": [
      _book(
        title: "Nymphéas Noirs",
        isbn: "2266246197",
        isbn13: "9782266246194",
      ),
    ],
  },
  "GET authors/werber": {
    "total": 1,
    "authors": ["Bernard Werber"],
  },
  "GET book/9781092297370": {
    "book": _book(
      title: "Learn Google Flutter Fast",
      isbn: "1092297370",
      isbn13: "9781092297370",
      msrp: "39.99",
    ),
  },
  "GET books/Google Flutter": {
    "total": 1,
    "books": [
      _book(
        title: "Learn Google Flutter Fast",
        isbn: "1092297370",
        isbn13: "9781092297370",
      ),
    ],
  },
  "POST books": {
    "total": 2,
    "data": [
      _book(
        title: "Learn Google Flutter Fast",
        isbn: "1092297370",
        isbn13: "9781092297370",
      ),
      _book(
        title: "Programming Flutter",
        isbn: "1680506955",
        isbn13: "9781680506952",
      ),
    ],
  },
  "GET publishers/Nathan": {
    "total": 1,
    "publishers": ["Nathan"],
  },
  "GET publisher/Nathan": {"name": "Nathan", "books": []},
  "GET subjects/flutter": {
    "total": 1,
    "subjects": ["flutter"],
  },
  "GET subject/flutter": {"subject": "flutter", "books": []},
};

Map<String, dynamic> _book({
  required String title,
  required String isbn,
  required String isbn13,
  dynamic msrp,
}) => <String, dynamic>{
  "title": title,
  "isbn": isbn,
  "isbn13": isbn13,
  if (msrp != null) "msrp": msrp,
};

class _StubApiInterceptor extends Interceptor {
  _StubApiInterceptor({
    required this.responses,
    required this.statusCodes,
    required this.rawResponses,
    required this.failureTypes,
    this.onRequestCallback,
  });

  final Map<String, Map<String, dynamic>> responses;
  final Map<String, int> statusCodes;
  final Map<String, List<int>> rawResponses;
  final Map<String, DioExceptionType> failureTypes;
  final void Function(RequestOptions options)? onRequestCallback;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    onRequestCallback?.call(options);

    final uri = Uri.parse(options.path);
    final endpoint = Uri.decodeComponent(
      uri.path.startsWith("/") ? uri.path.substring(1) : uri.path,
    );
    final key = "${options.method.toUpperCase()} $endpoint";
    final simulatedFailureType = failureTypes[key];
    if (simulatedFailureType != null) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: simulatedFailureType,
          message: "Simulated request failure for $key",
        ),
      );
      return;
    }

    final rawPayload = rawResponses[key];
    if (rawPayload != null) {
      handler.resolve(
        Response<List<int>>(
          requestOptions: options,
          statusCode: statusCodes[key] ?? 200,
          data: rawPayload,
        ),
      );
      return;
    }

    final payload = responses[key];
    final statusCode = statusCodes[key] ?? 200;

    if (payload == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
          error: "No stub response for $key",
        ),
      );
      return;
    }

    if (statusCode != 200) {
      handler.reject(
        DioException(
          requestOptions: options,
          response: Response<List<int>>(
            requestOptions: options,
            statusCode: statusCode,
            data: utf8.encode(jsonEncode(payload)),
          ),
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }

    handler.resolve(
      Response<List<int>>(
        requestOptions: options,
        statusCode: statusCode,
        data: utf8.encode(jsonEncode(payload)),
      ),
    );
  }
}

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
      expect(options!.queryParameters["isbns"], equals(isbns));
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
      expect(options!.queryParameters["column"], "title");
    });

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

    test('Should throw DioException when API returns 401', () async {
      final isbndb = _createClient(
        statusCodes: {"GET book/9781092297370": 401},
      );

      await expectLater(
        () => isbndb.getBook("9781092297370"),
        throwsA(
          isA<DioException>().having(
            (exception) => exception.response?.statusCode,
            "statusCode",
            401,
          ),
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
  void Function(RequestOptions options)? onRequestCallback,
}) {
  final dio = Dio()
    ..interceptors.add(
      _StubApiInterceptor(
        responses: responses ?? _defaultResponses(),
        statusCodes: statusCodes ?? const {},
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
    "books": [
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
    this.onRequestCallback,
  });

  final Map<String, Map<String, dynamic>> responses;
  final Map<String, int> statusCodes;
  final void Function(RequestOptions options)? onRequestCallback;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    onRequestCallback?.call(options);

    final uri = Uri.parse(options.path);
    final endpoint = Uri.decodeComponent(
      uri.path.startsWith("/") ? uri.path.substring(1) : uri.path,
    );
    final key = "${options.method.toUpperCase()} $endpoint";
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

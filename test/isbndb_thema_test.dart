import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';

void main() {
  group('Thema models', () {
    test(
      'preserves book classifications and the main subject through JSON',
      () {
        final book = Book.fromJson(_bookJson());

        expect(book.thema, hasLength(2));
        expect(book.thema!.first.code, 'FBA');
        expect(book.thema!.first.type, ThemaType.subject);
        expect(book.thema!.first.main, isTrue);
        expect(book.thema!.last.type, ThemaType.place);
        expect(book.thema!.last.main, isFalse);
        expect(Book.fromJson(_jsonMap(book.toJson())), book);
        expect(book.copyWith(thema: []).thema, isEmpty);
      },
    );

    test('accepts books without Thema classifications', () {
      final json = _bookJson()..remove('thema');
      expect(Book.fromJson(json).thema, isNull);
      expect(Book.fromJson({...json, 'thema': null}).thema, isNull);
    });

    test('preserves the original 24-field book callbacks', () {
      final book = Book.fromJson({
        ..._bookJson(),
        'genres': ['Literary fiction'],
      });
      String legacyCallback(
        String title,
        String? titleLong,
        String isbn,
        String isbn13,
        String? deweyDecimal,
        String? binding,
        String? publisher,
        String? language,
        DateTime? datePublished,
        String? edition,
        int? editionNumber,
        int? pages,
        String? dimensions,
        String? overview,
        String? image,
        double? msrp,
        ListPrice? listPrice,
        String? excerpt,
        String? synopsys,
        List<String?>? authors,
        List<String>? subjects,
        List<String>? reviews,
        List<Merchant>? prices,
        List<String>? related,
      ) => '$title:$isbn13';
      const expected = 'A literary novel:9781092297370';

      expect(book.when(legacyCallback), expected);
      expect(
        book.maybeWhen(legacyCallback, orElse: () => 'fallback'),
        expected,
      );
      expect(
        book.maybeWhen<String>(null, orElse: () => 'fallback'),
        'fallback',
      );
      expect(book.whenOrNull(legacyCallback), expected);
      expect(book.whenOrNull<String>(null), isNull);
      expect(book.thema!.first.main, isTrue);
      expect(book.genres, ['Literary fiction']);
    });

    test(
      'decodes every Thema type and tolerates future classification types',
      () {
        for (final type in ThemaType.values) {
          final entry = ThemaEntry.fromJson({
            'code': 'FBA',
            'name': 'Fiction',
            'type': type.name,
            'main': true,
          });
          expect(entry.type, type);
          expect(entry.toJson()['type'], type.name);
        }
        final entry = ThemaEntry.fromJson({
          'code': 'X',
          'name': 'Future classification',
          'type': 'future',
          'main': false,
        });
        final node = ThemaNode.fromJson({..._nodeJson(), 'type': 'future'});
        final details = ThemaDetailsResponse.fromJson({
          ..._detailsJson(),
          'type': 'future',
        });
        expect(entry.type, ThemaType.unknown);
        expect(node.type, ThemaType.unknown);
        expect(details.type, ThemaType.unknown);
      },
    );

    test('handles root codes and optional retirement metadata', () {
      final root = ThemaNode.fromJson(_nodeJson(code: 'F', parent: null));
      final details = ThemaDetailsResponse.fromJson({
        ..._nodeJson(code: 'F', parent: null)..remove('has_children'),
        'ancestors': <Map<String, dynamic>>[],
        'children': [_nodeJson()],
      });

      expect(root.parent, isNull);
      expect(root.hasChildren, isTrue);
      expect(details.parent, isNull);
      expect(details.replacedFrom, isNull);
      expect(details.ancestors, isEmpty);
      expect(details.children.single.code, 'FBA');
      expect(
        ThemaDetailsResponse.fromJson(_jsonMap(details.toJson())),
        details,
      );
    });
  });

  group('Thema requests', () {
    test('lists top-level codes with default pagination', () async {
      RequestOptions? request;
      final client = _client(
        _listJson(),
        onRequest: (value) => request = value,
      );

      final result = await client.getThemaCodes();

      expect(Uri.parse(request!.path).path, '/thema');
      expect(request!.queryParameters, {
        'page': 1,
        'pageSize': 20,
        'withAncestors': false,
      });
      expect(result.total, 1);
      expect(result.page, 1);
      expect(result.pageSize, 20);
      expect(result.codes.single.hasChildren, isTrue);
      expect(ThemaListResponse.fromJson(_jsonMap(result.toJson())), result);
    });

    test('sends navigation filters and comma-separated code lookups', () async {
      RequestOptions? request;
      final client = _client(
        _listJson(),
        onRequest: (value) => request = value,
      );

      await client.getThemaCodes(
        parent: 'FB',
        type: ThemaType.subject,
        q: 'fiction',
        codes: ['FBA', '1KBB'],
        withAncestors: true,
        page: 2,
        pageSize: 50,
      );

      expect(request!.queryParameters, {
        'parent': 'FB',
        'type': 'subject',
        'q': 'fiction',
        'codes': 'FBA,1KBB',
        'withAncestors': true,
        'page': 2,
        'pageSize': 50,
      });
    });

    test('gets a replacement code and its navigation hierarchy', () async {
      RequestOptions? request;
      final client = _client(
        _detailsJson(),
        onRequest: (value) => request = value,
      );

      final result = await client.getThema('FYV');

      expect(Uri.parse(request!.path).path, '/thema/FYV');
      expect(request!.queryParameters, isEmpty);
      expect(result.code, 'FBA');
      expect(result.replacedFrom, 'FYV');
      expect(result.parent, 'FB');
      expect(result.ancestors.map((node) => node.code), ['F', 'FB']);
      expect(result.children.single.code, 'FBAA');
      expect(ThemaDetailsResponse.fromJson(_jsonMap(result.toJson())), result);
    });

    test('gets books by Thema with descendant matching by default', () async {
      RequestOptions? request;
      final client = _client(
        _themaBooksJson(),
        onRequest: (value) => request = value,
      );

      final result = await client.getBooksByThema('FBA');

      expect(Uri.parse(request!.path).path, '/thema/FBA/books');
      expect(request!.queryParameters, {
        'includeDescendants': true,
        'page': 1,
        'pageSize': 20,
      });
      expect(result.thema.code, 'FBA');
      expect(result.books.single.thema!.first.main, isTrue);
      expect(result.total, 1000);
      expect(result.page, 1);
      expect(result.pageSize, 20);
      expect(ThemaBooksResponse.fromJson(_jsonMap(result.toJson())), result);
    });

    test(
      'sends language, publication bounds, and exact-code selection',
      () async {
        RequestOptions? request;
        final client = _client(
          _themaBooksJson(),
          onRequest: (value) => request = value,
        );

        await client.getBooksByThema(
          'FBA',
          includeDescendants: false,
          language: 'fra',
          page: 3,
          pageSize: 50,
          publishedFrom: DateTime(2020, 1, 2, 15),
          publishedTo: DateTime(2026, 11, 16, 20),
        );

        expect(request!.queryParameters, {
          'includeDescendants': false,
          'language': 'fra',
          'page': 3,
          'pageSize': 50,
          'publishedFrom': '2020-01-02',
          'publishedTo': '2026-11-16',
        });
      },
    );

    test('adds Thema filtering to query-based book search', () async {
      RequestOptions? request;
      final client = _client(
        _searchJson(),
        onRequest: (value) => request = value,
      );

      final result = await client.getBooks('fiction', thema: ['FBA', '1KBB']);

      expect(Uri.parse(request!.path).path, '/books/fiction');
      expect(request!.queryParameters, {
        'page': 1,
        'pageSize': 20,
        'thema': 'FBA,1KBB',
      });
      expect(result.books.single.thema!.first.code, 'FBA');
    });

    test('searches by fields and serializes all optional filters', () async {
      RequestOptions? request;
      final client = _client(
        _searchJson(),
        onRequest: (value) => request = value,
      );

      final result = await client.searchBooks(
        author: 'An author',
        text: 'fiction',
        subject: 'Literature',
        publisher: 'A publisher',
        thema: ['FBA', '1KBB'],
        page: 2,
        pageSize: 50,
        publishedFrom: DateTime(2020, 1, 2),
        publishedTo: DateTime(2026, 11, 16),
      );

      expect(Uri.parse(request!.path).path, '/search/books');
      expect(request!.queryParameters, {
        'author': 'An author',
        'text': 'fiction',
        'subject': 'Literature',
        'publisher': 'A publisher',
        'thema': 'FBA,1KBB',
        'page': 2,
        'pageSize': 50,
        'publishedFrom': '2020-01-02',
        'publishedTo': '2026-11-16',
      });
      expect(result.books.single.title, 'A literary novel');
      expect(result.total, 1);
      expect(result.page, 1);
      expect(result.pageSize, 20);
    });

    for (final identifier in ['isbn', 'isbn13']) {
      test('searches with $identifier and omits unused filters', () async {
        RequestOptions? request;
        final client = _client(
          _searchJson(),
          onRequest: (value) => request = value,
        );

        await client.searchBooks(
          isbn: identifier == 'isbn' ? '1092297370' : null,
          isbn13: identifier == 'isbn13' ? '9781092297370' : null,
        );

        expect(request!.queryParameters, {
          identifier: identifier == 'isbn' ? '1092297370' : '9781092297370',
          'page': 1,
          'pageSize': 20,
        });
      });
    }

    test(
      'propagates server validation of incompatible search filters',
      () async {
        RequestOptions? request;
        final client = _client(
          {'errorMessage': 'Cannot combine ISBN with search fields'},
          statusCode: 400,
          onRequest: (value) => request = value,
        );

        await expectLater(
          () => client.searchBooks(isbn: '1092297370', thema: ['FBA']),
          throwsA(
            isA<ISBNdbException>()
                .having((error) => error.statusCode, 'statusCode', 400)
                .having(
                  (error) => error.message,
                  'message',
                  'Cannot combine ISBN with search fields',
                ),
          ),
        );
        expect(request!.queryParameters['isbn'], '1092297370');
        expect(request!.queryParameters['thema'], 'FBA');
      },
    );
  });
}

ISBNdb _client(
  Map<String, dynamic> response, {
  int statusCode = 200,
  void Function(RequestOptions)? onRequest,
}) {
  final dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          onRequest?.call(options);
          handler.resolve(
            Response<List<int>>(
              requestOptions: options,
              statusCode: statusCode,
              data: utf8.encode(jsonEncode(response)),
            ),
          );
        },
      ),
    );
  return ISBNdb('test-api-key', dio: dio);
}

Map<String, dynamic> _jsonMap(Map<String, dynamic> json) =>
    Map<String, dynamic>.from(jsonDecode(jsonEncode(json)) as Map);

Map<String, dynamic> _nodeJson({String code = 'FBA', String? parent = 'FB'}) =>
    {
      'code': code,
      'name': 'Fiction',
      'type': 'subject',
      if (parent != null) 'parent': parent,
      'has_children': true,
    };

Map<String, dynamic> _bookJson() => {
  'title': 'A literary novel',
  'isbn': '1092297370',
  'isbn13': '9781092297370',
  'thema': [
    {'code': 'FBA', 'name': 'Fiction', 'type': 'subject', 'main': true},
    {'code': '1KBB', 'name': 'United States', 'type': 'place', 'main': false},
  ],
};

Map<String, dynamic> _listJson() => {
  'total': 1,
  'page': 1,
  'page_size': 20,
  'codes': [_nodeJson()],
};

Map<String, dynamic> _detailsJson() => {
  'code': 'FBA',
  'name': 'Fiction',
  'type': 'subject',
  'parent': 'FB',
  'replaced_from': 'FYV',
  'ancestors': [
    _nodeJson(code: 'F', parent: null),
    _nodeJson(code: 'FB', parent: 'F'),
  ],
  'children': [_nodeJson(code: 'FBAA', parent: 'FBA')],
};

Map<String, dynamic> _themaBooksJson() => {
  'thema': _nodeJson(),
  'total': 1000,
  'page': 1,
  'page_size': 20,
  'books': [_bookJson()],
};

Map<String, dynamic> _searchJson() => {
  'total': 1,
  'page': 1,
  'page_size': 20,
  'data': [_bookJson()],
};

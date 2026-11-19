import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';

void main() {
  group('Book genres', () {
    test('preserves genre order and unfamiliar values through JSON', () {
      const genres = [
        'Young adult fantasy',
        'Fantasy',
        'Young adult',
        'Fiction',
        'A future genre',
      ];
      final book = Book.fromJson({..._bookJson(), 'genres': genres});

      expect(book.genres, genres);
      final encoded = jsonDecode(jsonEncode(book.toJson())) as Map;
      expect(encoded['genres'], genres);
      expect(Book.fromJson(Map<String, dynamic>.from(encoded)), book);
    });

    test('accepts absent, null, and empty genres', () {
      final absent = Book.fromJson(_bookJson());
      final explicitNull = Book.fromJson({..._bookJson(), 'genres': null});
      final empty = Book.fromJson({..._bookJson(), 'genres': <String>[]});

      expect(absent.genres, isNull);
      expect(explicitNull.genres, isNull);
      expect(empty.genres, isEmpty);
      expect(absent, explicitNull);
      expect(empty, isNot(absent));
      expect(empty.toJson()['genres'], isEmpty);
      expect(
        Book(
          title: 'A fantasy novel',
          isbn: '1092297370',
          isbn13: '9781092297370',
        ).genres,
        isNull,
      );
    });

    test(
      'copies, clears, and compares genres without changing the original',
      () {
        final book = Book.fromJson({
          ..._bookJson(),
          'genres': ['Fantasy', 'Children'],
        });
        final same = book.copyWith(genres: ['Fantasy', 'Children']);
        final reordered = book.copyWith(genres: ['Children', 'Fantasy']);
        final cleared = book.copyWith(genres: null);

        expect(same, book);
        expect(same.hashCode, book.hashCode);
        expect(reordered, isNot(book));
        expect(reordered.genres, ['Children', 'Fantasy']);
        expect(cleared.genres, isNull);
        expect(cleared, isNot(book));
        expect(book.genres, ['Fantasy', 'Children']);
      },
    );
  });

  group('Genres in API responses', () {
    test('exposes genres on a book detail response', () async {
      final client = _client({
        'book': {
          ..._bookJson(),
          'genres': ['Fantasy', 'Young adult'],
        },
      });

      final book = await client.getBook('9781092297370');

      expect(book!.genres, ['Fantasy', 'Young adult']);
    });

    final collectionRequests =
        <String, Future<BookQueryResult> Function(ISBNdb)>{
          'text search': (client) => client.getBooks('fantasy'),
          'field search': (client) => client.searchBooks(text: 'fantasy'),
          'ISBN batch': (client) => client.getBooksFromISBNs(['9781092297370']),
        };
    for (final entry in collectionRequests.entries) {
      test('exposes genres in ${entry.key} results', () async {
        final client = _client({
          'total': 2,
          'books': [
            {
              ..._bookJson(),
              'genres': ['Fantasy', 'Children'],
            },
            _bookJson(),
          ],
        });

        final result = await entry.value(client);

        expect(result.books.first.genres, ['Fantasy', 'Children']);
        expect(result.books.last.genres, isNull);
      });
    }
  });
}

Map<String, dynamic> _bookJson() => {
  'title': 'A fantasy novel',
  'isbn': '1092297370',
  'isbn13': '9781092297370',
};

ISBNdb _client(Map<String, dynamic> response) {
  final dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.resolve(
            Response<List<int>>(
              requestOptions: options,
              statusCode: 200,
              data: utf8.encode(jsonEncode(response)),
            ),
          );
        },
      ),
    );
  return ISBNdb('test-api-key', dio: dio);
}

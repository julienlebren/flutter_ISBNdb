@Tags(['live'])
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';

void main() {
  const isbn13 = "9781092297370";
  final apiKey = Platform.environment['ISBNDB_API_KEY'];
  final skipReason = apiKey == null ? "Missing ISBNDB_API_KEY" : false;

  group("ISBNdb live", () {
    test("getBook returns a valid book for a known ISBN", () async {
      final isbndb = ISBNdb(apiKey!);
      final book = await isbndb.getBook(isbn13);
      expect(book, isNotNull);
      expect(book!.isbn13, isbn13);
      expect(book.title, isNotEmpty);
    }, skip: skipReason);

    test("getAuthors returns non-empty results for a common query", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getAuthors("werber");
      expect(result.total, greaterThan(0));
      expect(result.authors, isNotEmpty);
    }, skip: skipReason);

    test("getBooks supports pagination and column filter", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getBooks(
        "flutter",
        page: 1,
        pageSize: 5,
        column: BookColumn.title,
      );
      expect(result.total, greaterThan(0));
      expect(result.books, isNotEmpty);
      expect(result.books.length, lessThanOrEqualTo(5));
    }, skip: skipReason);

    test("getSubjects returns non-empty results for a common query", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getSubjects("flutter", page: 1, pageSize: 5);
      expect(result.total, greaterThan(0));
      expect(result.subjects, isNotEmpty);
    }, skip: skipReason);
  });
}

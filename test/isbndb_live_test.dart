@Tags(['live'])
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';

void main() {
  const isbn13 = "9781092297370";
  const batchIsbns = <String>["9781092297370", "9781680506952"];
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

    test("getBooks accepts advanced filters from API spec", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getBooks(
        "flutter",
        page: 1,
        pageSize: 3,
        language: "en",
        shouldMatchAll: true,
        column: BookColumn.title,
        offset: 0,
      );

      expect(result.total, greaterThanOrEqualTo(0));
      expect(result.books.length, lessThanOrEqualTo(3));
      for (final book in result.books) {
        expect(book.title, isNotEmpty);
        expect(book.isbn13, isNotEmpty);
      }
    }, skip: skipReason);

    test("getSubjects returns non-empty results for a common query", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getSubjects("flutter", page: 1, pageSize: 5);
      expect(result.total, greaterThan(0));
      expect(result.subjects, isNotEmpty);
    }, skip: skipReason);

    test("getBooksFromISBNs returns expected books for known ISBNs", () async {
      final isbndb = ISBNdb(apiKey!);
      final result = await isbndb.getBooksFromISBNs(batchIsbns);

      expect(result.total, greaterThanOrEqualTo(batchIsbns.length));
      expect(result.books, isNotEmpty);

      final returnedIsbns = result.books.map((book) => book.isbn13).toSet();
      expect(returnedIsbns, containsAll(batchIsbns));

      for (final book in result.books) {
        expect(book.isbn13, isNotEmpty);
        expect(book.title, isNotEmpty);
      }
    }, skip: skipReason);

    test("getKeyDetails returns plan usage information", () async {
      final isbndb = ISBNdb(apiKey!);
      final keyDetails = await isbndb.getKeyDetails();

      expect(keyDetails.apiHost, isNotEmpty);
      expect(keyDetails.planLimit.total, greaterThanOrEqualTo(0));
      expect(keyDetails.planLimit.spent, greaterThanOrEqualTo(0));
      expect(keyDetails.planLimit.left, greaterThanOrEqualTo(0));
    }, skip: skipReason);

    test("getStats returns non-negative dataset counters", () async {
      final isbndb = ISBNdb(apiKey!);
      final stats = await isbndb.getStats();

      expect(stats.books, greaterThanOrEqualTo(0));
      expect(stats.authors, greaterThanOrEqualTo(0));
      expect(stats.publishers, greaterThanOrEqualTo(0));
      expect(stats.subjects, greaterThanOrEqualTo(0));
    }, skip: skipReason);
  });
}

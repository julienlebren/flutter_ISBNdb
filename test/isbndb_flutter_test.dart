import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb_flutter/isbndb_flutter.dart';
import 'package:isbndb_flutter/models/author.dart';
import 'package:isbndb_flutter/models/author_query_results.dart';
import 'package:isbndb_flutter/models/book.dart';
import 'package:isbndb_flutter/models/book_query_results.dart';
import 'package:isbndb_flutter/models/publisher.dart';
import 'package:isbndb_flutter/models/publisher_query_results.dart';
import 'package:isbndb_flutter/models/subject.dart';
import 'package:isbndb_flutter/models/subject_query_results.dart';

void main() {
  group("ISBNdb", () {
    final isbndb = ISBNdb("put_your_key_here");

    test('Should get books from Michel Bussi', () async {
      expect(
        await isbndb.getAuthor("Bussi Michel"),
        isInstanceOf<Author>(),
      );
    });
    test('Should get authors matching name werber', () async {
      expect(
        await isbndb.getAuthors("werber"),
        isInstanceOf<AuthorQueryResult>(),
      );
    });
    test('Should get "Learn Google Flutter Fast"', () async {
      expect(
        await isbndb.getBook("9781092297370"),
        isInstanceOf<Book>(),
      );
    });
    test('Should get books about Flutter', () async {
      expect(
        await isbndb.getBooks("Google Flutter"),
        isInstanceOf<BookQueryResult>(),
      );
    });
    test('Should get books from ISBNs', () async {
      expect(
        await isbndb.getBooksFromISBNs(["9781092297370", "9781680506952"]),
        isInstanceOf<BookQueryResult>(),
      );
    });
    test('Should get list of publishers matching "Nathan"', () async {
      expect(
        await isbndb.getPublishers("Nathan"),
        isInstanceOf<PublisherQueryResult>(),
      );
    });
    test('Should get books from publisher Nathan', () async {
      expect(
        await isbndb.getPublisher("Nathan"),
        isInstanceOf<Publisher>(),
      );
    });
    test('Should get list of subjects matching "flutter"', () async {
      expect(
        await isbndb.getSubjects("flutter"),
        isInstanceOf<SubjectQueryResult>(),
      );
    });
    test('Should get books matching subject "flutter"', () async {
      expect(
        await isbndb.getSubject("flutter"),
        isInstanceOf<Subject>(),
      );
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:isbndb/isbndb.dart';
import 'package:isbndb/models/author.dart';
import 'package:isbndb/models/author_query_results.dart';
import 'package:isbndb/models/book.dart';
import 'package:isbndb/models/book_query_results.dart';
import 'package:isbndb/models/publisher.dart';
import 'package:isbndb/models/publisher_query_results.dart';
import 'package:isbndb/models/subject.dart';
import 'package:isbndb/models/subject_query_results.dart';

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

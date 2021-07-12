library isbndb_flutter;

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:isbndb/enums/book_column.dart';
import 'package:isbndb/models/author_query_results.dart';
import 'package:isbndb/models/book_query_results.dart';
import 'package:isbndb/models/publisher_query_results.dart';
import 'package:isbndb/models/subject.dart';
import 'package:isbndb/models/publisher.dart';
import 'package:isbndb/models/book.dart';
import 'package:isbndb/models/author.dart';
import 'package:isbndb/models/subject_query_results.dart';

class ISBNdb {
  ISBNdb(this._key);

  final String _key;
  static const String baseApiUrl = "https://api2.isbndb.com";
  static const String errorMessage = "Unable to get response from API server";

  final _dio = Dio();

  Future<dynamic> _get(
    String path, {
    Map<String, Object?>? queryParameters,
  }) async {
    final result = await _dio.get<Map<String, Object?>>(
      "$baseApiUrl/$path",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: _key,
        },
      ),
      cancelToken: CancelToken(),
      queryParameters: queryParameters,
    );
    if (result.statusCode == 200) {
      return Map<String, Object>.from(result.data!);
    } else {
      throw errorMessage;
    }
  }

  Future<dynamic> _post(
    String path, {
    Map<String, Object?>? queryParameters,
  }) async {
    final result = await _dio.get<Map<String, Object?>>(
      "$baseApiUrl/$path",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: _key,
        },
      ),
      cancelToken: CancelToken(),
      queryParameters: queryParameters,
    );
    if (result.statusCode == 200) {
      return Map<String, Object>.from(result.data!);
    } else {
      throw errorMessage;
    }
  }

  Future<Book?> getBook(
    String isbn, {
    bool withPrices = false,
  }) async {
    final response = await _get(
      "book/$isbn",
      queryParameters: <String, Object?>{
        "with_prices": withPrices ? 1 : 0,
      },
    );
    final bookJson = response['book'];

    if (bookJson != null) {
      return Book.fromJson(bookJson);
    }
  }

  Future<BookQueryResult> getBooks(
    String query, {
    int page = 1,
    int pageSize = 20,
    BookColumn? column,
  }) async {
    final response = await _get(
      "books/$query",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
        "column": column?.toString(),
      },
    );
    return BookQueryResult.fromJson(response);
  }

  Future<BookQueryResult> getBooksFromISBNs(List<String> isbns) async {
    final response = await _post(
      "books",
      queryParameters: <String, Object?>{
        "isbns": isbns,
      },
    );
    return BookQueryResult(
      total: response['total'],
      books: response['books'].map(
        (json) => Book.fromJson(json),
      ),
    );
  }

  Future<Author?> getAuthor(
    String name, {
    int page = 1,
    int pageSize = 20,
    BookColumn? column,
  }) async {
    final response = await _get(
      "author/$name",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
      },
    );
    return Author.fromJson(response);
  }

  Future<AuthorQueryResult> getAuthors(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _get(
      "authors/$query",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
      },
    );
    return AuthorQueryResult.fromJson(response);
  }

  Future<Publisher?> getPublisher(
    String name, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _get(
      "publisher/$name",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
      },
    );
    return Publisher.fromJson(response);
  }

  Future<PublisherQueryResult> getPublishers(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _get(
      "publishers/$query",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
      },
    );
    return PublisherQueryResult.fromJson(response);
  }

  Future<Subject?> getSubject(String name) async {
    final response = await _get("subject/$name");
    return Subject.fromJson(response);
  }

  Future<SubjectQueryResult> getSubjects(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _get(
      "subjects/$query",
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
      },
    );
    return SubjectQueryResult.fromJson(response);
  }
}

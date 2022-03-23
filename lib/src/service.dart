part of isbndb_flutter;

/// The main object for using the ISBNdb API
/// You need to init the class with your own key
/// See https://isbndb.com/isbn-database
class ISBNdb {
  ISBNdb(this._key);

  /// Your key from isbndb.com
  final String _key;

  static const String _baseApiUrl = "https://api2.isbndb.com";
  static const String _errorMessage = "Unable to get response from API server";
  final _dio = Dio();

  /// Handles get requests
  Future<dynamic> _get(
    String path, {
    Map<String, Object?>? queryParameters,
  }) async {
    final result = await _dio.get<List<int>>(
      "$_baseApiUrl/$path",
      options: Options(
        responseType: ResponseType.bytes,
        headers: {
          HttpHeaders.authorizationHeader: _key,
        },
      ),
      cancelToken: CancelToken(),
      queryParameters: queryParameters,
    );
    if (result.statusCode == 200) {
      return Map<String, Object>.from(jsonDecode(utf8.decode(result.data!)));
    } else {
      throw _errorMessage;
    }
  }

  /// Handles post requests
  Future<dynamic> _post(
    String path, {
    Map<String, Object?>? queryParameters,
  }) async {
    final result = await _dio.post<List<int>>(
      "$_baseApiUrl/$path",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: _key,
        },
      ),
      cancelToken: CancelToken(),
      queryParameters: queryParameters,
    );
    if (result.statusCode == 200) {
      return Map<String, Object>.from(jsonDecode(utf8.decode(result.data!)));
    } else {
      throw _errorMessage;
    }
  }

  /// Get book details from an ISBN
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

  /// Search books in ISBNdb
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

  /// Get book details from a list of ISBNs
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

  /// Get author details
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

  /// Search authors in the ISBNdb
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

  /// Get the list of books from a publisher
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

  /// Search publishers in the ISBNdb
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

  /// Get a list of book about a given subject
  Future<Subject?> getSubject(String name) async {
    final response = await _get("subject/$name");
    return Subject.fromJson(response);
  }

  /// Search subjects in the ISBNdb
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

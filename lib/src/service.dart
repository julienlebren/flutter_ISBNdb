part of isbndb_flutter;

/// The main object for using the ISBNdb API
/// You need to init the class with your own key
/// See https://isbndb.com/isbn-database
class ISBNdb {
  ISBNdb(this._key, {Dio? dio}) : _dio = dio ?? Dio();

  /// Your key from isbndb.com
  final String _key;

  static const String _baseApiUrl = "https://api2.isbndb.com";
  static const String _defaultErrorMessage =
      "Unable to get response from API server";
  final Dio _dio;

  /// Handles get requests
  Future<Map<String, dynamic>> _get(
    String path, {
    Map<String, Object?>? queryParameters,
  }) => _request(method: "GET", path: path, queryParameters: queryParameters);

  /// Handles post requests
  Future<Map<String, dynamic>> _post(
    String path, {
    Map<String, Object?>? queryParameters,
  }) => _request(method: "POST", path: path, queryParameters: queryParameters);

  Future<Map<String, dynamic>> _request({
    required String method,
    required String path,
    Map<String, Object?>? queryParameters,
  }) async {
    final options = Options(
      responseType: ResponseType.bytes,
      headers: {'authorization': _key},
    );
    final requestUrl = "$_baseApiUrl/$path";

    try {
      final result = method == "GET"
          ? await _dio.get<List<int>>(
              requestUrl,
              options: options,
              cancelToken: CancelToken(),
              queryParameters: queryParameters,
            )
          : await _dio.post<List<int>>(
              requestUrl,
              options: options,
              cancelToken: CancelToken(),
              queryParameters: queryParameters,
            );

      final bytes = result.data;
      if (result.statusCode != 200 || bytes == null) {
        throw ISBNdbException(
          message: _defaultErrorMessage,
          method: method,
          path: path,
          statusCode: result.statusCode,
        );
      }

      final decodedJson = jsonDecode(utf8.decode(bytes));
      if (decodedJson is! Map<String, dynamic>) {
        throw const FormatException("Response payload is not a JSON object.");
      }

      return Map<String, dynamic>.from(decodedJson);
    } on ISBNdbException {
      rethrow;
    } on DioException catch (error) {
      throw ISBNdbException(
        message: _extractApiErrorMessage(error) ?? _defaultErrorMessage,
        method: method,
        path: path,
        statusCode: error.response?.statusCode,
        cause: error,
      );
    } on FormatException catch (error) {
      throw ISBNdbException(
        message: "Received an invalid response format from API server",
        method: method,
        path: path,
        cause: error,
      );
    } on Object catch (error) {
      throw ISBNdbException(
        message: _defaultErrorMessage,
        method: method,
        path: path,
        cause: error,
      );
    }
  }

  String? _extractApiErrorMessage(DioException error) {
    final responseData = error.response?.data;

    if (responseData is List<int>) {
      final rawText = utf8.decode(responseData, allowMalformed: true).trim();
      if (rawText.isEmpty) {
        return null;
      }

      try {
        final decodedJson = jsonDecode(rawText);
        if (decodedJson is Map<String, dynamic>) {
          final message = decodedJson['message'] ?? decodedJson['error'];
          if (message is String && message.trim().isNotEmpty) {
            return message.trim();
          }
        }
      } on FormatException {
        // Non-JSON payload, fallback to raw text below.
      }

      return rawText;
    }

    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'] ?? responseData['error'];
      if (message is String && message.trim().isNotEmpty) {
        return message.trim();
      }
    }

    if (responseData is String && responseData.trim().isNotEmpty) {
      return responseData.trim();
    }

    if (error.message != null && error.message!.trim().isNotEmpty) {
      return error.message!.trim();
    }

    return null;
  }

  T _parseModel<T>({
    required String method,
    required String path,
    required T Function() parser,
  }) {
    try {
      return parser();
    } on ISBNdbException {
      rethrow;
    } on Object catch (error) {
      throw ISBNdbException(
        message: "Received an unexpected data format from API server",
        method: method,
        path: path,
        cause: error,
      );
    }
  }

  /// Get book details from an ISBN
  Future<Book?> getBook(String isbn, {bool withPrices = false}) async {
    final path = "book/$isbn";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"with_prices": withPrices ? 1 : 0},
    );
    final bookJson = response['book'];
    if (bookJson == null) {
      return null;
    }
    if (bookJson is! Map<String, dynamic>) {
      throw ISBNdbException(
        message: "Received an unexpected data format from API server",
        method: "GET",
        path: path,
      );
    }
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => Book.fromJson(bookJson),
    );
  }

  /// Search books in ISBNdb
  Future<BookQueryResult> getBooks(
    String query, {
    int page = 1,
    int pageSize = 20,
    BookColumn? column,
  }) async {
    final path = "books/$query";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{
        "page": page,
        "pageSize": pageSize,
        "column": column?.name,
      },
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => BookQueryResult.fromJson(response),
    );
  }

  /// Get book details from a list of ISBNs
  Future<BookQueryResult> getBooksFromISBNs(List<String> isbns) async {
    const path = "books";
    final response = await _post(
      path,
      queryParameters: <String, Object?>{"isbns": isbns},
    );
    return _parseModel(
      method: "POST",
      path: path,
      parser: () => BookQueryResult.fromJson(response),
    );
  }

  /// Get author details
  Future<Author?> getAuthor(
    String name, {
    int page = 1,
    int pageSize = 20,
    BookColumn? column,
  }) async {
    final path = "author/$name";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"page": page, "pageSize": pageSize},
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => Author.fromJson(response),
    );
  }

  /// Search authors in the ISBNdb
  Future<AuthorQueryResult> getAuthors(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final path = "authors/$query";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"page": page, "pageSize": pageSize},
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => AuthorQueryResult.fromJson(response),
    );
  }

  /// Get the list of books from a publisher
  Future<Publisher?> getPublisher(
    String name, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final path = "publisher/$name";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"page": page, "pageSize": pageSize},
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => Publisher.fromJson(response),
    );
  }

  /// Search publishers in the ISBNdb
  Future<PublisherQueryResult> getPublishers(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final path = "publishers/$query";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"page": page, "pageSize": pageSize},
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => PublisherQueryResult.fromJson(response),
    );
  }

  /// Get a list of book about a given subject
  Future<Subject?> getSubject(String name) async {
    final path = "subject/$name";
    final response = await _get(path);
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => Subject.fromJson(response),
    );
  }

  /// Search subjects in the ISBNdb
  Future<SubjectQueryResult> getSubjects(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final path = "subjects/$query";
    final response = await _get(
      path,
      queryParameters: <String, Object?>{"page": page, "pageSize": pageSize},
    );
    return _parseModel(
      method: "GET",
      path: path,
      parser: () => SubjectQueryResult.fromJson(response),
    );
  }
}

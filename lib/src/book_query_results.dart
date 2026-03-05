part of isbndb_flutter;

/// The object which contains the results of search in the books database
@freezed
sealed class BookQueryResult with _$BookQueryResult {
  factory BookQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the books matching the query
    @JsonKey(readValue: _readBooks) @Default([]) List<Book> books,
  }) = _BookQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$BookQueryResultFromJson(json);

  static Object? _readBooks(Map<dynamic, dynamic> json, String key) {
    return json[key] ?? json['data'];
  }
}

extension BookQueryResultResultX on BookQueryResult {
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => books.length == 0;
}

part of isbndb_flutter;

/// The object which contains the results of search in the authors database
@freezed
sealed class AuthorQueryResult with _$AuthorQueryResult {
  factory AuthorQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the authors matching the query
    @JsonKey(readValue: _readAuthorNames) @Default([]) List<String> authors,
  }) = _AuthorQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$AuthorQueryResultFromJson(json);
}

Object? _readAuthorNames(Map<dynamic, dynamic> json, String key) {
  final authors = json[key];
  if (authors is Map) {
    return authors.values.toList();
  }
  return authors;
}

extension AuthorQueryResultX on AuthorQueryResult {
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => authors.length == 0;
}

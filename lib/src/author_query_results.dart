part of isbndb_flutter;

/// The object which contains the results of search in the authors database
@freezed
class AuthorQueryResult with _$AuthorQueryResult {
  factory AuthorQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the authors matching the query
    @Default([]) List<String> authors,
  }) = _AuthorQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$AuthorQueryResultFromJson(json);

  /// Boolean which indicates if the search has results or not
  bool get isEmpty => authors.length == 0;
}

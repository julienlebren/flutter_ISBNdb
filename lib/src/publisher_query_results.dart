part of isbndb_flutter;

/// The object which contains the results of search in the publishers database
@freezed
class PublisherQueryResult with _$PublisherQueryResult {
  factory PublisherQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the publishers matching the query
    @Default([]) List<String> publishers,
  }) = _PublisherQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$PublisherQueryResultFromJson(json);
}

extension PublisherQueryResultX on PublisherQueryResult {
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => publishers.length == 0;
}

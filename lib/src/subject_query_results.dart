part of isbndb_flutter;

/// The object which contains the results of search in the subjects database
@freezed
sealed class SubjectQueryResult with _$SubjectQueryResult {
  factory SubjectQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the subjects matching the query
    @JsonKey(readValue: _readSubjectNames) @Default([]) List<String> subjects,
  }) = _SubjectQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$SubjectQueryResultFromJson(json);
}

Object? _readSubjectNames(Map<dynamic, dynamic> json, String key) {
  final subjects = json[key];
  if (subjects is Map) {
    return subjects.values.toList();
  }
  return subjects;
}

extension SubjectQueryResultX on SubjectQueryResult {
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => subjects.length == 0;
}

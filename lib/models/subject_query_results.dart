import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_query_results.freezed.dart';
part 'subject_query_results.g.dart';

/// The object which contains the results of search in the subjects database
@freezed
class SubjectQueryResult with _$SubjectQueryResult {
  factory SubjectQueryResult({
    /// The number of results for this query
    required int total,

    /// The list of the subjects matching the query
    @Default([]) List<String> subjects,
  }) = _SubjectQueryResult;

  /// Used to build the object from the response of the ISBNdb API
  factory SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$SubjectQueryResultFromJson(json);
}

extension SubjectQueryResultX on SubjectQueryResult {
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => subjects.length == 0;
}

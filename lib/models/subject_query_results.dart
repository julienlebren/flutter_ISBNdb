import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_query_results.freezed.dart';
part 'subject_query_results.g.dart';

@freezed
class SubjectQueryResult with _$SubjectQueryResult {
  factory SubjectQueryResult({
    required int total,
    @Default([]) List<String> subjects,
  }) = _SubjectQueryResult;

  factory SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$SubjectQueryResultFromJson(json);
}

extension SubjectQueryResultX on SubjectQueryResult {
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return subjects.length > 0;
  }
}

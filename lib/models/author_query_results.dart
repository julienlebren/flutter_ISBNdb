import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_query_results.freezed.dart';
part 'author_query_results.g.dart';

@freezed
class AuthorQueryResult with _$AuthorQueryResult {
  factory AuthorQueryResult({
    required int total,
    @Default([]) List<String> authors,
  }) = _AuthorQueryResult;

  factory AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$AuthorQueryResultFromJson(json);
}

extension AuthorQueryResultX on AuthorQueryResult {
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return authors.length > 0;
  }
}

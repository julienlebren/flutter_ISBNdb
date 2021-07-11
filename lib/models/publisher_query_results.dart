import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher_query_results.freezed.dart';
part 'publisher_query_results.g.dart';

@freezed
class PublisherQueryResult with _$PublisherQueryResult {
  factory PublisherQueryResult({
    required int total,
    @Default([]) List<String> publishers,
  }) = _PublisherQueryResult;

  factory PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$PublisherQueryResultFromJson(json);
}

extension PublisherQueryResultX on PublisherQueryResult {
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return publishers.length > 0;
  }
}

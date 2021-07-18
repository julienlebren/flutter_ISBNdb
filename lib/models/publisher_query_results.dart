import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher_query_results.freezed.dart';
part 'publisher_query_results.g.dart';

/// The object which contains the results of search in the publishers database
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
  /// Boolean which indicates if the search has results or not
  bool get isEmpty => publishers.length == 0;
}

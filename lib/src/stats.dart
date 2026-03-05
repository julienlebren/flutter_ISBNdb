part of isbndb_flutter;

/// Global API dataset statistics returned by `/stats`.
@freezed
sealed class Stats with _$Stats {
  factory Stats({
    required int books,
    required int authors,
    required int publishers,
    required int subjects,
  }) = _Stats;

  /// Used to build the object from the response of the ISBNdb API.
  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

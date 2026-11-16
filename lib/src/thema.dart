part of isbndb_flutter;

/// A Thema subject or qualifier type.
enum ThemaType {
  subject,
  place,
  language,
  time,
  education,
  interest,
  style,

  /// A type introduced by a newer API version.
  unknown,
}

/// A subject or qualifier attached to a book.
@freezed
sealed class ThemaEntry with _$ThemaEntry {
  factory ThemaEntry({
    required String code,
    required String name,
    @JsonKey(unknownEnumValue: ThemaType.unknown) required ThemaType type,

    /// Whether this is the book's main subject; qualifiers are never main.
    required bool main,
  }) = _ThemaEntry;

  factory ThemaEntry.fromJson(Map<String, dynamic> json) =>
      _$ThemaEntryFromJson(json);
}

/// A code in the Thema hierarchy, with its parent and child availability.
@freezed
sealed class ThemaNode with _$ThemaNode {
  factory ThemaNode({
    required String code,
    required String name,
    @JsonKey(unknownEnumValue: ThemaType.unknown) required ThemaType type,
    String? parent,
    @JsonKey(name: 'has_children') required bool hasChildren,
  }) = _ThemaNode;

  factory ThemaNode.fromJson(Map<String, dynamic> json) =>
      _$ThemaNodeFromJson(json);
}

/// A page of Thema codes returned by `/thema`.
@freezed
sealed class ThemaListResponse with _$ThemaListResponse {
  factory ThemaListResponse({
    required int total,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    @Default([]) List<ThemaNode> codes,
  }) = _ThemaListResponse;

  factory ThemaListResponse.fromJson(Map<String, dynamic> json) =>
      _$ThemaListResponseFromJson(json);
}

/// A Thema code, its ancestors from broadest to parent, and direct children.
@freezed
sealed class ThemaDetailsResponse with _$ThemaDetailsResponse {
  factory ThemaDetailsResponse({
    required String code,
    required String name,
    @JsonKey(unknownEnumValue: ThemaType.unknown) required ThemaType type,
    String? parent,
    @Default([]) List<ThemaNode> ancestors,
    @Default([]) List<ThemaNode> children,

    /// The requested retired code, when the API returned its replacement.
    @JsonKey(name: 'replaced_from') String? replacedFrom,
  }) = _ThemaDetailsResponse;

  factory ThemaDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ThemaDetailsResponseFromJson(json);
}

/// Books classified under a Thema code, with at most 1,000 matches.
@freezed
sealed class ThemaBooksResponse with _$ThemaBooksResponse {
  factory ThemaBooksResponse({
    required ThemaNode thema,
    @Default([]) List<Book> books,
    required int total,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _ThemaBooksResponse;

  factory ThemaBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$ThemaBooksResponseFromJson(json);
}

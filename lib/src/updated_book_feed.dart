part of isbndb_flutter;

/// A single book update entry returned by `/feeds/books/updates`.
@freezed
sealed class UpdatedBook with _$UpdatedBook {
  factory UpdatedBook({
    /// Updated book ISBN-13.
    required String isbn13,

    /// Timestamp when the book was last updated by ISBNdb.
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UpdatedBook;

  /// Used to build the object from the response of the ISBNdb API.
  factory UpdatedBook.fromJson(Map<String, dynamic> json) =>
      _$UpdatedBookFromJson(json);
}

/// Paginated feed of recently updated ISBNs returned by ISBNdb.
@freezed
sealed class UpdatedBookFeed with _$UpdatedBookFeed {
  factory UpdatedBookFeed({
    /// Updated ISBN entries.
    @JsonKey(name: 'data') @Default([]) List<UpdatedBook> updates,

    /// Total number of updates available for the query, when provided.
    int? total,

    /// Current page number.
    required int page,

    /// Requested page size.
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _UpdatedBookFeed;

  /// Used to build the object from the response of the ISBNdb API.
  factory UpdatedBookFeed.fromJson(Map<String, dynamic> json) =>
      _$UpdatedBookFeedFromJson(json);
}

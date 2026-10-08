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
@Freezed(when: FreezedWhenOptions.none)
sealed class UpdatedBookFeed with _$UpdatedBookFeed {
  const UpdatedBookFeed._();

  /// Destructure the feed using the original four-field callback.
  /// Access [next] directly for cursor pagination.
  TResult when<TResult extends Object?>(
    TResult Function(
      List<UpdatedBook> updates,
      int? total,
      int page,
      int pageSize,
    )
    callback,
  ) => callback(updates, total, page, pageSize);

  /// Invoke the original callback when supplied, otherwise use [orElse].
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<UpdatedBook> updates,
      int? total,
      int page,
      int pageSize,
    )?
    callback, {
    required TResult Function() orElse,
  }) => callback == null ? orElse() : callback(updates, total, page, pageSize);

  /// Invoke the original callback when supplied, otherwise return null.
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<UpdatedBook> updates,
      int? total,
      int page,
      int pageSize,
    )?
    callback,
  ) => callback?.call(updates, total, page, pageSize);

  factory UpdatedBookFeed({
    /// Updated ISBN entries.
    @JsonKey(name: 'data') @Default([]) List<UpdatedBook> updates,

    /// Total number of updates available for the query, when provided.
    int? total,

    /// Opaque cursor for the next page; null when no more updates remain.
    String? next,

    /// Current offset page number (deprecated by ISBNdb); 1 with a cursor.
    required int page,

    /// Requested page size.
    @JsonKey(name: 'page_size') required int pageSize,
  }) = _UpdatedBookFeed;

  /// Used to build the object from the response of the ISBNdb API.
  factory UpdatedBookFeed.fromJson(Map<String, dynamic> json) =>
      _$UpdatedBookFeedFromJson(json);
}

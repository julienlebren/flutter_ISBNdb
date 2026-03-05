part of isbndb_flutter;

/// An object which returns the name of an author and the list of the books he published.
@freezed
sealed class Author with _$Author {
  factory Author({
    /// The name of the author
    required String author,

    /// The list of the books this author published
    @JsonKey(readValue: _readBooks) @Default([]) List<Book> books,
  }) = _Author;

  /// Used to build the object from the response of the ISBNdb API
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  static Object? _readBooks(Map<dynamic, dynamic> json, String key) {
    final books = json[key];
    if (books is Map) {
      return books.values.toList();
    }
    return books;
  }
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isbndb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorQueryResult implements DiagnosticableTreeMixin {
  /// The number of results for this query
  int get total;

  /// The list of the authors matching the query
  List<String> get authors;

  /// Create a copy of AuthorQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorQueryResultCopyWith<AuthorQueryResult> get copyWith =>
      _$AuthorQueryResultCopyWithImpl<AuthorQueryResult>(
          this as AuthorQueryResult, _$identity);

  /// Serializes this AuthorQueryResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthorQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('authors', authors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.authors, authors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(authors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorQueryResult(total: $total, authors: $authors)';
  }
}

/// @nodoc
abstract mixin class $AuthorQueryResultCopyWith<$Res> {
  factory $AuthorQueryResultCopyWith(
          AuthorQueryResult value, $Res Function(AuthorQueryResult) _then) =
      _$AuthorQueryResultCopyWithImpl;
  @useResult
  $Res call({int total, List<String> authors});
}

/// @nodoc
class _$AuthorQueryResultCopyWithImpl<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  _$AuthorQueryResultCopyWithImpl(this._self, this._then);

  final AuthorQueryResult _self;
  final $Res Function(AuthorQueryResult) _then;

  /// Create a copy of AuthorQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? authors = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: null == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AuthorQueryResult
    with DiagnosticableTreeMixin
    implements AuthorQueryResult {
  _AuthorQueryResult(
      {required this.total, final List<String> authors = const []})
      : _authors = authors;
  factory _AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$AuthorQueryResultFromJson(json);

  /// The number of results for this query
  @override
  final int total;

  /// The list of the authors matching the query
  final List<String> _authors;

  /// The list of the authors matching the query
  @override
  @JsonKey()
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  /// Create a copy of AuthorQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith =>
      __$AuthorQueryResultCopyWithImpl<_AuthorQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorQueryResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthorQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('authors', authors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_authors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorQueryResult(total: $total, authors: $authors)';
  }
}

/// @nodoc
abstract mixin class _$AuthorQueryResultCopyWith<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  factory _$AuthorQueryResultCopyWith(
          _AuthorQueryResult value, $Res Function(_AuthorQueryResult) _then) =
      __$AuthorQueryResultCopyWithImpl;
  @override
  @useResult
  $Res call({int total, List<String> authors});
}

/// @nodoc
class __$AuthorQueryResultCopyWithImpl<$Res>
    implements _$AuthorQueryResultCopyWith<$Res> {
  __$AuthorQueryResultCopyWithImpl(this._self, this._then);

  final _AuthorQueryResult _self;
  final $Res Function(_AuthorQueryResult) _then;

  /// Create a copy of AuthorQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? authors = null,
  }) {
    return _then(_AuthorQueryResult(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: null == authors
          ? _self._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Author implements DiagnosticableTreeMixin {
  /// The name of the author
  String get author;

  /// The list of the books this author published
  List<Book> get books;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<Author> get copyWith =>
      _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Author'))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Author &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, author, const DeepCollectionEquality().hash(books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Author(author: $author, books: $books)';
  }
}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) =
      _$AuthorCopyWithImpl;
  @useResult
  $Res call({String author, List<Book> books});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? books = null,
  }) {
    return _then(_self.copyWith(
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Author with DiagnosticableTreeMixin implements Author {
  _Author({required this.author, final List<Book> books = const []})
      : _books = books;
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  /// The name of the author
  @override
  final String author;

  /// The list of the books this author published
  final List<Book> _books;

  /// The list of the books this author published
  @override
  @JsonKey()
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorCopyWith<_Author> get copyWith =>
      __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Author'))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Author &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, author, const DeepCollectionEquality().hash(_books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Author(author: $author, books: $books)';
  }
}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) =
      __$AuthorCopyWithImpl;
  @override
  @useResult
  $Res call({String author, List<Book> books});
}

/// @nodoc
class __$AuthorCopyWithImpl<$Res> implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? author = null,
    Object? books = null,
  }) {
    return _then(_Author(
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
mixin _$BookQueryResult implements DiagnosticableTreeMixin {
  /// The number of results for this query
  int get total;

  /// The list of the books matching the query
  List<Book> get books;

  /// Create a copy of BookQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookQueryResultCopyWith<BookQueryResult> get copyWith =>
      _$BookQueryResultCopyWithImpl<BookQueryResult>(
          this as BookQueryResult, _$identity);

  /// Serializes this BookQueryResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BookQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookQueryResult(total: $total, books: $books)';
  }
}

/// @nodoc
abstract mixin class $BookQueryResultCopyWith<$Res> {
  factory $BookQueryResultCopyWith(
          BookQueryResult value, $Res Function(BookQueryResult) _then) =
      _$BookQueryResultCopyWithImpl;
  @useResult
  $Res call({int total, List<Book> books});
}

/// @nodoc
class _$BookQueryResultCopyWithImpl<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  _$BookQueryResultCopyWithImpl(this._self, this._then);

  final BookQueryResult _self;
  final $Res Function(BookQueryResult) _then;

  /// Create a copy of BookQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? books = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: null == books
          ? _self.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookQueryResult with DiagnosticableTreeMixin implements BookQueryResult {
  _BookQueryResult({required this.total, final List<Book> books = const []})
      : _books = books;
  factory _BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$BookQueryResultFromJson(json);

  /// The number of results for this query
  @override
  final int total;

  /// The list of the books matching the query
  final List<Book> _books;

  /// The list of the books matching the query
  @override
  @JsonKey()
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  /// Create a copy of BookQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookQueryResultCopyWith<_BookQueryResult> get copyWith =>
      __$BookQueryResultCopyWithImpl<_BookQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookQueryResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BookQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookQueryResult(total: $total, books: $books)';
  }
}

/// @nodoc
abstract mixin class _$BookQueryResultCopyWith<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  factory _$BookQueryResultCopyWith(
          _BookQueryResult value, $Res Function(_BookQueryResult) _then) =
      __$BookQueryResultCopyWithImpl;
  @override
  @useResult
  $Res call({int total, List<Book> books});
}

/// @nodoc
class __$BookQueryResultCopyWithImpl<$Res>
    implements _$BookQueryResultCopyWith<$Res> {
  __$BookQueryResultCopyWithImpl(this._self, this._then);

  final _BookQueryResult _self;
  final $Res Function(_BookQueryResult) _then;

  /// Create a copy of BookQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? books = null,
  }) {
    return _then(_BookQueryResult(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: null == books
          ? _self._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
mixin _$Book implements DiagnosticableTreeMixin {
  /// Title of the book
  String get title;

  /// Long version of the title
  @JsonKey(name: 'title_long')
  String? get titleLong;

  /// ISBN of the book
  String get isbn;

  /// New 13-digit ISBN
  String get isbn13;

  /// Not documented in the official API
  @JsonKey(name: 'dewey_decimal')
  String? get deweyDecimal;

  /// Not documented in the official API
  String? get binding;

  /// The name of the publisher
  String? get publisher;

  /// Language of the book
  String? get language;

  /// Date when the book was published. Can be a year or a full date.
  @_DateConverter()
  @JsonKey(name: 'date_published')
  DateTime? get datePublished;

  /// Details about the edition
  String? get edition;

  /// Number of pages of the book
  int? get pages;

  /// Dimensions of the book
  String? get dimensions;

  /// Not documented in the official API
  String? get overview;

  /// URL of the cover
  String? get image;

  /// Not documented in the official API
  @_MsrpConverter()
  double? get msrp;

  /// Excerpt of the book
  String? get excerpt;

  /// Synopsys of the book
  String? get synopsys;

  /// List of the authors of the book
  List<String?>? get authors;

  /// List of the subjects of the book
  List<String>? get subjects;

  /// Not documented in the official API
  List<String>? get reviews;

  /// List of the merchants selling this book with real-time prices
  List<Merchant>? get prices;

  /// Not documented in the official API
  List<String>? get related;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookCopyWith<Book> get copyWith =>
      _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleLong', titleLong))
      ..add(DiagnosticsProperty('isbn', isbn))
      ..add(DiagnosticsProperty('isbn13', isbn13))
      ..add(DiagnosticsProperty('deweyDecimal', deweyDecimal))
      ..add(DiagnosticsProperty('binding', binding))
      ..add(DiagnosticsProperty('publisher', publisher))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('datePublished', datePublished))
      ..add(DiagnosticsProperty('edition', edition))
      ..add(DiagnosticsProperty('pages', pages))
      ..add(DiagnosticsProperty('dimensions', dimensions))
      ..add(DiagnosticsProperty('overview', overview))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('msrp', msrp))
      ..add(DiagnosticsProperty('excerpt', excerpt))
      ..add(DiagnosticsProperty('synopsys', synopsys))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('subjects', subjects))
      ..add(DiagnosticsProperty('reviews', reviews))
      ..add(DiagnosticsProperty('prices', prices))
      ..add(DiagnosticsProperty('related', related));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Book &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleLong, titleLong) ||
                other.titleLong == titleLong) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.isbn13, isbn13) || other.isbn13 == isbn13) &&
            (identical(other.deweyDecimal, deweyDecimal) ||
                other.deweyDecimal == deweyDecimal) &&
            (identical(other.binding, binding) || other.binding == binding) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.msrp, msrp) || other.msrp == msrp) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.synopsys, synopsys) ||
                other.synopsys == synopsys) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.subjects, subjects) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            const DeepCollectionEquality().equals(other.prices, prices) &&
            const DeepCollectionEquality().equals(other.related, related));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        title,
        titleLong,
        isbn,
        isbn13,
        deweyDecimal,
        binding,
        publisher,
        language,
        datePublished,
        edition,
        pages,
        dimensions,
        overview,
        image,
        msrp,
        excerpt,
        synopsys,
        const DeepCollectionEquality().hash(authors),
        const DeepCollectionEquality().hash(subjects),
        const DeepCollectionEquality().hash(reviews),
        const DeepCollectionEquality().hash(prices),
        const DeepCollectionEquality().hash(related)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related)';
  }
}

/// @nodoc
abstract mixin class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) =
      _$BookCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'title_long') String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @_DateConverter()
      @JsonKey(name: 'date_published')
      DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @_MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String?>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? titleLong = freezed,
    Object? isbn = null,
    Object? isbn13 = null,
    Object? deweyDecimal = freezed,
    Object? binding = freezed,
    Object? publisher = freezed,
    Object? language = freezed,
    Object? datePublished = freezed,
    Object? edition = freezed,
    Object? pages = freezed,
    Object? dimensions = freezed,
    Object? overview = freezed,
    Object? image = freezed,
    Object? msrp = freezed,
    Object? excerpt = freezed,
    Object? synopsys = freezed,
    Object? authors = freezed,
    Object? subjects = freezed,
    Object? reviews = freezed,
    Object? prices = freezed,
    Object? related = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: freezed == titleLong
          ? _self.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: null == isbn
          ? _self.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: null == isbn13
          ? _self.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: freezed == deweyDecimal
          ? _self.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: freezed == binding
          ? _self.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _self.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: freezed == edition
          ? _self.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: freezed == dimensions
          ? _self.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: freezed == msrp
          ? _self.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: freezed == excerpt
          ? _self.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: freezed == synopsys
          ? _self.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: freezed == subjects
          ? _self.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: freezed == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: freezed == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: freezed == related
          ? _self.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Book with DiagnosticableTreeMixin implements Book {
  _Book(
      {required this.title,
      @JsonKey(name: 'title_long') this.titleLong,
      required this.isbn,
      required this.isbn13,
      @JsonKey(name: 'dewey_decimal') this.deweyDecimal,
      this.binding,
      this.publisher,
      this.language,
      @_DateConverter() @JsonKey(name: 'date_published') this.datePublished,
      this.edition,
      this.pages,
      this.dimensions,
      this.overview,
      this.image,
      @_MsrpConverter() this.msrp,
      this.excerpt,
      this.synopsys,
      final List<String?>? authors,
      final List<String>? subjects,
      final List<String>? reviews,
      final List<Merchant>? prices,
      final List<String>? related})
      : _authors = authors,
        _subjects = subjects,
        _reviews = reviews,
        _prices = prices,
        _related = related;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  /// Title of the book
  @override
  final String title;

  /// Long version of the title
  @override
  @JsonKey(name: 'title_long')
  final String? titleLong;

  /// ISBN of the book
  @override
  final String isbn;

  /// New 13-digit ISBN
  @override
  final String isbn13;

  /// Not documented in the official API
  @override
  @JsonKey(name: 'dewey_decimal')
  final String? deweyDecimal;

  /// Not documented in the official API
  @override
  final String? binding;

  /// The name of the publisher
  @override
  final String? publisher;

  /// Language of the book
  @override
  final String? language;

  /// Date when the book was published. Can be a year or a full date.
  @override
  @_DateConverter()
  @JsonKey(name: 'date_published')
  final DateTime? datePublished;

  /// Details about the edition
  @override
  final String? edition;

  /// Number of pages of the book
  @override
  final int? pages;

  /// Dimensions of the book
  @override
  final String? dimensions;

  /// Not documented in the official API
  @override
  final String? overview;

  /// URL of the cover
  @override
  final String? image;

  /// Not documented in the official API
  @override
  @_MsrpConverter()
  final double? msrp;

  /// Excerpt of the book
  @override
  final String? excerpt;

  /// Synopsys of the book
  @override
  final String? synopsys;

  /// List of the authors of the book
  final List<String?>? _authors;

  /// List of the authors of the book
  @override
  List<String?>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of the subjects of the book
  final List<String>? _subjects;

  /// List of the subjects of the book
  @override
  List<String>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Not documented in the official API
  final List<String>? _reviews;

  /// Not documented in the official API
  @override
  List<String>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of the merchants selling this book with real-time prices
  final List<Merchant>? _prices;

  /// List of the merchants selling this book with real-time prices
  @override
  List<Merchant>? get prices {
    final value = _prices;
    if (value == null) return null;
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Not documented in the official API
  final List<String>? _related;

  /// Not documented in the official API
  @override
  List<String>? get related {
    final value = _related;
    if (value == null) return null;
    if (_related is EqualUnmodifiableListView) return _related;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleLong', titleLong))
      ..add(DiagnosticsProperty('isbn', isbn))
      ..add(DiagnosticsProperty('isbn13', isbn13))
      ..add(DiagnosticsProperty('deweyDecimal', deweyDecimal))
      ..add(DiagnosticsProperty('binding', binding))
      ..add(DiagnosticsProperty('publisher', publisher))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('datePublished', datePublished))
      ..add(DiagnosticsProperty('edition', edition))
      ..add(DiagnosticsProperty('pages', pages))
      ..add(DiagnosticsProperty('dimensions', dimensions))
      ..add(DiagnosticsProperty('overview', overview))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('msrp', msrp))
      ..add(DiagnosticsProperty('excerpt', excerpt))
      ..add(DiagnosticsProperty('synopsys', synopsys))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('subjects', subjects))
      ..add(DiagnosticsProperty('reviews', reviews))
      ..add(DiagnosticsProperty('prices', prices))
      ..add(DiagnosticsProperty('related', related));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleLong, titleLong) ||
                other.titleLong == titleLong) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.isbn13, isbn13) || other.isbn13 == isbn13) &&
            (identical(other.deweyDecimal, deweyDecimal) ||
                other.deweyDecimal == deweyDecimal) &&
            (identical(other.binding, binding) || other.binding == binding) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.msrp, msrp) || other.msrp == msrp) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.synopsys, synopsys) ||
                other.synopsys == synopsys) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            const DeepCollectionEquality().equals(other._related, _related));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        title,
        titleLong,
        isbn,
        isbn13,
        deweyDecimal,
        binding,
        publisher,
        language,
        datePublished,
        edition,
        pages,
        dimensions,
        overview,
        image,
        msrp,
        excerpt,
        synopsys,
        const DeepCollectionEquality().hash(_authors),
        const DeepCollectionEquality().hash(_subjects),
        const DeepCollectionEquality().hash(_reviews),
        const DeepCollectionEquality().hash(_prices),
        const DeepCollectionEquality().hash(_related)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related)';
  }
}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) =
      __$BookCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'title_long') String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @_DateConverter()
      @JsonKey(name: 'date_published')
      DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @_MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String?>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? titleLong = freezed,
    Object? isbn = null,
    Object? isbn13 = null,
    Object? deweyDecimal = freezed,
    Object? binding = freezed,
    Object? publisher = freezed,
    Object? language = freezed,
    Object? datePublished = freezed,
    Object? edition = freezed,
    Object? pages = freezed,
    Object? dimensions = freezed,
    Object? overview = freezed,
    Object? image = freezed,
    Object? msrp = freezed,
    Object? excerpt = freezed,
    Object? synopsys = freezed,
    Object? authors = freezed,
    Object? subjects = freezed,
    Object? reviews = freezed,
    Object? prices = freezed,
    Object? related = freezed,
  }) {
    return _then(_Book(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: freezed == titleLong
          ? _self.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: null == isbn
          ? _self.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: null == isbn13
          ? _self.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: freezed == deweyDecimal
          ? _self.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: freezed == binding
          ? _self.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _self.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: freezed == edition
          ? _self.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: freezed == dimensions
          ? _self.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: freezed == msrp
          ? _self.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: freezed == excerpt
          ? _self.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: freezed == synopsys
          ? _self.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _self._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: freezed == subjects
          ? _self._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: freezed == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: freezed == prices
          ? _self._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: freezed == related
          ? _self._related
          : related // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$Merchant implements DiagnosticableTreeMixin {
  /// Not documented in the official API
  String get condition;

  /// Name of the seller of the book
  String get merchant;

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  String get merchantLogo;

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  Map get merchantLogoOffset;

  /// Shipping cost
  String get shipping;

  /// Price of the book
  String get price;

  /// Not documented in the official API
  String get total;

  /// Link to the purchase url
  String get link;

  /// Create a copy of Merchant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MerchantCopyWith<Merchant> get copyWith =>
      _$MerchantCopyWithImpl<Merchant>(this as Merchant, _$identity);

  /// Serializes this Merchant to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Merchant'))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('merchant', merchant))
      ..add(DiagnosticsProperty('merchantLogo', merchantLogo))
      ..add(DiagnosticsProperty('merchantLogoOffset', merchantLogoOffset))
      ..add(DiagnosticsProperty('shipping', shipping))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('link', link));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Merchant &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.merchantLogo, merchantLogo) ||
                other.merchantLogo == merchantLogo) &&
            const DeepCollectionEquality()
                .equals(other.merchantLogoOffset, merchantLogoOffset) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      condition,
      merchant,
      merchantLogo,
      const DeepCollectionEquality().hash(merchantLogoOffset),
      shipping,
      price,
      total,
      link);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
  }
}

/// @nodoc
abstract mixin class $MerchantCopyWith<$Res> {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) _then) =
      _$MerchantCopyWithImpl;
  @useResult
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo') String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset') Map merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class _$MerchantCopyWithImpl<$Res> implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._self, this._then);

  final Merchant _self;
  final $Res Function(Merchant) _then;

  /// Create a copy of Merchant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? merchant = null,
    Object? merchantLogo = null,
    Object? merchantLogoOffset = null,
    Object? shipping = null,
    Object? price = null,
    Object? total = null,
    Object? link = null,
  }) {
    return _then(_self.copyWith(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _self.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: null == merchantLogo
          ? _self.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: null == merchantLogoOffset
          ? _self.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Merchant with DiagnosticableTreeMixin implements Merchant {
  _Merchant(
      {required this.condition,
      required this.merchant,
      @JsonKey(name: 'merchant_logo') required this.merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
      required final Map merchantLogoOffset,
      required this.shipping,
      required this.price,
      required this.total,
      required this.link})
      : _merchantLogoOffset = merchantLogoOffset;
  factory _Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);

  /// Not documented in the official API
  @override
  final String condition;

  /// Name of the seller of the book
  @override
  final String merchant;

  /// URL of the merchant logo
  @override
  @JsonKey(name: 'merchant_logo')
  final String merchantLogo;

  /// Not documented in the official API
  final Map _merchantLogoOffset;

  /// Not documented in the official API
  @override
  @JsonKey(name: 'merchant_logo_offset')
  Map get merchantLogoOffset {
    if (_merchantLogoOffset is EqualUnmodifiableMapView)
      return _merchantLogoOffset;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_merchantLogoOffset);
  }

  /// Shipping cost
  @override
  final String shipping;

  /// Price of the book
  @override
  final String price;

  /// Not documented in the official API
  @override
  final String total;

  /// Link to the purchase url
  @override
  final String link;

  /// Create a copy of Merchant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MerchantCopyWith<_Merchant> get copyWith =>
      __$MerchantCopyWithImpl<_Merchant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MerchantToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Merchant'))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('merchant', merchant))
      ..add(DiagnosticsProperty('merchantLogo', merchantLogo))
      ..add(DiagnosticsProperty('merchantLogoOffset', merchantLogoOffset))
      ..add(DiagnosticsProperty('shipping', shipping))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('link', link));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Merchant &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.merchantLogo, merchantLogo) ||
                other.merchantLogo == merchantLogo) &&
            const DeepCollectionEquality()
                .equals(other._merchantLogoOffset, _merchantLogoOffset) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      condition,
      merchant,
      merchantLogo,
      const DeepCollectionEquality().hash(_merchantLogoOffset),
      shipping,
      price,
      total,
      link);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
  }
}

/// @nodoc
abstract mixin class _$MerchantCopyWith<$Res>
    implements $MerchantCopyWith<$Res> {
  factory _$MerchantCopyWith(_Merchant value, $Res Function(_Merchant) _then) =
      __$MerchantCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo') String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset') Map merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class __$MerchantCopyWithImpl<$Res> implements _$MerchantCopyWith<$Res> {
  __$MerchantCopyWithImpl(this._self, this._then);

  final _Merchant _self;
  final $Res Function(_Merchant) _then;

  /// Create a copy of Merchant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? condition = null,
    Object? merchant = null,
    Object? merchantLogo = null,
    Object? merchantLogoOffset = null,
    Object? shipping = null,
    Object? price = null,
    Object? total = null,
    Object? link = null,
  }) {
    return _then(_Merchant(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _self.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: null == merchantLogo
          ? _self.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: null == merchantLogoOffset
          ? _self._merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PublisherQueryResult implements DiagnosticableTreeMixin {
  /// The number of results for this query
  int get total;

  /// The list of the publishers matching the query
  List<String> get publishers;

  /// Create a copy of PublisherQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublisherQueryResultCopyWith<PublisherQueryResult> get copyWith =>
      _$PublisherQueryResultCopyWithImpl<PublisherQueryResult>(
          this as PublisherQueryResult, _$identity);

  /// Serializes this PublisherQueryResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PublisherQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('publishers', publishers));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublisherQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other.publishers, publishers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(publishers));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublisherQueryResult(total: $total, publishers: $publishers)';
  }
}

/// @nodoc
abstract mixin class $PublisherQueryResultCopyWith<$Res> {
  factory $PublisherQueryResultCopyWith(PublisherQueryResult value,
          $Res Function(PublisherQueryResult) _then) =
      _$PublisherQueryResultCopyWithImpl;
  @useResult
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class _$PublisherQueryResultCopyWithImpl<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  _$PublisherQueryResultCopyWithImpl(this._self, this._then);

  final PublisherQueryResult _self;
  final $Res Function(PublisherQueryResult) _then;

  /// Create a copy of PublisherQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? publishers = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: null == publishers
          ? _self.publishers
          : publishers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PublisherQueryResult
    with DiagnosticableTreeMixin
    implements PublisherQueryResult {
  _PublisherQueryResult(
      {required this.total, final List<String> publishers = const []})
      : _publishers = publishers;
  factory _PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$PublisherQueryResultFromJson(json);

  /// The number of results for this query
  @override
  final int total;

  /// The list of the publishers matching the query
  final List<String> _publishers;

  /// The list of the publishers matching the query
  @override
  @JsonKey()
  List<String> get publishers {
    if (_publishers is EqualUnmodifiableListView) return _publishers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publishers);
  }

  /// Create a copy of PublisherQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublisherQueryResultCopyWith<_PublisherQueryResult> get copyWith =>
      __$PublisherQueryResultCopyWithImpl<_PublisherQueryResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublisherQueryResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PublisherQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('publishers', publishers));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublisherQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._publishers, _publishers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_publishers));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublisherQueryResult(total: $total, publishers: $publishers)';
  }
}

/// @nodoc
abstract mixin class _$PublisherQueryResultCopyWith<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  factory _$PublisherQueryResultCopyWith(_PublisherQueryResult value,
          $Res Function(_PublisherQueryResult) _then) =
      __$PublisherQueryResultCopyWithImpl;
  @override
  @useResult
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class __$PublisherQueryResultCopyWithImpl<$Res>
    implements _$PublisherQueryResultCopyWith<$Res> {
  __$PublisherQueryResultCopyWithImpl(this._self, this._then);

  final _PublisherQueryResult _self;
  final $Res Function(_PublisherQueryResult) _then;

  /// Create a copy of PublisherQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? publishers = null,
  }) {
    return _then(_PublisherQueryResult(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: null == publishers
          ? _self._publishers
          : publishers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Publisher implements DiagnosticableTreeMixin {
  /// The name of this publisher
  String get name;

  /// The list of the books this publisher published
  List<Book> get books;

  /// Create a copy of Publisher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublisherCopyWith<Publisher> get copyWith =>
      _$PublisherCopyWithImpl<Publisher>(this as Publisher, _$identity);

  /// Serializes this Publisher to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Publisher'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Publisher &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Publisher(name: $name, books: $books)';
  }
}

/// @nodoc
abstract mixin class $PublisherCopyWith<$Res> {
  factory $PublisherCopyWith(Publisher value, $Res Function(Publisher) _then) =
      _$PublisherCopyWithImpl;
  @useResult
  $Res call({String name, List<Book> books});
}

/// @nodoc
class _$PublisherCopyWithImpl<$Res> implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._self, this._then);

  final Publisher _self;
  final $Res Function(Publisher) _then;

  /// Create a copy of Publisher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? books = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Publisher with DiagnosticableTreeMixin implements Publisher {
  _Publisher({required this.name, final List<Book> books = const []})
      : _books = books;
  factory _Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  /// The name of this publisher
  @override
  final String name;

  /// The list of the books this publisher published
  final List<Book> _books;

  /// The list of the books this publisher published
  @override
  @JsonKey()
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  /// Create a copy of Publisher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublisherCopyWith<_Publisher> get copyWith =>
      __$PublisherCopyWithImpl<_Publisher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublisherToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Publisher'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Publisher &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Publisher(name: $name, books: $books)';
  }
}

/// @nodoc
abstract mixin class _$PublisherCopyWith<$Res>
    implements $PublisherCopyWith<$Res> {
  factory _$PublisherCopyWith(
          _Publisher value, $Res Function(_Publisher) _then) =
      __$PublisherCopyWithImpl;
  @override
  @useResult
  $Res call({String name, List<Book> books});
}

/// @nodoc
class __$PublisherCopyWithImpl<$Res> implements _$PublisherCopyWith<$Res> {
  __$PublisherCopyWithImpl(this._self, this._then);

  final _Publisher _self;
  final $Res Function(_Publisher) _then;

  /// Create a copy of Publisher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? books = null,
  }) {
    return _then(_Publisher(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
mixin _$SubjectQueryResult implements DiagnosticableTreeMixin {
  /// The number of results for this query
  int get total;

  /// The list of the subjects matching the query
  List<String> get subjects;

  /// Create a copy of SubjectQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubjectQueryResultCopyWith<SubjectQueryResult> get copyWith =>
      _$SubjectQueryResultCopyWithImpl<SubjectQueryResult>(
          this as SubjectQueryResult, _$identity);

  /// Serializes this SubjectQueryResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SubjectQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('subjects', subjects));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubjectQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(subjects));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubjectQueryResult(total: $total, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class $SubjectQueryResultCopyWith<$Res> {
  factory $SubjectQueryResultCopyWith(
          SubjectQueryResult value, $Res Function(SubjectQueryResult) _then) =
      _$SubjectQueryResultCopyWithImpl;
  @useResult
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class _$SubjectQueryResultCopyWithImpl<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  _$SubjectQueryResultCopyWithImpl(this._self, this._then);

  final SubjectQueryResult _self;
  final $Res Function(SubjectQueryResult) _then;

  /// Create a copy of SubjectQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? subjects = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _self.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubjectQueryResult
    with DiagnosticableTreeMixin
    implements SubjectQueryResult {
  _SubjectQueryResult(
      {required this.total, final List<String> subjects = const []})
      : _subjects = subjects;
  factory _SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$SubjectQueryResultFromJson(json);

  /// The number of results for this query
  @override
  final int total;

  /// The list of the subjects matching the query
  final List<String> _subjects;

  /// The list of the subjects matching the query
  @override
  @JsonKey()
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  /// Create a copy of SubjectQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubjectQueryResultCopyWith<_SubjectQueryResult> get copyWith =>
      __$SubjectQueryResultCopyWithImpl<_SubjectQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubjectQueryResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SubjectQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('subjects', subjects));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubjectQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_subjects));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubjectQueryResult(total: $total, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class _$SubjectQueryResultCopyWith<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  factory _$SubjectQueryResultCopyWith(
          _SubjectQueryResult value, $Res Function(_SubjectQueryResult) _then) =
      __$SubjectQueryResultCopyWithImpl;
  @override
  @useResult
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class __$SubjectQueryResultCopyWithImpl<$Res>
    implements _$SubjectQueryResultCopyWith<$Res> {
  __$SubjectQueryResultCopyWithImpl(this._self, this._then);

  final _SubjectQueryResult _self;
  final $Res Function(_SubjectQueryResult) _then;

  /// Create a copy of SubjectQueryResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? subjects = null,
  }) {
    return _then(_SubjectQueryResult(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _self._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$Subject implements DiagnosticableTreeMixin {
  /// The subject
  String get subject;

  /// The list of the books matching this subject
  List<Book> get books;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<Subject> get copyWith =>
      _$SubjectCopyWithImpl<Subject>(this as Subject, _$identity);

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Subject'))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Subject &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subject, const DeepCollectionEquality().hash(books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subject(subject: $subject, books: $books)';
  }
}

/// @nodoc
abstract mixin class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) _then) =
      _$SubjectCopyWithImpl;
  @useResult
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._self, this._then);

  final Subject _self;
  final $Res Function(Subject) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? books = null,
  }) {
    return _then(_self.copyWith(
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Subject with DiagnosticableTreeMixin implements Subject {
  _Subject({required this.subject, final List<Book> books = const []})
      : _books = books;
  factory _Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  /// The subject
  @override
  final String subject;

  /// The list of the books matching this subject
  final List<Book> _books;

  /// The list of the books matching this subject
  @override
  @JsonKey()
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubjectCopyWith<_Subject> get copyWith =>
      __$SubjectCopyWithImpl<_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubjectToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Subject'))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Subject &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subject, const DeepCollectionEquality().hash(_books));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subject(subject: $subject, books: $books)';
  }
}

/// @nodoc
abstract mixin class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) _then) =
      __$SubjectCopyWithImpl;
  @override
  @useResult
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class __$SubjectCopyWithImpl<$Res> implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(this._self, this._then);

  final _Subject _self;
  final $Res Function(_Subject) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subject = null,
    Object? books = null,
  }) {
    return _then(_Subject(
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _self._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

// dart format on

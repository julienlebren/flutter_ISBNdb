// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of isbndb_flutter;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorQueryResult _$AuthorQueryResultFromJson(Map<String, dynamic> json) {
  return _AuthorQueryResult.fromJson(json);
}

/// @nodoc
class _$AuthorQueryResultTearOff {
  const _$AuthorQueryResultTearOff();

  _AuthorQueryResult call(
      {required int total, List<String> authors = const []}) {
    return _AuthorQueryResult(
      total: total,
      authors: authors,
    );
  }

  AuthorQueryResult fromJson(Map<String, Object?> json) {
    return AuthorQueryResult.fromJson(json);
  }
}

/// @nodoc
const $AuthorQueryResult = _$AuthorQueryResultTearOff();

/// @nodoc
mixin _$AuthorQueryResult {
  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;

  /// The list of the authors matching the query
  List<String> get authors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorQueryResultCopyWith<AuthorQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorQueryResultCopyWith<$Res> {
  factory $AuthorQueryResultCopyWith(
          AuthorQueryResult value, $Res Function(AuthorQueryResult) then) =
      _$AuthorQueryResultCopyWithImpl<$Res>;
  $Res call({int total, List<String> authors});
}

/// @nodoc
class _$AuthorQueryResultCopyWithImpl<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  _$AuthorQueryResultCopyWithImpl(this._value, this._then);

  final AuthorQueryResult _value;
  // ignore: unused_field
  final $Res Function(AuthorQueryResult) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? authors = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$AuthorQueryResultCopyWith<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  factory _$AuthorQueryResultCopyWith(
          _AuthorQueryResult value, $Res Function(_AuthorQueryResult) then) =
      __$AuthorQueryResultCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<String> authors});
}

/// @nodoc
class __$AuthorQueryResultCopyWithImpl<$Res>
    extends _$AuthorQueryResultCopyWithImpl<$Res>
    implements _$AuthorQueryResultCopyWith<$Res> {
  __$AuthorQueryResultCopyWithImpl(
      _AuthorQueryResult _value, $Res Function(_AuthorQueryResult) _then)
      : super(_value, (v) => _then(v as _AuthorQueryResult));

  @override
  _AuthorQueryResult get _value => super._value as _AuthorQueryResult;

  @override
  $Res call({
    Object? total = freezed,
    Object? authors = freezed,
  }) {
    return _then(_AuthorQueryResult(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorQueryResult
    with DiagnosticableTreeMixin
    implements _AuthorQueryResult {
  _$_AuthorQueryResult({required this.total, this.authors = const []});

  factory _$_AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey()
  @override

  /// The list of the authors matching the query
  final List<String> authors;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorQueryResult(total: $total, authors: $authors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('authors', authors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorQueryResult &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.authors, authors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(authors));

  @JsonKey(ignore: true)
  @override
  _$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith =>
      __$AuthorQueryResultCopyWithImpl<_AuthorQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorQueryResultToJson(this);
  }
}

abstract class _AuthorQueryResult implements AuthorQueryResult {
  factory _AuthorQueryResult({required int total, List<String> authors}) =
      _$_AuthorQueryResult;

  factory _AuthorQueryResult.fromJson(Map<String, dynamic> json) =
      _$_AuthorQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total;
  @override

  /// The list of the authors matching the query
  List<String> get authors;
  @override
  @JsonKey(ignore: true)
  _$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
class _$AuthorTearOff {
  const _$AuthorTearOff();

  _Author call({required String author, List<Book> books = const []}) {
    return _Author(
      author: author,
      books: books,
    );
  }

  Author fromJson(Map<String, Object?> json) {
    return Author.fromJson(json);
  }
}

/// @nodoc
const $Author = _$AuthorTearOff();

/// @nodoc
mixin _$Author {
  /// The name of the author
  String get author => throw _privateConstructorUsedError;

  /// The list of the books this author published
  List<Book> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res>;
  $Res call({String author, List<Book> books});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  final Author _value;
  // ignore: unused_field
  final $Res Function(Author) _then;

  @override
  $Res call({
    Object? author = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
abstract class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) then) =
      __$AuthorCopyWithImpl<$Res>;
  @override
  $Res call({String author, List<Book> books});
}

/// @nodoc
class __$AuthorCopyWithImpl<$Res> extends _$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(_Author _value, $Res Function(_Author) _then)
      : super(_value, (v) => _then(v as _Author));

  @override
  _Author get _value => super._value as _Author;

  @override
  $Res call({
    Object? author = freezed,
    Object? books = freezed,
  }) {
    return _then(_Author(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author with DiagnosticableTreeMixin implements _Author {
  _$_Author({required this.author, this.books = const []});

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorFromJson(json);

  @override

  /// The name of the author
  final String author;
  @JsonKey()
  @override

  /// The list of the books this author published
  final List<Book> books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Author(author: $author, books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Author'))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Author &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(books));

  @JsonKey(ignore: true)
  @override
  _$AuthorCopyWith<_Author> get copyWith =>
      __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorToJson(this);
  }
}

abstract class _Author implements Author {
  factory _Author({required String author, List<Book> books}) = _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override

  /// The name of the author
  String get author;
  @override

  /// The list of the books this author published
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$AuthorCopyWith<_Author> get copyWith => throw _privateConstructorUsedError;
}

BookQueryResult _$BookQueryResultFromJson(Map<String, dynamic> json) {
  return _BookQueryResult.fromJson(json);
}

/// @nodoc
class _$BookQueryResultTearOff {
  const _$BookQueryResultTearOff();

  _BookQueryResult call({required int total, List<Book> books = const []}) {
    return _BookQueryResult(
      total: total,
      books: books,
    );
  }

  BookQueryResult fromJson(Map<String, Object?> json) {
    return BookQueryResult.fromJson(json);
  }
}

/// @nodoc
const $BookQueryResult = _$BookQueryResultTearOff();

/// @nodoc
mixin _$BookQueryResult {
  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;

  /// The list of the books matching the query
  List<Book> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookQueryResultCopyWith<BookQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookQueryResultCopyWith<$Res> {
  factory $BookQueryResultCopyWith(
          BookQueryResult value, $Res Function(BookQueryResult) then) =
      _$BookQueryResultCopyWithImpl<$Res>;
  $Res call({int total, List<Book> books});
}

/// @nodoc
class _$BookQueryResultCopyWithImpl<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  _$BookQueryResultCopyWithImpl(this._value, this._then);

  final BookQueryResult _value;
  // ignore: unused_field
  final $Res Function(BookQueryResult) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
abstract class _$BookQueryResultCopyWith<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  factory _$BookQueryResultCopyWith(
          _BookQueryResult value, $Res Function(_BookQueryResult) then) =
      __$BookQueryResultCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<Book> books});
}

/// @nodoc
class __$BookQueryResultCopyWithImpl<$Res>
    extends _$BookQueryResultCopyWithImpl<$Res>
    implements _$BookQueryResultCopyWith<$Res> {
  __$BookQueryResultCopyWithImpl(
      _BookQueryResult _value, $Res Function(_BookQueryResult) _then)
      : super(_value, (v) => _then(v as _BookQueryResult));

  @override
  _BookQueryResult get _value => super._value as _BookQueryResult;

  @override
  $Res call({
    Object? total = freezed,
    Object? books = freezed,
  }) {
    return _then(_BookQueryResult(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookQueryResult
    with DiagnosticableTreeMixin
    implements _BookQueryResult {
  _$_BookQueryResult({required this.total, this.books = const []});

  factory _$_BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_BookQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey()
  @override

  /// The list of the books matching the query
  final List<Book> books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookQueryResult(total: $total, books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookQueryResult &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(books));

  @JsonKey(ignore: true)
  @override
  _$BookQueryResultCopyWith<_BookQueryResult> get copyWith =>
      __$BookQueryResultCopyWithImpl<_BookQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookQueryResultToJson(this);
  }
}

abstract class _BookQueryResult implements BookQueryResult {
  factory _BookQueryResult({required int total, List<Book> books}) =
      _$_BookQueryResult;

  factory _BookQueryResult.fromJson(Map<String, dynamic> json) =
      _$_BookQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total;
  @override

  /// The list of the books matching the query
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$BookQueryResultCopyWith<_BookQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {required String title,
      @JsonKey(name: 'title_long')
          String? titleLong,
      required String isbn,
      required String isbn13,
      @JsonKey(name: 'dewey_decimal')
          String? deweyDecimal,
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
      @_MsrpConverter()
          double? msrp,
      String? excerpt,
      String? synopsys,
      List<String?>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related}) {
    return _Book(
      title: title,
      titleLong: titleLong,
      isbn: isbn,
      isbn13: isbn13,
      deweyDecimal: deweyDecimal,
      binding: binding,
      publisher: publisher,
      language: language,
      datePublished: datePublished,
      edition: edition,
      pages: pages,
      dimensions: dimensions,
      overview: overview,
      image: image,
      msrp: msrp,
      excerpt: excerpt,
      synopsys: synopsys,
      authors: authors,
      subjects: subjects,
      reviews: reviews,
      prices: prices,
      related: related,
    );
  }

  Book fromJson(Map<String, Object?> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  /// Title of the book
  String get title => throw _privateConstructorUsedError;

  /// Long version of the title
  @JsonKey(name: 'title_long')
  String? get titleLong => throw _privateConstructorUsedError;

  /// ISBN of the book
  String get isbn => throw _privateConstructorUsedError;

  /// New 13-digit ISBN
  String get isbn13 => throw _privateConstructorUsedError;

  /// Not documented in the official API
  @JsonKey(name: 'dewey_decimal')
  String? get deweyDecimal => throw _privateConstructorUsedError;

  /// Not documented in the official API
  String? get binding => throw _privateConstructorUsedError;

  /// The name of the publisher
  String? get publisher => throw _privateConstructorUsedError;

  /// Language of the book
  String? get language => throw _privateConstructorUsedError;

  /// Date when the book was published. Can be a year or a full date.
  @_DateConverter()
  @JsonKey(name: 'date_published')
  DateTime? get datePublished => throw _privateConstructorUsedError;

  /// Details about the edition
  String? get edition => throw _privateConstructorUsedError;

  /// Number of pages of the book
  int? get pages => throw _privateConstructorUsedError;

  /// Dimensions of the book
  String? get dimensions => throw _privateConstructorUsedError;

  /// Not documented in the official API
  String? get overview => throw _privateConstructorUsedError;

  /// URL of the cover
  String? get image => throw _privateConstructorUsedError;

  /// Not documented in the official API
  @_MsrpConverter()
  double? get msrp => throw _privateConstructorUsedError;

  /// Excerpt of the book
  String? get excerpt => throw _privateConstructorUsedError;

  /// Synopsys of the book
  String? get synopsys => throw _privateConstructorUsedError;

  /// List of the authors of the book
  List<String?>? get authors => throw _privateConstructorUsedError;

  /// List of the subjects of the book
  List<String>? get subjects => throw _privateConstructorUsedError;

  /// Not documented in the official API
  List<String>? get reviews => throw _privateConstructorUsedError;

  /// List of the merchants selling this book with real-time prices
  List<Merchant>? get prices => throw _privateConstructorUsedError;

  /// Not documented in the official API
  List<String>? get related => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @JsonKey(name: 'title_long')
          String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal')
          String? deweyDecimal,
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
      @_MsrpConverter()
          double? msrp,
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
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? titleLong = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
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
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: titleLong == freezed
          ? _value.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: deweyDecimal == freezed
          ? _value.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: binding == freezed
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: edition == freezed
          ? _value.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: dimensions == freezed
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: msrp == freezed
          ? _value.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: synopsys == freezed
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: related == freezed
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @JsonKey(name: 'title_long')
          String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal')
          String? deweyDecimal,
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
      @_MsrpConverter()
          double? msrp,
      String? excerpt,
      String? synopsys,
      List<String?>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? title = freezed,
    Object? titleLong = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: titleLong == freezed
          ? _value.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: deweyDecimal == freezed
          ? _value.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: binding == freezed
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: edition == freezed
          ? _value.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: dimensions == freezed
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: msrp == freezed
          ? _value.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: synopsys == freezed
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: related == freezed
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book with DiagnosticableTreeMixin implements _Book {
  _$_Book(
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
      this.authors,
      this.subjects,
      this.reviews,
      this.prices,
      this.related});

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override

  /// Title of the book
  final String title;
  @override

  /// Long version of the title
  @JsonKey(name: 'title_long')
  final String? titleLong;
  @override

  /// ISBN of the book
  final String isbn;
  @override

  /// New 13-digit ISBN
  final String isbn13;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'dewey_decimal')
  final String? deweyDecimal;
  @override

  /// Not documented in the official API
  final String? binding;
  @override

  /// The name of the publisher
  final String? publisher;
  @override

  /// Language of the book
  final String? language;
  @override

  /// Date when the book was published. Can be a year or a full date.
  @_DateConverter()
  @JsonKey(name: 'date_published')
  final DateTime? datePublished;
  @override

  /// Details about the edition
  final String? edition;
  @override

  /// Number of pages of the book
  final int? pages;
  @override

  /// Dimensions of the book
  final String? dimensions;
  @override

  /// Not documented in the official API
  final String? overview;
  @override

  /// URL of the cover
  final String? image;
  @override

  /// Not documented in the official API
  @_MsrpConverter()
  final double? msrp;
  @override

  /// Excerpt of the book
  final String? excerpt;
  @override

  /// Synopsys of the book
  final String? synopsys;
  @override

  /// List of the authors of the book
  final List<String?>? authors;
  @override

  /// List of the subjects of the book
  final List<String>? subjects;
  @override

  /// Not documented in the official API
  final List<String>? reviews;
  @override

  /// List of the merchants selling this book with real-time prices
  final List<Merchant>? prices;
  @override

  /// Not documented in the official API
  final List<String>? related;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.titleLong, titleLong) &&
            const DeepCollectionEquality().equals(other.isbn, isbn) &&
            const DeepCollectionEquality().equals(other.isbn13, isbn13) &&
            const DeepCollectionEquality()
                .equals(other.deweyDecimal, deweyDecimal) &&
            const DeepCollectionEquality().equals(other.binding, binding) &&
            const DeepCollectionEquality().equals(other.publisher, publisher) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.datePublished, datePublished) &&
            const DeepCollectionEquality().equals(other.edition, edition) &&
            const DeepCollectionEquality().equals(other.pages, pages) &&
            const DeepCollectionEquality()
                .equals(other.dimensions, dimensions) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.msrp, msrp) &&
            const DeepCollectionEquality().equals(other.excerpt, excerpt) &&
            const DeepCollectionEquality().equals(other.synopsys, synopsys) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.subjects, subjects) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            const DeepCollectionEquality().equals(other.prices, prices) &&
            const DeepCollectionEquality().equals(other.related, related));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(titleLong),
        const DeepCollectionEquality().hash(isbn),
        const DeepCollectionEquality().hash(isbn13),
        const DeepCollectionEquality().hash(deweyDecimal),
        const DeepCollectionEquality().hash(binding),
        const DeepCollectionEquality().hash(publisher),
        const DeepCollectionEquality().hash(language),
        const DeepCollectionEquality().hash(datePublished),
        const DeepCollectionEquality().hash(edition),
        const DeepCollectionEquality().hash(pages),
        const DeepCollectionEquality().hash(dimensions),
        const DeepCollectionEquality().hash(overview),
        const DeepCollectionEquality().hash(image),
        const DeepCollectionEquality().hash(msrp),
        const DeepCollectionEquality().hash(excerpt),
        const DeepCollectionEquality().hash(synopsys),
        const DeepCollectionEquality().hash(authors),
        const DeepCollectionEquality().hash(subjects),
        const DeepCollectionEquality().hash(reviews),
        const DeepCollectionEquality().hash(prices),
        const DeepCollectionEquality().hash(related)
      ]);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(this);
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required String title,
      @JsonKey(name: 'title_long')
          String? titleLong,
      required String isbn,
      required String isbn13,
      @JsonKey(name: 'dewey_decimal')
          String? deweyDecimal,
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
      @_MsrpConverter()
          double? msrp,
      String? excerpt,
      String? synopsys,
      List<String?>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override

  /// Title of the book
  String get title;
  @override

  /// Long version of the title
  @JsonKey(name: 'title_long')
  String? get titleLong;
  @override

  /// ISBN of the book
  String get isbn;
  @override

  /// New 13-digit ISBN
  String get isbn13;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'dewey_decimal')
  String? get deweyDecimal;
  @override

  /// Not documented in the official API
  String? get binding;
  @override

  /// The name of the publisher
  String? get publisher;
  @override

  /// Language of the book
  String? get language;
  @override

  /// Date when the book was published. Can be a year or a full date.
  @_DateConverter()
  @JsonKey(name: 'date_published')
  DateTime? get datePublished;
  @override

  /// Details about the edition
  String? get edition;
  @override

  /// Number of pages of the book
  int? get pages;
  @override

  /// Dimensions of the book
  String? get dimensions;
  @override

  /// Not documented in the official API
  String? get overview;
  @override

  /// URL of the cover
  String? get image;
  @override

  /// Not documented in the official API
  @_MsrpConverter()
  double? get msrp;
  @override

  /// Excerpt of the book
  String? get excerpt;
  @override

  /// Synopsys of the book
  String? get synopsys;
  @override

  /// List of the authors of the book
  List<String?>? get authors;
  @override

  /// List of the subjects of the book
  List<String>? get subjects;
  @override

  /// Not documented in the official API
  List<String>? get reviews;
  @override

  /// List of the merchants selling this book with real-time prices
  List<Merchant>? get prices;
  @override

  /// Not documented in the official API
  List<String>? get related;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return _Merchant.fromJson(json);
}

/// @nodoc
class _$MerchantTearOff {
  const _$MerchantTearOff();

  _Merchant call(
      {required String condition,
      required String merchant,
      @JsonKey(name: 'merchant_logo')
          required String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          required Map<dynamic, dynamic> merchantLogoOffset,
      required String shipping,
      required String price,
      required String total,
      required String link}) {
    return _Merchant(
      condition: condition,
      merchant: merchant,
      merchantLogo: merchantLogo,
      merchantLogoOffset: merchantLogoOffset,
      shipping: shipping,
      price: price,
      total: total,
      link: link,
    );
  }

  Merchant fromJson(Map<String, Object?> json) {
    return Merchant.fromJson(json);
  }
}

/// @nodoc
const $Merchant = _$MerchantTearOff();

/// @nodoc
mixin _$Merchant {
  /// Not documented in the official API
  String get condition => throw _privateConstructorUsedError;

  /// Name of the seller of the book
  String get merchant => throw _privateConstructorUsedError;

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  String get merchantLogo => throw _privateConstructorUsedError;

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  Map<dynamic, dynamic> get merchantLogoOffset =>
      throw _privateConstructorUsedError;

  /// Shipping cost
  String get shipping => throw _privateConstructorUsedError;

  /// Price of the book
  String get price => throw _privateConstructorUsedError;

  /// Not documented in the official API
  String get total => throw _privateConstructorUsedError;

  /// Link to the purchase url
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantCopyWith<Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantCopyWith<$Res> {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) then) =
      _$MerchantCopyWithImpl<$Res>;
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo')
          String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class _$MerchantCopyWithImpl<$Res> implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._value, this._then);

  final Merchant _value;
  // ignore: unused_field
  final $Res Function(Merchant) _then;

  @override
  $Res call({
    Object? condition = freezed,
    Object? merchant = freezed,
    Object? merchantLogo = freezed,
    Object? merchantLogoOffset = freezed,
    Object? shipping = freezed,
    Object? price = freezed,
    Object? total = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: merchant == freezed
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: merchantLogo == freezed
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: merchantLogoOffset == freezed
          ? _value.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory _$MerchantCopyWith(_Merchant value, $Res Function(_Merchant) then) =
      __$MerchantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo')
          String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class __$MerchantCopyWithImpl<$Res> extends _$MerchantCopyWithImpl<$Res>
    implements _$MerchantCopyWith<$Res> {
  __$MerchantCopyWithImpl(_Merchant _value, $Res Function(_Merchant) _then)
      : super(_value, (v) => _then(v as _Merchant));

  @override
  _Merchant get _value => super._value as _Merchant;

  @override
  $Res call({
    Object? condition = freezed,
    Object? merchant = freezed,
    Object? merchantLogo = freezed,
    Object? merchantLogoOffset = freezed,
    Object? shipping = freezed,
    Object? price = freezed,
    Object? total = freezed,
    Object? link = freezed,
  }) {
    return _then(_Merchant(
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: merchant == freezed
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: merchantLogo == freezed
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: merchantLogoOffset == freezed
          ? _value.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Merchant with DiagnosticableTreeMixin implements _Merchant {
  _$_Merchant(
      {required this.condition,
      required this.merchant,
      @JsonKey(name: 'merchant_logo') required this.merchantLogo,
      @JsonKey(name: 'merchant_logo_offset') required this.merchantLogoOffset,
      required this.shipping,
      required this.price,
      required this.total,
      required this.link});

  factory _$_Merchant.fromJson(Map<String, dynamic> json) =>
      _$$_MerchantFromJson(json);

  @override

  /// Not documented in the official API
  final String condition;
  @override

  /// Name of the seller of the book
  final String merchant;
  @override

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  final String merchantLogo;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  final Map<dynamic, dynamic> merchantLogoOffset;
  @override

  /// Shipping cost
  final String shipping;
  @override

  /// Price of the book
  final String price;
  @override

  /// Not documented in the official API
  final String total;
  @override

  /// Link to the purchase url
  final String link;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Merchant &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality().equals(other.merchant, merchant) &&
            const DeepCollectionEquality()
                .equals(other.merchantLogo, merchantLogo) &&
            const DeepCollectionEquality()
                .equals(other.merchantLogoOffset, merchantLogoOffset) &&
            const DeepCollectionEquality().equals(other.shipping, shipping) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.link, link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(merchant),
      const DeepCollectionEquality().hash(merchantLogo),
      const DeepCollectionEquality().hash(merchantLogoOffset),
      const DeepCollectionEquality().hash(shipping),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(link));

  @JsonKey(ignore: true)
  @override
  _$MerchantCopyWith<_Merchant> get copyWith =>
      __$MerchantCopyWithImpl<_Merchant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerchantToJson(this);
  }
}

abstract class _Merchant implements Merchant {
  factory _Merchant(
      {required String condition,
      required String merchant,
      @JsonKey(name: 'merchant_logo')
          required String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          required Map<dynamic, dynamic> merchantLogoOffset,
      required String shipping,
      required String price,
      required String total,
      required String link}) = _$_Merchant;

  factory _Merchant.fromJson(Map<String, dynamic> json) = _$_Merchant.fromJson;

  @override

  /// Not documented in the official API
  String get condition;
  @override

  /// Name of the seller of the book
  String get merchant;
  @override

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  String get merchantLogo;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  Map<dynamic, dynamic> get merchantLogoOffset;
  @override

  /// Shipping cost
  String get shipping;
  @override

  /// Price of the book
  String get price;
  @override

  /// Not documented in the official API
  String get total;
  @override

  /// Link to the purchase url
  String get link;
  @override
  @JsonKey(ignore: true)
  _$MerchantCopyWith<_Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

PublisherQueryResult _$PublisherQueryResultFromJson(Map<String, dynamic> json) {
  return _PublisherQueryResult.fromJson(json);
}

/// @nodoc
class _$PublisherQueryResultTearOff {
  const _$PublisherQueryResultTearOff();

  _PublisherQueryResult call(
      {required int total, List<String> publishers = const []}) {
    return _PublisherQueryResult(
      total: total,
      publishers: publishers,
    );
  }

  PublisherQueryResult fromJson(Map<String, Object?> json) {
    return PublisherQueryResult.fromJson(json);
  }
}

/// @nodoc
const $PublisherQueryResult = _$PublisherQueryResultTearOff();

/// @nodoc
mixin _$PublisherQueryResult {
  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;

  /// The list of the publishers matching the query
  List<String> get publishers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublisherQueryResultCopyWith<PublisherQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherQueryResultCopyWith<$Res> {
  factory $PublisherQueryResultCopyWith(PublisherQueryResult value,
          $Res Function(PublisherQueryResult) then) =
      _$PublisherQueryResultCopyWithImpl<$Res>;
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class _$PublisherQueryResultCopyWithImpl<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  _$PublisherQueryResultCopyWithImpl(this._value, this._then);

  final PublisherQueryResult _value;
  // ignore: unused_field
  final $Res Function(PublisherQueryResult) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? publishers = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: publishers == freezed
          ? _value.publishers
          : publishers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PublisherQueryResultCopyWith<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  factory _$PublisherQueryResultCopyWith(_PublisherQueryResult value,
          $Res Function(_PublisherQueryResult) then) =
      __$PublisherQueryResultCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class __$PublisherQueryResultCopyWithImpl<$Res>
    extends _$PublisherQueryResultCopyWithImpl<$Res>
    implements _$PublisherQueryResultCopyWith<$Res> {
  __$PublisherQueryResultCopyWithImpl(
      _PublisherQueryResult _value, $Res Function(_PublisherQueryResult) _then)
      : super(_value, (v) => _then(v as _PublisherQueryResult));

  @override
  _PublisherQueryResult get _value => super._value as _PublisherQueryResult;

  @override
  $Res call({
    Object? total = freezed,
    Object? publishers = freezed,
  }) {
    return _then(_PublisherQueryResult(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: publishers == freezed
          ? _value.publishers
          : publishers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublisherQueryResult
    with DiagnosticableTreeMixin
    implements _PublisherQueryResult {
  _$_PublisherQueryResult({required this.total, this.publishers = const []});

  factory _$_PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey()
  @override

  /// The list of the publishers matching the query
  final List<String> publishers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublisherQueryResult(total: $total, publishers: $publishers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublisherQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('publishers', publishers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublisherQueryResult &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.publishers, publishers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(publishers));

  @JsonKey(ignore: true)
  @override
  _$PublisherQueryResultCopyWith<_PublisherQueryResult> get copyWith =>
      __$PublisherQueryResultCopyWithImpl<_PublisherQueryResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublisherQueryResultToJson(this);
  }
}

abstract class _PublisherQueryResult implements PublisherQueryResult {
  factory _PublisherQueryResult({required int total, List<String> publishers}) =
      _$_PublisherQueryResult;

  factory _PublisherQueryResult.fromJson(Map<String, dynamic> json) =
      _$_PublisherQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total;
  @override

  /// The list of the publishers matching the query
  List<String> get publishers;
  @override
  @JsonKey(ignore: true)
  _$PublisherQueryResultCopyWith<_PublisherQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Publisher _$PublisherFromJson(Map<String, dynamic> json) {
  return _Publisher.fromJson(json);
}

/// @nodoc
class _$PublisherTearOff {
  const _$PublisherTearOff();

  _Publisher call({required String name, List<Book> books = const []}) {
    return _Publisher(
      name: name,
      books: books,
    );
  }

  Publisher fromJson(Map<String, Object?> json) {
    return Publisher.fromJson(json);
  }
}

/// @nodoc
const $Publisher = _$PublisherTearOff();

/// @nodoc
mixin _$Publisher {
  /// The name of this publisher
  String get name => throw _privateConstructorUsedError;

  /// The list of the books this publisher published
  List<Book> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublisherCopyWith<Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherCopyWith<$Res> {
  factory $PublisherCopyWith(Publisher value, $Res Function(Publisher) then) =
      _$PublisherCopyWithImpl<$Res>;
  $Res call({String name, List<Book> books});
}

/// @nodoc
class _$PublisherCopyWithImpl<$Res> implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._value, this._then);

  final Publisher _value;
  // ignore: unused_field
  final $Res Function(Publisher) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
abstract class _$PublisherCopyWith<$Res> implements $PublisherCopyWith<$Res> {
  factory _$PublisherCopyWith(
          _Publisher value, $Res Function(_Publisher) then) =
      __$PublisherCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Book> books});
}

/// @nodoc
class __$PublisherCopyWithImpl<$Res> extends _$PublisherCopyWithImpl<$Res>
    implements _$PublisherCopyWith<$Res> {
  __$PublisherCopyWithImpl(_Publisher _value, $Res Function(_Publisher) _then)
      : super(_value, (v) => _then(v as _Publisher));

  @override
  _Publisher get _value => super._value as _Publisher;

  @override
  $Res call({
    Object? name = freezed,
    Object? books = freezed,
  }) {
    return _then(_Publisher(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Publisher with DiagnosticableTreeMixin implements _Publisher {
  _$_Publisher({required this.name, this.books = const []});

  factory _$_Publisher.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherFromJson(json);

  @override

  /// The name of this publisher
  final String name;
  @JsonKey()
  @override

  /// The list of the books this publisher published
  final List<Book> books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Publisher(name: $name, books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Publisher'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Publisher &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(books));

  @JsonKey(ignore: true)
  @override
  _$PublisherCopyWith<_Publisher> get copyWith =>
      __$PublisherCopyWithImpl<_Publisher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublisherToJson(this);
  }
}

abstract class _Publisher implements Publisher {
  factory _Publisher({required String name, List<Book> books}) = _$_Publisher;

  factory _Publisher.fromJson(Map<String, dynamic> json) =
      _$_Publisher.fromJson;

  @override

  /// The name of this publisher
  String get name;
  @override

  /// The list of the books this publisher published
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$PublisherCopyWith<_Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectQueryResult _$SubjectQueryResultFromJson(Map<String, dynamic> json) {
  return _SubjectQueryResult.fromJson(json);
}

/// @nodoc
class _$SubjectQueryResultTearOff {
  const _$SubjectQueryResultTearOff();

  _SubjectQueryResult call(
      {required int total, List<String> subjects = const []}) {
    return _SubjectQueryResult(
      total: total,
      subjects: subjects,
    );
  }

  SubjectQueryResult fromJson(Map<String, Object?> json) {
    return SubjectQueryResult.fromJson(json);
  }
}

/// @nodoc
const $SubjectQueryResult = _$SubjectQueryResultTearOff();

/// @nodoc
mixin _$SubjectQueryResult {
  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;

  /// The list of the subjects matching the query
  List<String> get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectQueryResultCopyWith<SubjectQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectQueryResultCopyWith<$Res> {
  factory $SubjectQueryResultCopyWith(
          SubjectQueryResult value, $Res Function(SubjectQueryResult) then) =
      _$SubjectQueryResultCopyWithImpl<$Res>;
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class _$SubjectQueryResultCopyWithImpl<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  _$SubjectQueryResultCopyWithImpl(this._value, this._then);

  final SubjectQueryResult _value;
  // ignore: unused_field
  final $Res Function(SubjectQueryResult) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SubjectQueryResultCopyWith<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  factory _$SubjectQueryResultCopyWith(
          _SubjectQueryResult value, $Res Function(_SubjectQueryResult) then) =
      __$SubjectQueryResultCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class __$SubjectQueryResultCopyWithImpl<$Res>
    extends _$SubjectQueryResultCopyWithImpl<$Res>
    implements _$SubjectQueryResultCopyWith<$Res> {
  __$SubjectQueryResultCopyWithImpl(
      _SubjectQueryResult _value, $Res Function(_SubjectQueryResult) _then)
      : super(_value, (v) => _then(v as _SubjectQueryResult));

  @override
  _SubjectQueryResult get _value => super._value as _SubjectQueryResult;

  @override
  $Res call({
    Object? total = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_SubjectQueryResult(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubjectQueryResult
    with DiagnosticableTreeMixin
    implements _SubjectQueryResult {
  _$_SubjectQueryResult({required this.total, this.subjects = const []});

  factory _$_SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey()
  @override

  /// The list of the subjects matching the query
  final List<String> subjects;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubjectQueryResult(total: $total, subjects: $subjects)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubjectQueryResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('subjects', subjects));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubjectQueryResult &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(subjects));

  @JsonKey(ignore: true)
  @override
  _$SubjectQueryResultCopyWith<_SubjectQueryResult> get copyWith =>
      __$SubjectQueryResultCopyWithImpl<_SubjectQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectQueryResultToJson(this);
  }
}

abstract class _SubjectQueryResult implements SubjectQueryResult {
  factory _SubjectQueryResult({required int total, List<String> subjects}) =
      _$_SubjectQueryResult;

  factory _SubjectQueryResult.fromJson(Map<String, dynamic> json) =
      _$_SubjectQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total;
  @override

  /// The list of the subjects matching the query
  List<String> get subjects;
  @override
  @JsonKey(ignore: true)
  _$SubjectQueryResultCopyWith<_SubjectQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
class _$SubjectTearOff {
  const _$SubjectTearOff();

  _Subject call({required String subject, List<Book> books = const []}) {
    return _Subject(
      subject: subject,
      books: books,
    );
  }

  Subject fromJson(Map<String, Object?> json) {
    return Subject.fromJson(json);
  }
}

/// @nodoc
const $Subject = _$SubjectTearOff();

/// @nodoc
mixin _$Subject {
  /// The subject
  String get subject => throw _privateConstructorUsedError;

  /// The list of the books matching this subject
  List<Book> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res>;
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  final Subject _value;
  // ignore: unused_field
  final $Res Function(Subject) _then;

  @override
  $Res call({
    Object? subject = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
abstract class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) then) =
      __$SubjectCopyWithImpl<$Res>;
  @override
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class __$SubjectCopyWithImpl<$Res> extends _$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(_Subject _value, $Res Function(_Subject) _then)
      : super(_value, (v) => _then(v as _Subject));

  @override
  _Subject get _value => super._value as _Subject;

  @override
  $Res call({
    Object? subject = freezed,
    Object? books = freezed,
  }) {
    return _then(_Subject(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subject with DiagnosticableTreeMixin implements _Subject {
  _$_Subject({required this.subject, this.books = const []});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

  @override

  /// The subject
  final String subject;
  @JsonKey()
  @override

  /// The list of the books matching this subject
  final List<Book> books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subject(subject: $subject, books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Subject'))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Subject &&
            const DeepCollectionEquality().equals(other.subject, subject) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subject),
      const DeepCollectionEquality().hash(books));

  @JsonKey(ignore: true)
  @override
  _$SubjectCopyWith<_Subject> get copyWith =>
      __$SubjectCopyWithImpl<_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(this);
  }
}

abstract class _Subject implements Subject {
  factory _Subject({required String subject, List<Book> books}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override

  /// The subject
  String get subject;
  @override

  /// The list of the books matching this subject
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$SubjectCopyWith<_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}

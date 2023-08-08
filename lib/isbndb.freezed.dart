// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isbndb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorQueryResult _$AuthorQueryResultFromJson(Map<String, dynamic> json) {
  return _AuthorQueryResult.fromJson(json);
}

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
      _$AuthorQueryResultCopyWithImpl<$Res, AuthorQueryResult>;
  @useResult
  $Res call({int total, List<String> authors});
}

/// @nodoc
class _$AuthorQueryResultCopyWithImpl<$Res, $Val extends AuthorQueryResult>
    implements $AuthorQueryResultCopyWith<$Res> {
  _$AuthorQueryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? authors = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorQueryResultCopyWith<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  factory _$$_AuthorQueryResultCopyWith(_$_AuthorQueryResult value,
          $Res Function(_$_AuthorQueryResult) then) =
      __$$_AuthorQueryResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<String> authors});
}

/// @nodoc
class __$$_AuthorQueryResultCopyWithImpl<$Res>
    extends _$AuthorQueryResultCopyWithImpl<$Res, _$_AuthorQueryResult>
    implements _$$_AuthorQueryResultCopyWith<$Res> {
  __$$_AuthorQueryResultCopyWithImpl(
      _$_AuthorQueryResult _value, $Res Function(_$_AuthorQueryResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? authors = null,
  }) {
    return _then(_$_AuthorQueryResult(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      authors: null == authors
          ? _value._authors
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
  _$_AuthorQueryResult(
      {required this.total, final List<String> authors = const []})
      : _authors = authors;

  factory _$_AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorQueryResultFromJson(json);

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
            other is _$_AuthorQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_authors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorQueryResultCopyWith<_$_AuthorQueryResult> get copyWith =>
      __$$_AuthorQueryResultCopyWithImpl<_$_AuthorQueryResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorQueryResultToJson(
      this,
    );
  }
}

abstract class _AuthorQueryResult implements AuthorQueryResult {
  factory _AuthorQueryResult(
      {required final int total,
      final List<String> authors}) = _$_AuthorQueryResult;

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
  _$$_AuthorQueryResultCopyWith<_$_AuthorQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

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
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call({String author, List<Book> books});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$_AuthorCopyWith(_$_Author value, $Res Function(_$_Author) then) =
      __$$_AuthorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String author, List<Book> books});
}

/// @nodoc
class __$$_AuthorCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$_Author>
    implements _$$_AuthorCopyWith<$Res> {
  __$$_AuthorCopyWithImpl(_$_Author _value, $Res Function(_$_Author) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? books = null,
  }) {
    return _then(_$_Author(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author with DiagnosticableTreeMixin implements _Author {
  _$_Author({required this.author, final List<Book> books = const []})
      : _books = books;

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorFromJson(json);

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
            other is _$_Author &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, author, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      __$$_AuthorCopyWithImpl<_$_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  factory _Author({required final String author, final List<Book> books}) =
      _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override

  /// The name of the author
  String get author;
  @override

  /// The list of the books this author published
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      throw _privateConstructorUsedError;
}

BookQueryResult _$BookQueryResultFromJson(Map<String, dynamic> json) {
  return _BookQueryResult.fromJson(json);
}

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
      _$BookQueryResultCopyWithImpl<$Res, BookQueryResult>;
  @useResult
  $Res call({int total, List<Book> books});
}

/// @nodoc
class _$BookQueryResultCopyWithImpl<$Res, $Val extends BookQueryResult>
    implements $BookQueryResultCopyWith<$Res> {
  _$BookQueryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookQueryResultCopyWith<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  factory _$$_BookQueryResultCopyWith(
          _$_BookQueryResult value, $Res Function(_$_BookQueryResult) then) =
      __$$_BookQueryResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<Book> books});
}

/// @nodoc
class __$$_BookQueryResultCopyWithImpl<$Res>
    extends _$BookQueryResultCopyWithImpl<$Res, _$_BookQueryResult>
    implements _$$_BookQueryResultCopyWith<$Res> {
  __$$_BookQueryResultCopyWithImpl(
      _$_BookQueryResult _value, $Res Function(_$_BookQueryResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? books = null,
  }) {
    return _then(_$_BookQueryResult(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      books: null == books
          ? _value._books
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
  _$_BookQueryResult({required this.total, final List<Book> books = const []})
      : _books = books;

  factory _$_BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_BookQueryResultFromJson(json);

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
            other is _$_BookQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookQueryResultCopyWith<_$_BookQueryResult> get copyWith =>
      __$$_BookQueryResultCopyWithImpl<_$_BookQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookQueryResultToJson(
      this,
    );
  }
}

abstract class _BookQueryResult implements BookQueryResult {
  factory _BookQueryResult({required final int total, final List<Book> books}) =
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
  _$$_BookQueryResultCopyWith<_$_BookQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

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
      _$BookCopyWithImpl<$Res, Book>;
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
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: freezed == titleLong
          ? _value.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: null == isbn13
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: freezed == deweyDecimal
          ? _value.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: freezed == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: freezed == edition
          ? _value.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: freezed == msrp
          ? _value.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: freezed == synopsys
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: freezed == related
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
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
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

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
    return _then(_$_Book(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLong: freezed == titleLong
          ? _value.titleLong
          : titleLong // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      isbn13: null == isbn13
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      deweyDecimal: freezed == deweyDecimal
          ? _value.deweyDecimal
          : deweyDecimal // ignore: cast_nullable_to_non_nullable
              as String?,
      binding: freezed == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: freezed == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edition: freezed == edition
          ? _value.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      msrp: freezed == msrp
          ? _value.msrp
          : msrp // ignore: cast_nullable_to_non_nullable
              as double?,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: freezed == synopsys
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      prices: freezed == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Merchant>?,
      related: freezed == related
          ? _value._related
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

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

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
            other is _$_Book &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required final String title,
      @JsonKey(name: 'title_long') final String? titleLong,
      required final String isbn,
      required final String isbn13,
      @JsonKey(name: 'dewey_decimal') final String? deweyDecimal,
      final String? binding,
      final String? publisher,
      final String? language,
      @_DateConverter()
      @JsonKey(name: 'date_published')
      final DateTime? datePublished,
      final String? edition,
      final int? pages,
      final String? dimensions,
      final String? overview,
      final String? image,
      @_MsrpConverter() final double? msrp,
      final String? excerpt,
      final String? synopsys,
      final List<String?>? authors,
      final List<String>? subjects,
      final List<String>? reviews,
      final List<Merchant>? prices,
      final List<String>? related}) = _$_Book;

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
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return _Merchant.fromJson(json);
}

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
      _$MerchantCopyWithImpl<$Res, Merchant>;
  @useResult
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo') String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
      Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class _$MerchantCopyWithImpl<$Res, $Val extends Merchant>
    implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: null == merchantLogo
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: null == merchantLogoOffset
          ? _value.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory _$$_MerchantCopyWith(
          _$_Merchant value, $Res Function(_$_Merchant) then) =
      __$$_MerchantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo') String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
      Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class __$$_MerchantCopyWithImpl<$Res>
    extends _$MerchantCopyWithImpl<$Res, _$_Merchant>
    implements _$$_MerchantCopyWith<$Res> {
  __$$_MerchantCopyWithImpl(
      _$_Merchant _value, $Res Function(_$_Merchant) _then)
      : super(_value, _then);

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
    return _then(_$_Merchant(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: null == merchantLogo
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: null == merchantLogoOffset
          ? _value._merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
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
      @JsonKey(name: 'merchant_logo_offset')
      required final Map<dynamic, dynamic> merchantLogoOffset,
      required this.shipping,
      required this.price,
      required this.total,
      required this.link})
      : _merchantLogoOffset = merchantLogoOffset;

  factory _$_Merchant.fromJson(Map<String, dynamic> json) =>
      _$$_MerchantFromJson(json);

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
  final Map<dynamic, dynamic> _merchantLogoOffset;

  /// Not documented in the official API
  @override
  @JsonKey(name: 'merchant_logo_offset')
  Map<dynamic, dynamic> get merchantLogoOffset {
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
            other is _$_Merchant &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MerchantCopyWith<_$_Merchant> get copyWith =>
      __$$_MerchantCopyWithImpl<_$_Merchant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerchantToJson(
      this,
    );
  }
}

abstract class _Merchant implements Merchant {
  factory _Merchant(
      {required final String condition,
      required final String merchant,
      @JsonKey(name: 'merchant_logo') required final String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
      required final Map<dynamic, dynamic> merchantLogoOffset,
      required final String shipping,
      required final String price,
      required final String total,
      required final String link}) = _$_Merchant;

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
  _$$_MerchantCopyWith<_$_Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

PublisherQueryResult _$PublisherQueryResultFromJson(Map<String, dynamic> json) {
  return _PublisherQueryResult.fromJson(json);
}

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
      _$PublisherQueryResultCopyWithImpl<$Res, PublisherQueryResult>;
  @useResult
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class _$PublisherQueryResultCopyWithImpl<$Res,
        $Val extends PublisherQueryResult>
    implements $PublisherQueryResultCopyWith<$Res> {
  _$PublisherQueryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? publishers = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: null == publishers
          ? _value.publishers
          : publishers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublisherQueryResultCopyWith<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  factory _$$_PublisherQueryResultCopyWith(_$_PublisherQueryResult value,
          $Res Function(_$_PublisherQueryResult) then) =
      __$$_PublisherQueryResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<String> publishers});
}

/// @nodoc
class __$$_PublisherQueryResultCopyWithImpl<$Res>
    extends _$PublisherQueryResultCopyWithImpl<$Res, _$_PublisherQueryResult>
    implements _$$_PublisherQueryResultCopyWith<$Res> {
  __$$_PublisherQueryResultCopyWithImpl(_$_PublisherQueryResult _value,
      $Res Function(_$_PublisherQueryResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? publishers = null,
  }) {
    return _then(_$_PublisherQueryResult(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      publishers: null == publishers
          ? _value._publishers
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
  _$_PublisherQueryResult(
      {required this.total, final List<String> publishers = const []})
      : _publishers = publishers;

  factory _$_PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherQueryResultFromJson(json);

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
            other is _$_PublisherQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._publishers, _publishers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_publishers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublisherQueryResultCopyWith<_$_PublisherQueryResult> get copyWith =>
      __$$_PublisherQueryResultCopyWithImpl<_$_PublisherQueryResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublisherQueryResultToJson(
      this,
    );
  }
}

abstract class _PublisherQueryResult implements PublisherQueryResult {
  factory _PublisherQueryResult(
      {required final int total,
      final List<String> publishers}) = _$_PublisherQueryResult;

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
  _$$_PublisherQueryResultCopyWith<_$_PublisherQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Publisher _$PublisherFromJson(Map<String, dynamic> json) {
  return _Publisher.fromJson(json);
}

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
      _$PublisherCopyWithImpl<$Res, Publisher>;
  @useResult
  $Res call({String name, List<Book> books});
}

/// @nodoc
class _$PublisherCopyWithImpl<$Res, $Val extends Publisher>
    implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublisherCopyWith<$Res> implements $PublisherCopyWith<$Res> {
  factory _$$_PublisherCopyWith(
          _$_Publisher value, $Res Function(_$_Publisher) then) =
      __$$_PublisherCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Book> books});
}

/// @nodoc
class __$$_PublisherCopyWithImpl<$Res>
    extends _$PublisherCopyWithImpl<$Res, _$_Publisher>
    implements _$$_PublisherCopyWith<$Res> {
  __$$_PublisherCopyWithImpl(
      _$_Publisher _value, $Res Function(_$_Publisher) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? books = null,
  }) {
    return _then(_$_Publisher(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Publisher with DiagnosticableTreeMixin implements _Publisher {
  _$_Publisher({required this.name, final List<Book> books = const []})
      : _books = books;

  factory _$_Publisher.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherFromJson(json);

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
            other is _$_Publisher &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublisherCopyWith<_$_Publisher> get copyWith =>
      __$$_PublisherCopyWithImpl<_$_Publisher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublisherToJson(
      this,
    );
  }
}

abstract class _Publisher implements Publisher {
  factory _Publisher({required final String name, final List<Book> books}) =
      _$_Publisher;

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
  _$$_PublisherCopyWith<_$_Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectQueryResult _$SubjectQueryResultFromJson(Map<String, dynamic> json) {
  return _SubjectQueryResult.fromJson(json);
}

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
      _$SubjectQueryResultCopyWithImpl<$Res, SubjectQueryResult>;
  @useResult
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class _$SubjectQueryResultCopyWithImpl<$Res, $Val extends SubjectQueryResult>
    implements $SubjectQueryResultCopyWith<$Res> {
  _$SubjectQueryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? subjects = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectQueryResultCopyWith<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  factory _$$_SubjectQueryResultCopyWith(_$_SubjectQueryResult value,
          $Res Function(_$_SubjectQueryResult) then) =
      __$$_SubjectQueryResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<String> subjects});
}

/// @nodoc
class __$$_SubjectQueryResultCopyWithImpl<$Res>
    extends _$SubjectQueryResultCopyWithImpl<$Res, _$_SubjectQueryResult>
    implements _$$_SubjectQueryResultCopyWith<$Res> {
  __$$_SubjectQueryResultCopyWithImpl(
      _$_SubjectQueryResult _value, $Res Function(_$_SubjectQueryResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? subjects = null,
  }) {
    return _then(_$_SubjectQueryResult(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjects: null == subjects
          ? _value._subjects
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
  _$_SubjectQueryResult(
      {required this.total, final List<String> subjects = const []})
      : _subjects = subjects;

  factory _$_SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectQueryResultFromJson(json);

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
            other is _$_SubjectQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_subjects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectQueryResultCopyWith<_$_SubjectQueryResult> get copyWith =>
      __$$_SubjectQueryResultCopyWithImpl<_$_SubjectQueryResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectQueryResultToJson(
      this,
    );
  }
}

abstract class _SubjectQueryResult implements SubjectQueryResult {
  factory _SubjectQueryResult(
      {required final int total,
      final List<String> subjects}) = _$_SubjectQueryResult;

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
  _$$_SubjectQueryResultCopyWith<_$_SubjectQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

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
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subject, List<Book> books});
}

/// @nodoc
class __$$_SubjectCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$_Subject>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? books = null,
  }) {
    return _then(_$_Subject(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subject with DiagnosticableTreeMixin implements _Subject {
  _$_Subject({required this.subject, final List<Book> books = const []})
      : _books = books;

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

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
            other is _$_Subject &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, subject, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      __$$_SubjectCopyWithImpl<_$_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  factory _Subject({required final String subject, final List<Book> books}) =
      _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override

  /// The subject
  String get subject;
  @override

  /// The list of the books matching this subject
  List<Book> get books;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}

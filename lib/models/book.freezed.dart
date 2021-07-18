// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {required String title,
      @JsonKey(name: 'title_long') String? titleLong,
      required String isbn,
      required String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String>? authors,
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

  Book fromJson(Map<String, Object> json) {
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
  @DateConverter()
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
  @MsrpConverter()
  double? get msrp => throw _privateConstructorUsedError;

  /// Excerpt of the book
  String? get excerpt => throw _privateConstructorUsedError;

  /// Synopsys of the book
  String? get synopsys => throw _privateConstructorUsedError;

  /// List of the authors of the book
  List<String>? get authors => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'title_long') String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String>? authors,
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
              as List<String>?,
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
      @JsonKey(name: 'title_long') String? titleLong,
      String isbn,
      String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String>? authors,
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
              as List<String>?,
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

@JsonSerializable()

/// @nodoc
class _$_Book implements _Book {
  _$_Book(
      {required this.title,
      @JsonKey(name: 'title_long') this.titleLong,
      required this.isbn,
      required this.isbn13,
      @JsonKey(name: 'dewey_decimal') this.deweyDecimal,
      this.binding,
      this.publisher,
      this.language,
      @DateConverter() @JsonKey(name: 'date_published') this.datePublished,
      this.edition,
      this.pages,
      this.dimensions,
      this.overview,
      this.image,
      @MsrpConverter() this.msrp,
      this.excerpt,
      this.synopsys,
      this.authors,
      this.subjects,
      this.reviews,
      this.prices,
      this.related});

  factory _$_Book.fromJson(Map<String, dynamic> json) =>
      _$_$_BookFromJson(json);

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
  @DateConverter()
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
  @MsrpConverter()
  final double? msrp;
  @override

  /// Excerpt of the book
  final String? excerpt;
  @override

  /// Synopsys of the book
  final String? synopsys;
  @override

  /// List of the authors of the book
  final List<String>? authors;
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
  String toString() {
    return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Book &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.titleLong, titleLong) ||
                const DeepCollectionEquality()
                    .equals(other.titleLong, titleLong)) &&
            (identical(other.isbn, isbn) ||
                const DeepCollectionEquality().equals(other.isbn, isbn)) &&
            (identical(other.isbn13, isbn13) ||
                const DeepCollectionEquality().equals(other.isbn13, isbn13)) &&
            (identical(other.deweyDecimal, deweyDecimal) ||
                const DeepCollectionEquality()
                    .equals(other.deweyDecimal, deweyDecimal)) &&
            (identical(other.binding, binding) ||
                const DeepCollectionEquality()
                    .equals(other.binding, binding)) &&
            (identical(other.publisher, publisher) ||
                const DeepCollectionEquality()
                    .equals(other.publisher, publisher)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.datePublished, datePublished) ||
                const DeepCollectionEquality()
                    .equals(other.datePublished, datePublished)) &&
            (identical(other.edition, edition) ||
                const DeepCollectionEquality()
                    .equals(other.edition, edition)) &&
            (identical(other.pages, pages) ||
                const DeepCollectionEquality().equals(other.pages, pages)) &&
            (identical(other.dimensions, dimensions) ||
                const DeepCollectionEquality()
                    .equals(other.dimensions, dimensions)) &&
            (identical(other.overview, overview) ||
                const DeepCollectionEquality()
                    .equals(other.overview, overview)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.msrp, msrp) ||
                const DeepCollectionEquality().equals(other.msrp, msrp)) &&
            (identical(other.excerpt, excerpt) ||
                const DeepCollectionEquality()
                    .equals(other.excerpt, excerpt)) &&
            (identical(other.synopsys, synopsys) ||
                const DeepCollectionEquality()
                    .equals(other.synopsys, synopsys)) &&
            (identical(other.authors, authors) ||
                const DeepCollectionEquality()
                    .equals(other.authors, authors)) &&
            (identical(other.subjects, subjects) ||
                const DeepCollectionEquality()
                    .equals(other.subjects, subjects)) &&
            (identical(other.reviews, reviews) ||
                const DeepCollectionEquality()
                    .equals(other.reviews, reviews)) &&
            (identical(other.prices, prices) ||
                const DeepCollectionEquality().equals(other.prices, prices)) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(other.related, related)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(titleLong) ^
      const DeepCollectionEquality().hash(isbn) ^
      const DeepCollectionEquality().hash(isbn13) ^
      const DeepCollectionEquality().hash(deweyDecimal) ^
      const DeepCollectionEquality().hash(binding) ^
      const DeepCollectionEquality().hash(publisher) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(datePublished) ^
      const DeepCollectionEquality().hash(edition) ^
      const DeepCollectionEquality().hash(pages) ^
      const DeepCollectionEquality().hash(dimensions) ^
      const DeepCollectionEquality().hash(overview) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(msrp) ^
      const DeepCollectionEquality().hash(excerpt) ^
      const DeepCollectionEquality().hash(synopsys) ^
      const DeepCollectionEquality().hash(authors) ^
      const DeepCollectionEquality().hash(subjects) ^
      const DeepCollectionEquality().hash(reviews) ^
      const DeepCollectionEquality().hash(prices) ^
      const DeepCollectionEquality().hash(related);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookToJson(this);
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required String title,
      @JsonKey(name: 'title_long') String? titleLong,
      required String isbn,
      required String isbn13,
      @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
      String? binding,
      String? publisher,
      String? language,
      @DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,
      String? edition,
      int? pages,
      String? dimensions,
      String? overview,
      String? image,
      @MsrpConverter() double? msrp,
      String? excerpt,
      String? synopsys,
      List<String>? authors,
      List<String>? subjects,
      List<String>? reviews,
      List<Merchant>? prices,
      List<String>? related}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override

  /// Title of the book
  String get title => throw _privateConstructorUsedError;
  @override

  /// Long version of the title
  @JsonKey(name: 'title_long')
  String? get titleLong => throw _privateConstructorUsedError;
  @override

  /// ISBN of the book
  String get isbn => throw _privateConstructorUsedError;
  @override

  /// New 13-digit ISBN
  String get isbn13 => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'dewey_decimal')
  String? get deweyDecimal => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  String? get binding => throw _privateConstructorUsedError;
  @override

  /// The name of the publisher
  String? get publisher => throw _privateConstructorUsedError;
  @override

  /// Language of the book
  String? get language => throw _privateConstructorUsedError;
  @override

  /// Date when the book was published. Can be a year or a full date.
  @DateConverter()
  @JsonKey(name: 'date_published')
  DateTime? get datePublished => throw _privateConstructorUsedError;
  @override

  /// Details about the edition
  String? get edition => throw _privateConstructorUsedError;
  @override

  /// Number of pages of the book
  int? get pages => throw _privateConstructorUsedError;
  @override

  /// Dimensions of the book
  String? get dimensions => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  String? get overview => throw _privateConstructorUsedError;
  @override

  /// URL of the cover
  String? get image => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  @MsrpConverter()
  double? get msrp => throw _privateConstructorUsedError;
  @override

  /// Excerpt of the book
  String? get excerpt => throw _privateConstructorUsedError;
  @override

  /// Synopsys of the book
  String? get synopsys => throw _privateConstructorUsedError;
  @override

  /// List of the authors of the book
  List<String>? get authors => throw _privateConstructorUsedError;
  @override

  /// List of the subjects of the book
  List<String>? get subjects => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  List<String>? get reviews => throw _privateConstructorUsedError;
  @override

  /// List of the merchants selling this book with real-time prices
  List<Merchant>? get prices => throw _privateConstructorUsedError;
  @override

  /// Not documented in the official API
  List<String>? get related => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'book_query_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  BookQueryResult fromJson(Map<String, Object> json) {
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

@JsonSerializable()

/// @nodoc
class _$_BookQueryResult implements _BookQueryResult {
  _$_BookQueryResult({required this.total, this.books = const []});

  factory _$_BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$_$_BookQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey(defaultValue: const [])
  @override

  /// The list of the books matching the query
  final List<Book> books;

  @override
  String toString() {
    return 'BookQueryResult(total: $total, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookQueryResult &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  _$BookQueryResultCopyWith<_BookQueryResult> get copyWith =>
      __$BookQueryResultCopyWithImpl<_BookQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookQueryResultToJson(this);
  }
}

abstract class _BookQueryResult implements BookQueryResult {
  factory _BookQueryResult({required int total, List<Book> books}) =
      _$_BookQueryResult;

  factory _BookQueryResult.fromJson(Map<String, dynamic> json) =
      _$_BookQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;
  @override

  /// The list of the books matching the query
  List<Book> get books => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookQueryResultCopyWith<_BookQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'author_query_results.dart';

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

  AuthorQueryResult fromJson(Map<String, Object> json) {
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

@JsonSerializable()

/// @nodoc
class _$_AuthorQueryResult implements _AuthorQueryResult {
  _$_AuthorQueryResult({required this.total, this.authors = const []});

  factory _$_AuthorQueryResult.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthorQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey(defaultValue: const [])
  @override

  /// The list of the authors matching the query
  final List<String> authors;

  @override
  String toString() {
    return 'AuthorQueryResult(total: $total, authors: $authors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthorQueryResult &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.authors, authors) ||
                const DeepCollectionEquality().equals(other.authors, authors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(authors);

  @JsonKey(ignore: true)
  @override
  _$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith =>
      __$AuthorQueryResultCopyWithImpl<_AuthorQueryResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthorQueryResultToJson(this);
  }
}

abstract class _AuthorQueryResult implements AuthorQueryResult {
  factory _AuthorQueryResult({required int total, List<String> authors}) =
      _$_AuthorQueryResult;

  factory _AuthorQueryResult.fromJson(Map<String, dynamic> json) =
      _$_AuthorQueryResult.fromJson;

  @override

  /// The number of results for this query
  int get total => throw _privateConstructorUsedError;
  @override

  /// The list of the authors matching the query
  List<String> get authors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

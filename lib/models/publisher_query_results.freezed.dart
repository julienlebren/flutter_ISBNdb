// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'publisher_query_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
class _$_PublisherQueryResult implements _PublisherQueryResult {
  _$_PublisherQueryResult({required this.total, this.publishers = const []});

  factory _$_PublisherQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey(defaultValue: const [])
  @override

  /// The list of the publishers matching the query
  final List<String> publishers;

  @override
  String toString() {
    return 'PublisherQueryResult(total: $total, publishers: $publishers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublisherQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other.publishers, publishers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(publishers));

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

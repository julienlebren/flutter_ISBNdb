// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subject_query_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
class _$_SubjectQueryResult implements _SubjectQueryResult {
  _$_SubjectQueryResult({required this.total, this.subjects = const []});

  factory _$_SubjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectQueryResultFromJson(json);

  @override

  /// The number of results for this query
  final int total;
  @JsonKey(defaultValue: const [])
  @override

  /// The list of the subjects matching the query
  final List<String> subjects;

  @override
  String toString() {
    return 'SubjectQueryResult(total: $total, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubjectQueryResult &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(subjects));

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

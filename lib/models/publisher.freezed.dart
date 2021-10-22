// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'publisher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
class _$_Publisher implements _Publisher {
  _$_Publisher({required this.name, this.books = const []});

  factory _$_Publisher.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherFromJson(json);

  @override

  /// The name of this publisher
  final String name;
  @JsonKey(defaultValue: const [])
  @override

  /// The list of the books this publisher published
  final List<Book> books;

  @override
  String toString() {
    return 'Publisher(name: $name, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Publisher &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(books));

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

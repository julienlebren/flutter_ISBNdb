// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
 int get total;/// The list of the authors matching the query
@JsonKey(readValue: _readAuthorNames) List<String> get authors;
/// Create a copy of AuthorQueryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorQueryResultCopyWith<AuthorQueryResult> get copyWith => _$AuthorQueryResultCopyWithImpl<AuthorQueryResult>(this as AuthorQueryResult, _$identity);

  /// Serializes this AuthorQueryResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthorQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('authors', authors));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.authors, authors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(authors));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthorQueryResult(total: $total, authors: $authors)';
}


}

/// @nodoc
abstract mixin class $AuthorQueryResultCopyWith<$Res>  {
  factory $AuthorQueryResultCopyWith(AuthorQueryResult value, $Res Function(AuthorQueryResult) _then) = _$AuthorQueryResultCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(readValue: _readAuthorNames) List<String> authors
});




}
/// @nodoc
class _$AuthorQueryResultCopyWithImpl<$Res>
    implements $AuthorQueryResultCopyWith<$Res> {
  _$AuthorQueryResultCopyWithImpl(this._self, this._then);

  final AuthorQueryResult _self;
  final $Res Function(AuthorQueryResult) _then;

/// Create a copy of AuthorQueryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? authors = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorQueryResult].
extension AuthorQueryResultPatterns on AuthorQueryResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorQueryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorQueryResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorQueryResult value)  $default,){
final _that = this;
switch (_that) {
case _AuthorQueryResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorQueryResult value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorQueryResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readAuthorNames)  List<String> authors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorQueryResult() when $default != null:
return $default(_that.total,_that.authors);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readAuthorNames)  List<String> authors)  $default,) {final _that = this;
switch (_that) {
case _AuthorQueryResult():
return $default(_that.total,_that.authors);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(readValue: _readAuthorNames)  List<String> authors)?  $default,) {final _that = this;
switch (_that) {
case _AuthorQueryResult() when $default != null:
return $default(_that.total,_that.authors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthorQueryResult with DiagnosticableTreeMixin implements AuthorQueryResult {
   _AuthorQueryResult({required this.total, @JsonKey(readValue: _readAuthorNames) final  List<String> authors = const []}): _authors = authors;
  factory _AuthorQueryResult.fromJson(Map<String, dynamic> json) => _$AuthorQueryResultFromJson(json);

/// The number of results for this query
@override final  int total;
/// The list of the authors matching the query
 final  List<String> _authors;
/// The list of the authors matching the query
@override@JsonKey(readValue: _readAuthorNames) List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}


/// Create a copy of AuthorQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorQueryResultCopyWith<_AuthorQueryResult> get copyWith => __$AuthorQueryResultCopyWithImpl<_AuthorQueryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorQueryResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthorQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('authors', authors));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._authors, _authors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_authors));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthorQueryResult(total: $total, authors: $authors)';
}


}

/// @nodoc
abstract mixin class _$AuthorQueryResultCopyWith<$Res> implements $AuthorQueryResultCopyWith<$Res> {
  factory _$AuthorQueryResultCopyWith(_AuthorQueryResult value, $Res Function(_AuthorQueryResult) _then) = __$AuthorQueryResultCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(readValue: _readAuthorNames) List<String> authors
});




}
/// @nodoc
class __$AuthorQueryResultCopyWithImpl<$Res>
    implements _$AuthorQueryResultCopyWith<$Res> {
  __$AuthorQueryResultCopyWithImpl(this._self, this._then);

  final _AuthorQueryResult _self;
  final $Res Function(_AuthorQueryResult) _then;

/// Create a copy of AuthorQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? authors = null,}) {
  return _then(_AuthorQueryResult(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Author implements DiagnosticableTreeMixin {

/// The name of the author
 String get author;/// The list of the books this author published
@JsonKey(readValue: _readAuthorBooks) List<Book> get books;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Author'))
    ..add(DiagnosticsProperty('author', author))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,const DeepCollectionEquality().hash(books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Author(author: $author, books: $books)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 String author,@JsonKey(readValue: _readAuthorBooks) List<Book> books
});




}
/// @nodoc
class _$AuthorCopyWithImpl<$Res>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? books = null,}) {
  return _then(_self.copyWith(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}

}


/// Adds pattern-matching-related methods to [Author].
extension AuthorPatterns on Author {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Author value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Author value)  $default,){
final _that = this;
switch (_that) {
case _Author():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Author value)?  $default,){
final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author, @JsonKey(readValue: _readAuthorBooks)  List<Book> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.author,_that.books);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author, @JsonKey(readValue: _readAuthorBooks)  List<Book> books)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.author,_that.books);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author, @JsonKey(readValue: _readAuthorBooks)  List<Book> books)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.author,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Author with DiagnosticableTreeMixin implements Author {
   _Author({required this.author, @JsonKey(readValue: _readAuthorBooks) final  List<Book> books = const []}): _books = books;
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

/// The name of the author
@override final  String author;
/// The list of the books this author published
 final  List<Book> _books;
/// The list of the books this author published
@override@JsonKey(readValue: _readAuthorBooks) List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorCopyWith<_Author> get copyWith => __$AuthorCopyWithImpl<_Author>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Author'))
    ..add(DiagnosticsProperty('author', author))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,const DeepCollectionEquality().hash(_books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Author(author: $author, books: $books)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 String author,@JsonKey(readValue: _readAuthorBooks) List<Book> books
});




}
/// @nodoc
class __$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? books = null,}) {
  return _then(_Author(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}


/// @nodoc
mixin _$BookQueryResult implements DiagnosticableTreeMixin {

/// The number of results for this query
 int get total;/// The list of the books matching the query
@JsonKey(readValue: _readBookQueryBooks) List<Book> get books;/// The page returned by a paginated book search
@JsonKey(includeIfNull: false) int? get page;/// The page size returned by a paginated book search
@JsonKey(name: 'page_size', includeIfNull: false) int? get pageSize;
/// Create a copy of BookQueryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookQueryResultCopyWith<BookQueryResult> get copyWith => _$BookQueryResultCopyWithImpl<BookQueryResult>(this as BookQueryResult, _$identity);

  /// Serializes this BookQueryResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BookQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(books),page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BookQueryResult(total: $total, books: $books, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $BookQueryResultCopyWith<$Res>  {
  factory $BookQueryResultCopyWith(BookQueryResult value, $Res Function(BookQueryResult) _then) = _$BookQueryResultCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(readValue: _readBookQueryBooks) List<Book> books,@JsonKey(includeIfNull: false) int? page,@JsonKey(name: 'page_size', includeIfNull: false) int? pageSize
});




}
/// @nodoc
class _$BookQueryResultCopyWithImpl<$Res>
    implements $BookQueryResultCopyWith<$Res> {
  _$BookQueryResultCopyWithImpl(this._self, this._then);

  final BookQueryResult _self;
  final $Res Function(BookQueryResult) _then;

/// Create a copy of BookQueryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? books = null,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookQueryResult].
extension BookQueryResultPatterns on BookQueryResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookQueryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookQueryResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookQueryResult value)  $default,){
final _that = this;
switch (_that) {
case _BookQueryResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookQueryResult value)?  $default,){
final _that = this;
switch (_that) {
case _BookQueryResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readBookQueryBooks)  List<Book> books, @JsonKey(includeIfNull: false)  int? page, @JsonKey(name: 'page_size', includeIfNull: false)  int? pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookQueryResult() when $default != null:
return $default(_that.total,_that.books,_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readBookQueryBooks)  List<Book> books, @JsonKey(includeIfNull: false)  int? page, @JsonKey(name: 'page_size', includeIfNull: false)  int? pageSize)  $default,) {final _that = this;
switch (_that) {
case _BookQueryResult():
return $default(_that.total,_that.books,_that.page,_that.pageSize);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(readValue: _readBookQueryBooks)  List<Book> books, @JsonKey(includeIfNull: false)  int? page, @JsonKey(name: 'page_size', includeIfNull: false)  int? pageSize)?  $default,) {final _that = this;
switch (_that) {
case _BookQueryResult() when $default != null:
return $default(_that.total,_that.books,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookQueryResult with DiagnosticableTreeMixin implements BookQueryResult {
   _BookQueryResult({required this.total, @JsonKey(readValue: _readBookQueryBooks) final  List<Book> books = const [], @JsonKey(includeIfNull: false) this.page, @JsonKey(name: 'page_size', includeIfNull: false) this.pageSize}): _books = books;
  factory _BookQueryResult.fromJson(Map<String, dynamic> json) => _$BookQueryResultFromJson(json);

/// The number of results for this query
@override final  int total;
/// The list of the books matching the query
 final  List<Book> _books;
/// The list of the books matching the query
@override@JsonKey(readValue: _readBookQueryBooks) List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

/// The page returned by a paginated book search
@override@JsonKey(includeIfNull: false) final  int? page;
/// The page size returned by a paginated book search
@override@JsonKey(name: 'page_size', includeIfNull: false) final  int? pageSize;

/// Create a copy of BookQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookQueryResultCopyWith<_BookQueryResult> get copyWith => __$BookQueryResultCopyWithImpl<_BookQueryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookQueryResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BookQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_books),page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BookQueryResult(total: $total, books: $books, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$BookQueryResultCopyWith<$Res> implements $BookQueryResultCopyWith<$Res> {
  factory _$BookQueryResultCopyWith(_BookQueryResult value, $Res Function(_BookQueryResult) _then) = __$BookQueryResultCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(readValue: _readBookQueryBooks) List<Book> books,@JsonKey(includeIfNull: false) int? page,@JsonKey(name: 'page_size', includeIfNull: false) int? pageSize
});




}
/// @nodoc
class __$BookQueryResultCopyWithImpl<$Res>
    implements _$BookQueryResultCopyWith<$Res> {
  __$BookQueryResultCopyWithImpl(this._self, this._then);

  final _BookQueryResult _self;
  final $Res Function(_BookQueryResult) _then;

/// Create a copy of BookQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? books = null,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(_BookQueryResult(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Book implements DiagnosticableTreeMixin {

/// Title of the book
 String get title;/// Long version of the title
@JsonKey(name: 'title_long') String? get titleLong;/// ISBN of the book
 String get isbn;/// New 13-digit ISBN
 String get isbn13;/// Not documented in the official API
@_DeweyDecimalConverter()@JsonKey(name: 'dewey_decimal') String? get deweyDecimal;/// Not documented in the official API
 String? get binding;/// The name of the publisher
 String? get publisher;/// Language of the book
/// ISO 639-3 language code or regional tag (pt-br, fr-ca, zh-tw, es-419).
 String? get language;/// Date when the book was published.
///
/// Partial API values are normalized to the start of their period: a year
/// becomes January 1st and a year-month becomes the first day of the month.
@_DateConverter()@JsonKey(name: 'date_published') DateTime? get datePublished;/// Edition of the book as a string.
@Deprecated('Use editionNumber instead.') String? get edition;/// Numeric edition of the book.
@JsonKey(name: 'edition_number') int? get editionNumber;/// Number of pages of the book
 int? get pages;/// Dimensions of the book
 String? get dimensions;/// Not documented in the official API
 String? get overview;/// URL of the cover, up to 450 pixels high. May be a placeholder.
 String? get image;/// Manufacturer's suggested retail price in USD.
@Deprecated('Use listPrice instead.')@_MsrpConverter() double? get msrp;/// List price of the book with its currency.
@JsonKey(name: 'list_price') ListPrice? get listPrice;/// Excerpt of the book. Deprecated by ISBNdb without a replacement.
@Deprecated('Deprecated by ISBNdb without a replacement.') String? get excerpt;/// Synopsys of the book
 String? get synopsys;/// List of the authors of the book
@JsonKey(readValue: _readBookAuthors) List<String?>? get authors;/// Legacy subjects, scheduled for removal by ISBNdb. Use [thema] instead.
@Deprecated('Use thema instead.')@JsonKey(readValue: _readBookSubjects) List<String>? get subjects;/// Not documented in the official API
@JsonKey(readValue: _readBookReviews) List<String>? get reviews;/// List of the merchants selling this book with real-time prices
 List<Merchant>? get prices;/// Not documented in the official API
@JsonKey(readValue: _readBookRelated) List<String>? get related;/// Thema subjects and qualifiers; the main subject is first, when present.
 List<ThemaEntry>? get thema;/// Genres of the book, most relevant first.
/// `Children` and `Young adult` mark books for young readers.
/// Null when the API omits genres or cannot derive them.
 List<String>? get genres;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Book'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('titleLong', titleLong))..add(DiagnosticsProperty('isbn', isbn))..add(DiagnosticsProperty('isbn13', isbn13))..add(DiagnosticsProperty('deweyDecimal', deweyDecimal))..add(DiagnosticsProperty('binding', binding))..add(DiagnosticsProperty('publisher', publisher))..add(DiagnosticsProperty('language', language))..add(DiagnosticsProperty('datePublished', datePublished))..add(DiagnosticsProperty('edition', edition))..add(DiagnosticsProperty('editionNumber', editionNumber))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('dimensions', dimensions))..add(DiagnosticsProperty('overview', overview))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('msrp', msrp))..add(DiagnosticsProperty('listPrice', listPrice))..add(DiagnosticsProperty('excerpt', excerpt))..add(DiagnosticsProperty('synopsys', synopsys))..add(DiagnosticsProperty('authors', authors))..add(DiagnosticsProperty('subjects', subjects))..add(DiagnosticsProperty('reviews', reviews))..add(DiagnosticsProperty('prices', prices))..add(DiagnosticsProperty('related', related))..add(DiagnosticsProperty('thema', thema))..add(DiagnosticsProperty('genres', genres));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.title, title) || other.title == title)&&(identical(other.titleLong, titleLong) || other.titleLong == titleLong)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.deweyDecimal, deweyDecimal) || other.deweyDecimal == deweyDecimal)&&(identical(other.binding, binding) || other.binding == binding)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.language, language) || other.language == language)&&(identical(other.datePublished, datePublished) || other.datePublished == datePublished)&&(identical(other.edition, edition) || other.edition == edition)&&(identical(other.editionNumber, editionNumber) || other.editionNumber == editionNumber)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.image, image) || other.image == image)&&(identical(other.msrp, msrp) || other.msrp == msrp)&&(identical(other.listPrice, listPrice) || other.listPrice == listPrice)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.synopsys, synopsys) || other.synopsys == synopsys)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.subjects, subjects)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&const DeepCollectionEquality().equals(other.prices, prices)&&const DeepCollectionEquality().equals(other.related, related)&&const DeepCollectionEquality().equals(other.thema, thema)&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,titleLong,isbn,isbn13,deweyDecimal,binding,publisher,language,datePublished,edition,editionNumber,pages,dimensions,overview,image,msrp,listPrice,excerpt,synopsys,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(subjects),const DeepCollectionEquality().hash(reviews),const DeepCollectionEquality().hash(prices),const DeepCollectionEquality().hash(related),const DeepCollectionEquality().hash(thema),const DeepCollectionEquality().hash(genres)]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, editionNumber: $editionNumber, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, listPrice: $listPrice, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related, thema: $thema, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String title,@JsonKey(name: 'title_long') String? titleLong, String isbn, String isbn13,@_DeweyDecimalConverter()@JsonKey(name: 'dewey_decimal') String? deweyDecimal, String? binding, String? publisher, String? language,@_DateConverter()@JsonKey(name: 'date_published') DateTime? datePublished,@Deprecated('Use editionNumber instead.') String? edition,@JsonKey(name: 'edition_number') int? editionNumber, int? pages, String? dimensions, String? overview, String? image,@Deprecated('Use listPrice instead.')@_MsrpConverter() double? msrp,@JsonKey(name: 'list_price') ListPrice? listPrice,@Deprecated('Deprecated by ISBNdb without a replacement.') String? excerpt, String? synopsys,@JsonKey(readValue: _readBookAuthors) List<String?>? authors,@Deprecated('Use thema instead.')@JsonKey(readValue: _readBookSubjects) List<String>? subjects,@JsonKey(readValue: _readBookReviews) List<String>? reviews, List<Merchant>? prices,@JsonKey(readValue: _readBookRelated) List<String>? related, List<ThemaEntry>? thema, List<String>? genres
});


$ListPriceCopyWith<$Res>? get listPrice;

}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? titleLong = freezed,Object? isbn = null,Object? isbn13 = null,Object? deweyDecimal = freezed,Object? binding = freezed,Object? publisher = freezed,Object? language = freezed,Object? datePublished = freezed,Object? edition = freezed,Object? editionNumber = freezed,Object? pages = freezed,Object? dimensions = freezed,Object? overview = freezed,Object? image = freezed,Object? msrp = freezed,Object? listPrice = freezed,Object? excerpt = freezed,Object? synopsys = freezed,Object? authors = freezed,Object? subjects = freezed,Object? reviews = freezed,Object? prices = freezed,Object? related = freezed,Object? thema = freezed,Object? genres = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleLong: freezed == titleLong ? _self.titleLong : titleLong // ignore: cast_nullable_to_non_nullable
as String?,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,deweyDecimal: freezed == deweyDecimal ? _self.deweyDecimal : deweyDecimal // ignore: cast_nullable_to_non_nullable
as String?,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,datePublished: freezed == datePublished ? _self.datePublished : datePublished // ignore: cast_nullable_to_non_nullable
as DateTime?,edition: freezed == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String?,editionNumber: freezed == editionNumber ? _self.editionNumber : editionNumber // ignore: cast_nullable_to_non_nullable
as int?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,dimensions: freezed == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,msrp: freezed == msrp ? _self.msrp : msrp // ignore: cast_nullable_to_non_nullable
as double?,listPrice: freezed == listPrice ? _self.listPrice : listPrice // ignore: cast_nullable_to_non_nullable
as ListPrice?,excerpt: freezed == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String?,synopsys: freezed == synopsys ? _self.synopsys : synopsys // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String?>?,subjects: freezed == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,reviews: freezed == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<String>?,prices: freezed == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<Merchant>?,related: freezed == related ? _self.related : related // ignore: cast_nullable_to_non_nullable
as List<String>?,thema: freezed == thema ? _self.thema : thema // ignore: cast_nullable_to_non_nullable
as List<ThemaEntry>?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListPriceCopyWith<$Res>? get listPrice {
    if (_self.listPrice == null) {
    return null;
  }

  return $ListPriceCopyWith<$Res>(_self.listPrice!, (value) {
    return _then(_self.copyWith(listPrice: value));
  });
}
}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book extends Book with DiagnosticableTreeMixin {
   _Book({required this.title, @JsonKey(name: 'title_long') this.titleLong, required this.isbn, required this.isbn13, @_DeweyDecimalConverter()@JsonKey(name: 'dewey_decimal') this.deweyDecimal, this.binding, this.publisher, this.language, @_DateConverter()@JsonKey(name: 'date_published') this.datePublished, @Deprecated('Use editionNumber instead.') this.edition, @JsonKey(name: 'edition_number') this.editionNumber, this.pages, this.dimensions, this.overview, this.image, @Deprecated('Use listPrice instead.')@_MsrpConverter() this.msrp, @JsonKey(name: 'list_price') this.listPrice, @Deprecated('Deprecated by ISBNdb without a replacement.') this.excerpt, this.synopsys, @JsonKey(readValue: _readBookAuthors) final  List<String?>? authors, @Deprecated('Use thema instead.')@JsonKey(readValue: _readBookSubjects) final  List<String>? subjects, @JsonKey(readValue: _readBookReviews) final  List<String>? reviews, final  List<Merchant>? prices, @JsonKey(readValue: _readBookRelated) final  List<String>? related, final  List<ThemaEntry>? thema, final  List<String>? genres}): _authors = authors,_subjects = subjects,_reviews = reviews,_prices = prices,_related = related,_thema = thema,_genres = genres,super._();
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

/// Title of the book
@override final  String title;
/// Long version of the title
@override@JsonKey(name: 'title_long') final  String? titleLong;
/// ISBN of the book
@override final  String isbn;
/// New 13-digit ISBN
@override final  String isbn13;
/// Not documented in the official API
@override@_DeweyDecimalConverter()@JsonKey(name: 'dewey_decimal') final  String? deweyDecimal;
/// Not documented in the official API
@override final  String? binding;
/// The name of the publisher
@override final  String? publisher;
/// Language of the book
/// ISO 639-3 language code or regional tag (pt-br, fr-ca, zh-tw, es-419).
@override final  String? language;
/// Date when the book was published.
///
/// Partial API values are normalized to the start of their period: a year
/// becomes January 1st and a year-month becomes the first day of the month.
@override@_DateConverter()@JsonKey(name: 'date_published') final  DateTime? datePublished;
/// Edition of the book as a string.
@override@Deprecated('Use editionNumber instead.') final  String? edition;
/// Numeric edition of the book.
@override@JsonKey(name: 'edition_number') final  int? editionNumber;
/// Number of pages of the book
@override final  int? pages;
/// Dimensions of the book
@override final  String? dimensions;
/// Not documented in the official API
@override final  String? overview;
/// URL of the cover, up to 450 pixels high. May be a placeholder.
@override final  String? image;
/// Manufacturer's suggested retail price in USD.
@override@Deprecated('Use listPrice instead.')@_MsrpConverter() final  double? msrp;
/// List price of the book with its currency.
@override@JsonKey(name: 'list_price') final  ListPrice? listPrice;
/// Excerpt of the book. Deprecated by ISBNdb without a replacement.
@override@Deprecated('Deprecated by ISBNdb without a replacement.') final  String? excerpt;
/// Synopsys of the book
@override final  String? synopsys;
/// List of the authors of the book
 final  List<String?>? _authors;
/// List of the authors of the book
@override@JsonKey(readValue: _readBookAuthors) List<String?>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Legacy subjects, scheduled for removal by ISBNdb. Use [thema] instead.
 final  List<String>? _subjects;
/// Legacy subjects, scheduled for removal by ISBNdb. Use [thema] instead.
@override@Deprecated('Use thema instead.')@JsonKey(readValue: _readBookSubjects) List<String>? get subjects {
  final value = _subjects;
  if (value == null) return null;
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Not documented in the official API
 final  List<String>? _reviews;
/// Not documented in the official API
@override@JsonKey(readValue: _readBookReviews) List<String>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// List of the merchants selling this book with real-time prices
 final  List<Merchant>? _prices;
/// List of the merchants selling this book with real-time prices
@override List<Merchant>? get prices {
  final value = _prices;
  if (value == null) return null;
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Not documented in the official API
 final  List<String>? _related;
/// Not documented in the official API
@override@JsonKey(readValue: _readBookRelated) List<String>? get related {
  final value = _related;
  if (value == null) return null;
  if (_related is EqualUnmodifiableListView) return _related;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Thema subjects and qualifiers; the main subject is first, when present.
 final  List<ThemaEntry>? _thema;
/// Thema subjects and qualifiers; the main subject is first, when present.
@override List<ThemaEntry>? get thema {
  final value = _thema;
  if (value == null) return null;
  if (_thema is EqualUnmodifiableListView) return _thema;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Genres of the book, most relevant first.
/// `Children` and `Young adult` mark books for young readers.
/// Null when the API omits genres or cannot derive them.
 final  List<String>? _genres;
/// Genres of the book, most relevant first.
/// `Children` and `Young adult` mark books for young readers.
/// Null when the API omits genres or cannot derive them.
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Book'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('titleLong', titleLong))..add(DiagnosticsProperty('isbn', isbn))..add(DiagnosticsProperty('isbn13', isbn13))..add(DiagnosticsProperty('deweyDecimal', deweyDecimal))..add(DiagnosticsProperty('binding', binding))..add(DiagnosticsProperty('publisher', publisher))..add(DiagnosticsProperty('language', language))..add(DiagnosticsProperty('datePublished', datePublished))..add(DiagnosticsProperty('edition', edition))..add(DiagnosticsProperty('editionNumber', editionNumber))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('dimensions', dimensions))..add(DiagnosticsProperty('overview', overview))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('msrp', msrp))..add(DiagnosticsProperty('listPrice', listPrice))..add(DiagnosticsProperty('excerpt', excerpt))..add(DiagnosticsProperty('synopsys', synopsys))..add(DiagnosticsProperty('authors', authors))..add(DiagnosticsProperty('subjects', subjects))..add(DiagnosticsProperty('reviews', reviews))..add(DiagnosticsProperty('prices', prices))..add(DiagnosticsProperty('related', related))..add(DiagnosticsProperty('thema', thema))..add(DiagnosticsProperty('genres', genres));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.title, title) || other.title == title)&&(identical(other.titleLong, titleLong) || other.titleLong == titleLong)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.deweyDecimal, deweyDecimal) || other.deweyDecimal == deweyDecimal)&&(identical(other.binding, binding) || other.binding == binding)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.language, language) || other.language == language)&&(identical(other.datePublished, datePublished) || other.datePublished == datePublished)&&(identical(other.edition, edition) || other.edition == edition)&&(identical(other.editionNumber, editionNumber) || other.editionNumber == editionNumber)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.image, image) || other.image == image)&&(identical(other.msrp, msrp) || other.msrp == msrp)&&(identical(other.listPrice, listPrice) || other.listPrice == listPrice)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.synopsys, synopsys) || other.synopsys == synopsys)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._subjects, _subjects)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&const DeepCollectionEquality().equals(other._prices, _prices)&&const DeepCollectionEquality().equals(other._related, _related)&&const DeepCollectionEquality().equals(other._thema, _thema)&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,titleLong,isbn,isbn13,deweyDecimal,binding,publisher,language,datePublished,edition,editionNumber,pages,dimensions,overview,image,msrp,listPrice,excerpt,synopsys,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_subjects),const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_prices),const DeepCollectionEquality().hash(_related),const DeepCollectionEquality().hash(_thema),const DeepCollectionEquality().hash(_genres)]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Book(title: $title, titleLong: $titleLong, isbn: $isbn, isbn13: $isbn13, deweyDecimal: $deweyDecimal, binding: $binding, publisher: $publisher, language: $language, datePublished: $datePublished, edition: $edition, editionNumber: $editionNumber, pages: $pages, dimensions: $dimensions, overview: $overview, image: $image, msrp: $msrp, listPrice: $listPrice, excerpt: $excerpt, synopsys: $synopsys, authors: $authors, subjects: $subjects, reviews: $reviews, prices: $prices, related: $related, thema: $thema, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String title,@JsonKey(name: 'title_long') String? titleLong, String isbn, String isbn13,@_DeweyDecimalConverter()@JsonKey(name: 'dewey_decimal') String? deweyDecimal, String? binding, String? publisher, String? language,@_DateConverter()@JsonKey(name: 'date_published') DateTime? datePublished,@Deprecated('Use editionNumber instead.') String? edition,@JsonKey(name: 'edition_number') int? editionNumber, int? pages, String? dimensions, String? overview, String? image,@Deprecated('Use listPrice instead.')@_MsrpConverter() double? msrp,@JsonKey(name: 'list_price') ListPrice? listPrice,@Deprecated('Deprecated by ISBNdb without a replacement.') String? excerpt, String? synopsys,@JsonKey(readValue: _readBookAuthors) List<String?>? authors,@Deprecated('Use thema instead.')@JsonKey(readValue: _readBookSubjects) List<String>? subjects,@JsonKey(readValue: _readBookReviews) List<String>? reviews, List<Merchant>? prices,@JsonKey(readValue: _readBookRelated) List<String>? related, List<ThemaEntry>? thema, List<String>? genres
});


@override $ListPriceCopyWith<$Res>? get listPrice;

}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? titleLong = freezed,Object? isbn = null,Object? isbn13 = null,Object? deweyDecimal = freezed,Object? binding = freezed,Object? publisher = freezed,Object? language = freezed,Object? datePublished = freezed,Object? edition = freezed,Object? editionNumber = freezed,Object? pages = freezed,Object? dimensions = freezed,Object? overview = freezed,Object? image = freezed,Object? msrp = freezed,Object? listPrice = freezed,Object? excerpt = freezed,Object? synopsys = freezed,Object? authors = freezed,Object? subjects = freezed,Object? reviews = freezed,Object? prices = freezed,Object? related = freezed,Object? thema = freezed,Object? genres = freezed,}) {
  return _then(_Book(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleLong: freezed == titleLong ? _self.titleLong : titleLong // ignore: cast_nullable_to_non_nullable
as String?,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,deweyDecimal: freezed == deweyDecimal ? _self.deweyDecimal : deweyDecimal // ignore: cast_nullable_to_non_nullable
as String?,binding: freezed == binding ? _self.binding : binding // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,datePublished: freezed == datePublished ? _self.datePublished : datePublished // ignore: cast_nullable_to_non_nullable
as DateTime?,edition: freezed == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String?,editionNumber: freezed == editionNumber ? _self.editionNumber : editionNumber // ignore: cast_nullable_to_non_nullable
as int?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,dimensions: freezed == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,msrp: freezed == msrp ? _self.msrp : msrp // ignore: cast_nullable_to_non_nullable
as double?,listPrice: freezed == listPrice ? _self.listPrice : listPrice // ignore: cast_nullable_to_non_nullable
as ListPrice?,excerpt: freezed == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String?,synopsys: freezed == synopsys ? _self.synopsys : synopsys // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String?>?,subjects: freezed == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<String>?,prices: freezed == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<Merchant>?,related: freezed == related ? _self._related : related // ignore: cast_nullable_to_non_nullable
as List<String>?,thema: freezed == thema ? _self._thema : thema // ignore: cast_nullable_to_non_nullable
as List<ThemaEntry>?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListPriceCopyWith<$Res>? get listPrice {
    if (_self.listPrice == null) {
    return null;
  }

  return $ListPriceCopyWith<$Res>(_self.listPrice!, (value) {
    return _then(_self.copyWith(listPrice: value));
  });
}
}


/// @nodoc
mixin _$Merchant implements DiagnosticableTreeMixin {

/// Not documented in the official API
 String get condition;/// Name of the seller of the book
 String get merchant;/// URL of the merchant logo
@JsonKey(name: 'merchant_logo') String get merchantLogo;/// Not documented in the official API
@JsonKey(name: 'merchant_logo_offset') Map get merchantLogoOffset;/// Shipping cost
 String get shipping;/// Price of the book
 String get price;/// Not documented in the official API
 String get total;/// Link to the purchase url
 String get link;
/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantCopyWith<Merchant> get copyWith => _$MerchantCopyWithImpl<Merchant>(this as Merchant, _$identity);

  /// Serializes this Merchant to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Merchant'))
    ..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('merchant', merchant))..add(DiagnosticsProperty('merchantLogo', merchantLogo))..add(DiagnosticsProperty('merchantLogoOffset', merchantLogoOffset))..add(DiagnosticsProperty('shipping', shipping))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('link', link));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Merchant&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.merchantLogo, merchantLogo) || other.merchantLogo == merchantLogo)&&const DeepCollectionEquality().equals(other.merchantLogoOffset, merchantLogoOffset)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&(identical(other.price, price) || other.price == price)&&(identical(other.total, total) || other.total == total)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,condition,merchant,merchantLogo,const DeepCollectionEquality().hash(merchantLogoOffset),shipping,price,total,link);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
}


}

/// @nodoc
abstract mixin class $MerchantCopyWith<$Res>  {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) _then) = _$MerchantCopyWithImpl;
@useResult
$Res call({
 String condition, String merchant,@JsonKey(name: 'merchant_logo') String merchantLogo,@JsonKey(name: 'merchant_logo_offset') Map merchantLogoOffset, String shipping, String price, String total, String link
});




}
/// @nodoc
class _$MerchantCopyWithImpl<$Res>
    implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._self, this._then);

  final Merchant _self;
  final $Res Function(Merchant) _then;

/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? condition = null,Object? merchant = null,Object? merchantLogo = null,Object? merchantLogoOffset = null,Object? shipping = null,Object? price = null,Object? total = null,Object? link = null,}) {
  return _then(_self.copyWith(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,merchantLogo: null == merchantLogo ? _self.merchantLogo : merchantLogo // ignore: cast_nullable_to_non_nullable
as String,merchantLogoOffset: null == merchantLogoOffset ? _self.merchantLogoOffset : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
as Map,shipping: null == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Merchant].
extension MerchantPatterns on Merchant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Merchant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Merchant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Merchant value)  $default,){
final _that = this;
switch (_that) {
case _Merchant():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Merchant value)?  $default,){
final _that = this;
switch (_that) {
case _Merchant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String condition,  String merchant, @JsonKey(name: 'merchant_logo')  String merchantLogo, @JsonKey(name: 'merchant_logo_offset')  Map merchantLogoOffset,  String shipping,  String price,  String total,  String link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Merchant() when $default != null:
return $default(_that.condition,_that.merchant,_that.merchantLogo,_that.merchantLogoOffset,_that.shipping,_that.price,_that.total,_that.link);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String condition,  String merchant, @JsonKey(name: 'merchant_logo')  String merchantLogo, @JsonKey(name: 'merchant_logo_offset')  Map merchantLogoOffset,  String shipping,  String price,  String total,  String link)  $default,) {final _that = this;
switch (_that) {
case _Merchant():
return $default(_that.condition,_that.merchant,_that.merchantLogo,_that.merchantLogoOffset,_that.shipping,_that.price,_that.total,_that.link);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String condition,  String merchant, @JsonKey(name: 'merchant_logo')  String merchantLogo, @JsonKey(name: 'merchant_logo_offset')  Map merchantLogoOffset,  String shipping,  String price,  String total,  String link)?  $default,) {final _that = this;
switch (_that) {
case _Merchant() when $default != null:
return $default(_that.condition,_that.merchant,_that.merchantLogo,_that.merchantLogoOffset,_that.shipping,_that.price,_that.total,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Merchant with DiagnosticableTreeMixin implements Merchant {
   _Merchant({required this.condition, required this.merchant, @JsonKey(name: 'merchant_logo') required this.merchantLogo, @JsonKey(name: 'merchant_logo_offset') required final  Map merchantLogoOffset, required this.shipping, required this.price, required this.total, required this.link}): _merchantLogoOffset = merchantLogoOffset;
  factory _Merchant.fromJson(Map<String, dynamic> json) => _$MerchantFromJson(json);

/// Not documented in the official API
@override final  String condition;
/// Name of the seller of the book
@override final  String merchant;
/// URL of the merchant logo
@override@JsonKey(name: 'merchant_logo') final  String merchantLogo;
/// Not documented in the official API
 final  Map _merchantLogoOffset;
/// Not documented in the official API
@override@JsonKey(name: 'merchant_logo_offset') Map get merchantLogoOffset {
  if (_merchantLogoOffset is EqualUnmodifiableMapView) return _merchantLogoOffset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_merchantLogoOffset);
}

/// Shipping cost
@override final  String shipping;
/// Price of the book
@override final  String price;
/// Not documented in the official API
@override final  String total;
/// Link to the purchase url
@override final  String link;

/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantCopyWith<_Merchant> get copyWith => __$MerchantCopyWithImpl<_Merchant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Merchant'))
    ..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('merchant', merchant))..add(DiagnosticsProperty('merchantLogo', merchantLogo))..add(DiagnosticsProperty('merchantLogoOffset', merchantLogoOffset))..add(DiagnosticsProperty('shipping', shipping))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('link', link));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Merchant&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.merchantLogo, merchantLogo) || other.merchantLogo == merchantLogo)&&const DeepCollectionEquality().equals(other._merchantLogoOffset, _merchantLogoOffset)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&(identical(other.price, price) || other.price == price)&&(identical(other.total, total) || other.total == total)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,condition,merchant,merchantLogo,const DeepCollectionEquality().hash(_merchantLogoOffset),shipping,price,total,link);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
}


}

/// @nodoc
abstract mixin class _$MerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory _$MerchantCopyWith(_Merchant value, $Res Function(_Merchant) _then) = __$MerchantCopyWithImpl;
@override @useResult
$Res call({
 String condition, String merchant,@JsonKey(name: 'merchant_logo') String merchantLogo,@JsonKey(name: 'merchant_logo_offset') Map merchantLogoOffset, String shipping, String price, String total, String link
});




}
/// @nodoc
class __$MerchantCopyWithImpl<$Res>
    implements _$MerchantCopyWith<$Res> {
  __$MerchantCopyWithImpl(this._self, this._then);

  final _Merchant _self;
  final $Res Function(_Merchant) _then;

/// Create a copy of Merchant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? condition = null,Object? merchant = null,Object? merchantLogo = null,Object? merchantLogoOffset = null,Object? shipping = null,Object? price = null,Object? total = null,Object? link = null,}) {
  return _then(_Merchant(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,merchantLogo: null == merchantLogo ? _self.merchantLogo : merchantLogo // ignore: cast_nullable_to_non_nullable
as String,merchantLogoOffset: null == merchantLogoOffset ? _self._merchantLogoOffset : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
as Map,shipping: null == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PublisherQueryResult implements DiagnosticableTreeMixin {

/// The number of results for this query
 int get total;/// The list of the publishers matching the query
@JsonKey(readValue: _readPublisherNames) List<String> get publishers;
/// Create a copy of PublisherQueryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublisherQueryResultCopyWith<PublisherQueryResult> get copyWith => _$PublisherQueryResultCopyWithImpl<PublisherQueryResult>(this as PublisherQueryResult, _$identity);

  /// Serializes this PublisherQueryResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PublisherQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('publishers', publishers));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublisherQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.publishers, publishers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(publishers));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PublisherQueryResult(total: $total, publishers: $publishers)';
}


}

/// @nodoc
abstract mixin class $PublisherQueryResultCopyWith<$Res>  {
  factory $PublisherQueryResultCopyWith(PublisherQueryResult value, $Res Function(PublisherQueryResult) _then) = _$PublisherQueryResultCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(readValue: _readPublisherNames) List<String> publishers
});




}
/// @nodoc
class _$PublisherQueryResultCopyWithImpl<$Res>
    implements $PublisherQueryResultCopyWith<$Res> {
  _$PublisherQueryResultCopyWithImpl(this._self, this._then);

  final PublisherQueryResult _self;
  final $Res Function(PublisherQueryResult) _then;

/// Create a copy of PublisherQueryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? publishers = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,publishers: null == publishers ? _self.publishers : publishers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PublisherQueryResult].
extension PublisherQueryResultPatterns on PublisherQueryResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublisherQueryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublisherQueryResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublisherQueryResult value)  $default,){
final _that = this;
switch (_that) {
case _PublisherQueryResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublisherQueryResult value)?  $default,){
final _that = this;
switch (_that) {
case _PublisherQueryResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readPublisherNames)  List<String> publishers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublisherQueryResult() when $default != null:
return $default(_that.total,_that.publishers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readPublisherNames)  List<String> publishers)  $default,) {final _that = this;
switch (_that) {
case _PublisherQueryResult():
return $default(_that.total,_that.publishers);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(readValue: _readPublisherNames)  List<String> publishers)?  $default,) {final _that = this;
switch (_that) {
case _PublisherQueryResult() when $default != null:
return $default(_that.total,_that.publishers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublisherQueryResult with DiagnosticableTreeMixin implements PublisherQueryResult {
   _PublisherQueryResult({required this.total, @JsonKey(readValue: _readPublisherNames) final  List<String> publishers = const []}): _publishers = publishers;
  factory _PublisherQueryResult.fromJson(Map<String, dynamic> json) => _$PublisherQueryResultFromJson(json);

/// The number of results for this query
@override final  int total;
/// The list of the publishers matching the query
 final  List<String> _publishers;
/// The list of the publishers matching the query
@override@JsonKey(readValue: _readPublisherNames) List<String> get publishers {
  if (_publishers is EqualUnmodifiableListView) return _publishers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_publishers);
}


/// Create a copy of PublisherQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublisherQueryResultCopyWith<_PublisherQueryResult> get copyWith => __$PublisherQueryResultCopyWithImpl<_PublisherQueryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublisherQueryResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PublisherQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('publishers', publishers));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublisherQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._publishers, _publishers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_publishers));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PublisherQueryResult(total: $total, publishers: $publishers)';
}


}

/// @nodoc
abstract mixin class _$PublisherQueryResultCopyWith<$Res> implements $PublisherQueryResultCopyWith<$Res> {
  factory _$PublisherQueryResultCopyWith(_PublisherQueryResult value, $Res Function(_PublisherQueryResult) _then) = __$PublisherQueryResultCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(readValue: _readPublisherNames) List<String> publishers
});




}
/// @nodoc
class __$PublisherQueryResultCopyWithImpl<$Res>
    implements _$PublisherQueryResultCopyWith<$Res> {
  __$PublisherQueryResultCopyWithImpl(this._self, this._then);

  final _PublisherQueryResult _self;
  final $Res Function(_PublisherQueryResult) _then;

/// Create a copy of PublisherQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? publishers = null,}) {
  return _then(_PublisherQueryResult(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,publishers: null == publishers ? _self._publishers : publishers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Publisher implements DiagnosticableTreeMixin {

/// The name of this publisher
 String get name;/// The list of the books this publisher published
@JsonKey(readValue: _readPublisherBooks) List<Book> get books;
/// Create a copy of Publisher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublisherCopyWith<Publisher> get copyWith => _$PublisherCopyWithImpl<Publisher>(this as Publisher, _$identity);

  /// Serializes this Publisher to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Publisher'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Publisher&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Publisher(name: $name, books: $books)';
}


}

/// @nodoc
abstract mixin class $PublisherCopyWith<$Res>  {
  factory $PublisherCopyWith(Publisher value, $Res Function(Publisher) _then) = _$PublisherCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(readValue: _readPublisherBooks) List<Book> books
});




}
/// @nodoc
class _$PublisherCopyWithImpl<$Res>
    implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._self, this._then);

  final Publisher _self;
  final $Res Function(Publisher) _then;

/// Create a copy of Publisher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? books = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}

}


/// Adds pattern-matching-related methods to [Publisher].
extension PublisherPatterns on Publisher {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Publisher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Publisher() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Publisher value)  $default,){
final _that = this;
switch (_that) {
case _Publisher():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Publisher value)?  $default,){
final _that = this;
switch (_that) {
case _Publisher() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(readValue: _readPublisherBooks)  List<Book> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Publisher() when $default != null:
return $default(_that.name,_that.books);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(readValue: _readPublisherBooks)  List<Book> books)  $default,) {final _that = this;
switch (_that) {
case _Publisher():
return $default(_that.name,_that.books);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(readValue: _readPublisherBooks)  List<Book> books)?  $default,) {final _that = this;
switch (_that) {
case _Publisher() when $default != null:
return $default(_that.name,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Publisher with DiagnosticableTreeMixin implements Publisher {
   _Publisher({required this.name, @JsonKey(readValue: _readPublisherBooks) final  List<Book> books = const []}): _books = books;
  factory _Publisher.fromJson(Map<String, dynamic> json) => _$PublisherFromJson(json);

/// The name of this publisher
@override final  String name;
/// The list of the books this publisher published
 final  List<Book> _books;
/// The list of the books this publisher published
@override@JsonKey(readValue: _readPublisherBooks) List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of Publisher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublisherCopyWith<_Publisher> get copyWith => __$PublisherCopyWithImpl<_Publisher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublisherToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Publisher'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Publisher&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Publisher(name: $name, books: $books)';
}


}

/// @nodoc
abstract mixin class _$PublisherCopyWith<$Res> implements $PublisherCopyWith<$Res> {
  factory _$PublisherCopyWith(_Publisher value, $Res Function(_Publisher) _then) = __$PublisherCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(readValue: _readPublisherBooks) List<Book> books
});




}
/// @nodoc
class __$PublisherCopyWithImpl<$Res>
    implements _$PublisherCopyWith<$Res> {
  __$PublisherCopyWithImpl(this._self, this._then);

  final _Publisher _self;
  final $Res Function(_Publisher) _then;

/// Create a copy of Publisher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? books = null,}) {
  return _then(_Publisher(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}


/// @nodoc
mixin _$KeyDetails implements DiagnosticableTreeMixin {

/// API host tied to this key.
@JsonKey(name: 'api_host') String get apiHost;/// Name of the subscription plan attached to this key.
///
/// Empty only for legacy payloads captured before API 2.7.1.
@JsonKey(name: 'plan_name') String get planName;/// Plan usage details.
@JsonKey(name: 'plan_limit') PlanLimit get planLimit;/// Maximum ISBNs accepted by one `POST /books` request.
/// Null for older responses that do not report the limit.
@JsonKey(name: 'bulk_limit') int? get bulkLimit;
/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyDetailsCopyWith<KeyDetails> get copyWith => _$KeyDetailsCopyWithImpl<KeyDetails>(this as KeyDetails, _$identity);

  /// Serializes this KeyDetails to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'KeyDetails'))
    ..add(DiagnosticsProperty('apiHost', apiHost))..add(DiagnosticsProperty('planName', planName))..add(DiagnosticsProperty('planLimit', planLimit))..add(DiagnosticsProperty('bulkLimit', bulkLimit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyDetails&&(identical(other.apiHost, apiHost) || other.apiHost == apiHost)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.planLimit, planLimit) || other.planLimit == planLimit)&&(identical(other.bulkLimit, bulkLimit) || other.bulkLimit == bulkLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apiHost,planName,planLimit,bulkLimit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'KeyDetails(apiHost: $apiHost, planName: $planName, planLimit: $planLimit, bulkLimit: $bulkLimit)';
}


}

/// @nodoc
abstract mixin class $KeyDetailsCopyWith<$Res>  {
  factory $KeyDetailsCopyWith(KeyDetails value, $Res Function(KeyDetails) _then) = _$KeyDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'api_host') String apiHost,@JsonKey(name: 'plan_name') String planName,@JsonKey(name: 'plan_limit') PlanLimit planLimit,@JsonKey(name: 'bulk_limit') int? bulkLimit
});


$PlanLimitCopyWith<$Res> get planLimit;

}
/// @nodoc
class _$KeyDetailsCopyWithImpl<$Res>
    implements $KeyDetailsCopyWith<$Res> {
  _$KeyDetailsCopyWithImpl(this._self, this._then);

  final KeyDetails _self;
  final $Res Function(KeyDetails) _then;

/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiHost = null,Object? planName = null,Object? planLimit = null,Object? bulkLimit = freezed,}) {
  return _then(_self.copyWith(
apiHost: null == apiHost ? _self.apiHost : apiHost // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,planLimit: null == planLimit ? _self.planLimit : planLimit // ignore: cast_nullable_to_non_nullable
as PlanLimit,bulkLimit: freezed == bulkLimit ? _self.bulkLimit : bulkLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanLimitCopyWith<$Res> get planLimit {

  return $PlanLimitCopyWith<$Res>(_self.planLimit, (value) {
    return _then(_self.copyWith(planLimit: value));
  });
}
}


/// Adds pattern-matching-related methods to [KeyDetails].
extension KeyDetailsPatterns on KeyDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyDetails value)  $default,){
final _that = this;
switch (_that) {
case _KeyDetails():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyDetails value)?  $default,){
final _that = this;
switch (_that) {
case _KeyDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeyDetails extends KeyDetails with DiagnosticableTreeMixin {
   _KeyDetails({@JsonKey(name: 'api_host') required this.apiHost, @JsonKey(name: 'plan_name') this.planName = '', @JsonKey(name: 'plan_limit') required this.planLimit, @JsonKey(name: 'bulk_limit') this.bulkLimit}): super._();
  factory _KeyDetails.fromJson(Map<String, dynamic> json) => _$KeyDetailsFromJson(json);

/// API host tied to this key.
@override@JsonKey(name: 'api_host') final  String apiHost;
/// Name of the subscription plan attached to this key.
///
/// Empty only for legacy payloads captured before API 2.7.1.
@override@JsonKey(name: 'plan_name') final  String planName;
/// Plan usage details.
@override@JsonKey(name: 'plan_limit') final  PlanLimit planLimit;
/// Maximum ISBNs accepted by one `POST /books` request.
/// Null for older responses that do not report the limit.
@override@JsonKey(name: 'bulk_limit') final  int? bulkLimit;

/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyDetailsCopyWith<_KeyDetails> get copyWith => __$KeyDetailsCopyWithImpl<_KeyDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeyDetailsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'KeyDetails'))
    ..add(DiagnosticsProperty('apiHost', apiHost))..add(DiagnosticsProperty('planName', planName))..add(DiagnosticsProperty('planLimit', planLimit))..add(DiagnosticsProperty('bulkLimit', bulkLimit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyDetails&&(identical(other.apiHost, apiHost) || other.apiHost == apiHost)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.planLimit, planLimit) || other.planLimit == planLimit)&&(identical(other.bulkLimit, bulkLimit) || other.bulkLimit == bulkLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apiHost,planName,planLimit,bulkLimit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'KeyDetails(apiHost: $apiHost, planName: $planName, planLimit: $planLimit, bulkLimit: $bulkLimit)';
}


}

/// @nodoc
abstract mixin class _$KeyDetailsCopyWith<$Res> implements $KeyDetailsCopyWith<$Res> {
  factory _$KeyDetailsCopyWith(_KeyDetails value, $Res Function(_KeyDetails) _then) = __$KeyDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'api_host') String apiHost,@JsonKey(name: 'plan_name') String planName,@JsonKey(name: 'plan_limit') PlanLimit planLimit,@JsonKey(name: 'bulk_limit') int? bulkLimit
});


@override $PlanLimitCopyWith<$Res> get planLimit;

}
/// @nodoc
class __$KeyDetailsCopyWithImpl<$Res>
    implements _$KeyDetailsCopyWith<$Res> {
  __$KeyDetailsCopyWithImpl(this._self, this._then);

  final _KeyDetails _self;
  final $Res Function(_KeyDetails) _then;

/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiHost = null,Object? planName = null,Object? planLimit = null,Object? bulkLimit = freezed,}) {
  return _then(_KeyDetails(
apiHost: null == apiHost ? _self.apiHost : apiHost // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,planLimit: null == planLimit ? _self.planLimit : planLimit // ignore: cast_nullable_to_non_nullable
as PlanLimit,bulkLimit: freezed == bulkLimit ? _self.bulkLimit : bulkLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of KeyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanLimitCopyWith<$Res> get planLimit {

  return $PlanLimitCopyWith<$Res>(_self.planLimit, (value) {
    return _then(_self.copyWith(planLimit: value));
  });
}
}


/// @nodoc
mixin _$ListPrice implements DiagnosticableTreeMixin {

/// Price amount, rounded to two decimal places by ISBNdb.
 double get amount;/// ISO 4217 currency code.
 String get currency;
/// Create a copy of ListPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListPriceCopyWith<ListPrice> get copyWith => _$ListPriceCopyWithImpl<ListPrice>(this as ListPrice, _$identity);

  /// Serializes this ListPrice to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ListPrice'))
    ..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('currency', currency));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListPrice&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ListPrice(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ListPriceCopyWith<$Res>  {
  factory $ListPriceCopyWith(ListPrice value, $Res Function(ListPrice) _then) = _$ListPriceCopyWithImpl;
@useResult
$Res call({
 double amount, String currency
});




}
/// @nodoc
class _$ListPriceCopyWithImpl<$Res>
    implements $ListPriceCopyWith<$Res> {
  _$ListPriceCopyWithImpl(this._self, this._then);

  final ListPrice _self;
  final $Res Function(ListPrice) _then;

/// Create a copy of ListPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListPrice].
extension ListPricePatterns on ListPrice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListPrice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListPrice value)  $default,){
final _that = this;
switch (_that) {
case _ListPrice():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListPrice value)?  $default,){
final _that = this;
switch (_that) {
case _ListPrice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListPrice() when $default != null:
return $default(_that.amount,_that.currency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String currency)  $default,) {final _that = this;
switch (_that) {
case _ListPrice():
return $default(_that.amount,_that.currency);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _ListPrice() when $default != null:
return $default(_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListPrice with DiagnosticableTreeMixin implements ListPrice {
   _ListPrice({required this.amount, required this.currency});
  factory _ListPrice.fromJson(Map<String, dynamic> json) => _$ListPriceFromJson(json);

/// Price amount, rounded to two decimal places by ISBNdb.
@override final  double amount;
/// ISO 4217 currency code.
@override final  String currency;

/// Create a copy of ListPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListPriceCopyWith<_ListPrice> get copyWith => __$ListPriceCopyWithImpl<_ListPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListPriceToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ListPrice'))
    ..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('currency', currency));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListPrice&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ListPrice(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$ListPriceCopyWith<$Res> implements $ListPriceCopyWith<$Res> {
  factory _$ListPriceCopyWith(_ListPrice value, $Res Function(_ListPrice) _then) = __$ListPriceCopyWithImpl;
@override @useResult
$Res call({
 double amount, String currency
});




}
/// @nodoc
class __$ListPriceCopyWithImpl<$Res>
    implements _$ListPriceCopyWith<$Res> {
  __$ListPriceCopyWithImpl(this._self, this._then);

  final _ListPrice _self;
  final $Res Function(_ListPrice) _then;

/// Create a copy of ListPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_ListPrice(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlanLimit implements DiagnosticableTreeMixin {

/// Daily request allowance shared by every key in the subscription.
 int get total;/// Requests charged today across the subscription.
 int get spent;/// Requests remaining under the more restrictive active allowance.
 int get left;/// Daily allowance attached to this key, or `null` when it has no cap.
@JsonKey(name: 'key_total') int? get keyTotal;/// Requests charged today to this key.
@JsonKey(name: 'key_spent') int get keySpent;/// Requests remaining for this key, or `null` when it has no cap.
@JsonKey(name: 'key_left') int? get keyLeft;/// Allowance that currently determines [left].
@JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown) PlanLimitAllowance get limitedBy;
/// Create a copy of PlanLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanLimitCopyWith<PlanLimit> get copyWith => _$PlanLimitCopyWithImpl<PlanLimit>(this as PlanLimit, _$identity);

  /// Serializes this PlanLimit to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PlanLimit'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('spent', spent))..add(DiagnosticsProperty('left', left))..add(DiagnosticsProperty('keyTotal', keyTotal))..add(DiagnosticsProperty('keySpent', keySpent))..add(DiagnosticsProperty('keyLeft', keyLeft))..add(DiagnosticsProperty('limitedBy', limitedBy));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanLimit&&(identical(other.total, total) || other.total == total)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.left, left) || other.left == left)&&(identical(other.keyTotal, keyTotal) || other.keyTotal == keyTotal)&&(identical(other.keySpent, keySpent) || other.keySpent == keySpent)&&(identical(other.keyLeft, keyLeft) || other.keyLeft == keyLeft)&&(identical(other.limitedBy, limitedBy) || other.limitedBy == limitedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,spent,left,keyTotal,keySpent,keyLeft,limitedBy);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PlanLimit(total: $total, spent: $spent, left: $left, keyTotal: $keyTotal, keySpent: $keySpent, keyLeft: $keyLeft, limitedBy: $limitedBy)';
}


}

/// @nodoc
abstract mixin class $PlanLimitCopyWith<$Res>  {
  factory $PlanLimitCopyWith(PlanLimit value, $Res Function(PlanLimit) _then) = _$PlanLimitCopyWithImpl;
@useResult
$Res call({
 int total, int spent, int left,@JsonKey(name: 'key_total') int? keyTotal,@JsonKey(name: 'key_spent') int keySpent,@JsonKey(name: 'key_left') int? keyLeft,@JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown) PlanLimitAllowance limitedBy
});




}
/// @nodoc
class _$PlanLimitCopyWithImpl<$Res>
    implements $PlanLimitCopyWith<$Res> {
  _$PlanLimitCopyWithImpl(this._self, this._then);

  final PlanLimit _self;
  final $Res Function(PlanLimit) _then;

/// Create a copy of PlanLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? spent = null,Object? left = null,Object? keyTotal = freezed,Object? keySpent = null,Object? keyLeft = freezed,Object? limitedBy = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as int,keyTotal: freezed == keyTotal ? _self.keyTotal : keyTotal // ignore: cast_nullable_to_non_nullable
as int?,keySpent: null == keySpent ? _self.keySpent : keySpent // ignore: cast_nullable_to_non_nullable
as int,keyLeft: freezed == keyLeft ? _self.keyLeft : keyLeft // ignore: cast_nullable_to_non_nullable
as int?,limitedBy: null == limitedBy ? _self.limitedBy : limitedBy // ignore: cast_nullable_to_non_nullable
as PlanLimitAllowance,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanLimit].
extension PlanLimitPatterns on PlanLimit {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanLimit() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanLimit value)  $default,){
final _that = this;
switch (_that) {
case _PlanLimit():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanLimit value)?  $default,){
final _that = this;
switch (_that) {
case _PlanLimit() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int spent,  int left, @JsonKey(name: 'key_total')  int? keyTotal, @JsonKey(name: 'key_spent')  int keySpent, @JsonKey(name: 'key_left')  int? keyLeft, @JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown)  PlanLimitAllowance limitedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanLimit() when $default != null:
return $default(_that.total,_that.spent,_that.left,_that.keyTotal,_that.keySpent,_that.keyLeft,_that.limitedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int spent,  int left, @JsonKey(name: 'key_total')  int? keyTotal, @JsonKey(name: 'key_spent')  int keySpent, @JsonKey(name: 'key_left')  int? keyLeft, @JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown)  PlanLimitAllowance limitedBy)  $default,) {final _that = this;
switch (_that) {
case _PlanLimit():
return $default(_that.total,_that.spent,_that.left,_that.keyTotal,_that.keySpent,_that.keyLeft,_that.limitedBy);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int spent,  int left, @JsonKey(name: 'key_total')  int? keyTotal, @JsonKey(name: 'key_spent')  int keySpent, @JsonKey(name: 'key_left')  int? keyLeft, @JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown)  PlanLimitAllowance limitedBy)?  $default,) {final _that = this;
switch (_that) {
case _PlanLimit() when $default != null:
return $default(_that.total,_that.spent,_that.left,_that.keyTotal,_that.keySpent,_that.keyLeft,_that.limitedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanLimit with DiagnosticableTreeMixin implements PlanLimit {
   _PlanLimit({required this.total, required this.spent, required this.left, @JsonKey(name: 'key_total') this.keyTotal, @JsonKey(name: 'key_spent') this.keySpent = 0, @JsonKey(name: 'key_left') this.keyLeft, @JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown) this.limitedBy = PlanLimitAllowance.subject});
  factory _PlanLimit.fromJson(Map<String, dynamic> json) => _$PlanLimitFromJson(json);

/// Daily request allowance shared by every key in the subscription.
@override final  int total;
/// Requests charged today across the subscription.
@override final  int spent;
/// Requests remaining under the more restrictive active allowance.
@override final  int left;
/// Daily allowance attached to this key, or `null` when it has no cap.
@override@JsonKey(name: 'key_total') final  int? keyTotal;
/// Requests charged today to this key.
@override@JsonKey(name: 'key_spent') final  int keySpent;
/// Requests remaining for this key, or `null` when it has no cap.
@override@JsonKey(name: 'key_left') final  int? keyLeft;
/// Allowance that currently determines [left].
@override@JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown) final  PlanLimitAllowance limitedBy;

/// Create a copy of PlanLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanLimitCopyWith<_PlanLimit> get copyWith => __$PlanLimitCopyWithImpl<_PlanLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanLimitToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PlanLimit'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('spent', spent))..add(DiagnosticsProperty('left', left))..add(DiagnosticsProperty('keyTotal', keyTotal))..add(DiagnosticsProperty('keySpent', keySpent))..add(DiagnosticsProperty('keyLeft', keyLeft))..add(DiagnosticsProperty('limitedBy', limitedBy));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanLimit&&(identical(other.total, total) || other.total == total)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.left, left) || other.left == left)&&(identical(other.keyTotal, keyTotal) || other.keyTotal == keyTotal)&&(identical(other.keySpent, keySpent) || other.keySpent == keySpent)&&(identical(other.keyLeft, keyLeft) || other.keyLeft == keyLeft)&&(identical(other.limitedBy, limitedBy) || other.limitedBy == limitedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,spent,left,keyTotal,keySpent,keyLeft,limitedBy);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PlanLimit(total: $total, spent: $spent, left: $left, keyTotal: $keyTotal, keySpent: $keySpent, keyLeft: $keyLeft, limitedBy: $limitedBy)';
}


}

/// @nodoc
abstract mixin class _$PlanLimitCopyWith<$Res> implements $PlanLimitCopyWith<$Res> {
  factory _$PlanLimitCopyWith(_PlanLimit value, $Res Function(_PlanLimit) _then) = __$PlanLimitCopyWithImpl;
@override @useResult
$Res call({
 int total, int spent, int left,@JsonKey(name: 'key_total') int? keyTotal,@JsonKey(name: 'key_spent') int keySpent,@JsonKey(name: 'key_left') int? keyLeft,@JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown) PlanLimitAllowance limitedBy
});




}
/// @nodoc
class __$PlanLimitCopyWithImpl<$Res>
    implements _$PlanLimitCopyWith<$Res> {
  __$PlanLimitCopyWithImpl(this._self, this._then);

  final _PlanLimit _self;
  final $Res Function(_PlanLimit) _then;

/// Create a copy of PlanLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? spent = null,Object? left = null,Object? keyTotal = freezed,Object? keySpent = null,Object? keyLeft = freezed,Object? limitedBy = null,}) {
  return _then(_PlanLimit(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as int,keyTotal: freezed == keyTotal ? _self.keyTotal : keyTotal // ignore: cast_nullable_to_non_nullable
as int?,keySpent: null == keySpent ? _self.keySpent : keySpent // ignore: cast_nullable_to_non_nullable
as int,keyLeft: freezed == keyLeft ? _self.keyLeft : keyLeft // ignore: cast_nullable_to_non_nullable
as int?,limitedBy: null == limitedBy ? _self.limitedBy : limitedBy // ignore: cast_nullable_to_non_nullable
as PlanLimitAllowance,
  ));
}


}


/// @nodoc
mixin _$Stats implements DiagnosticableTreeMixin {

 int get books; int get authors; int get publishers; int get subjects;
/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsCopyWith<Stats> get copyWith => _$StatsCopyWithImpl<Stats>(this as Stats, _$identity);

  /// Serializes this Stats to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Stats'))
    ..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('authors', authors))..add(DiagnosticsProperty('publishers', publishers))..add(DiagnosticsProperty('subjects', subjects));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stats&&(identical(other.books, books) || other.books == books)&&(identical(other.authors, authors) || other.authors == authors)&&(identical(other.publishers, publishers) || other.publishers == publishers)&&(identical(other.subjects, subjects) || other.subjects == subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,books,authors,publishers,subjects);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Stats(books: $books, authors: $authors, publishers: $publishers, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $StatsCopyWith<$Res>  {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) _then) = _$StatsCopyWithImpl;
@useResult
$Res call({
 int books, int authors, int publishers, int subjects
});




}
/// @nodoc
class _$StatsCopyWithImpl<$Res>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._self, this._then);

  final Stats _self;
  final $Res Function(Stats) _then;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? books = null,Object? authors = null,Object? publishers = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as int,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as int,publishers: null == publishers ? _self.publishers : publishers // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Stats].
extension StatsPatterns on Stats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stats value)  $default,){
final _that = this;
switch (_that) {
case _Stats():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stats value)?  $default,){
final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int books,  int authors,  int publishers,  int subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that.books,_that.authors,_that.publishers,_that.subjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int books,  int authors,  int publishers,  int subjects)  $default,) {final _that = this;
switch (_that) {
case _Stats():
return $default(_that.books,_that.authors,_that.publishers,_that.subjects);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int books,  int authors,  int publishers,  int subjects)?  $default,) {final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that.books,_that.authors,_that.publishers,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stats with DiagnosticableTreeMixin implements Stats {
   _Stats({required this.books, required this.authors, required this.publishers, required this.subjects});
  factory _Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

@override final  int books;
@override final  int authors;
@override final  int publishers;
@override final  int subjects;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsCopyWith<_Stats> get copyWith => __$StatsCopyWithImpl<_Stats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Stats'))
    ..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('authors', authors))..add(DiagnosticsProperty('publishers', publishers))..add(DiagnosticsProperty('subjects', subjects));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stats&&(identical(other.books, books) || other.books == books)&&(identical(other.authors, authors) || other.authors == authors)&&(identical(other.publishers, publishers) || other.publishers == publishers)&&(identical(other.subjects, subjects) || other.subjects == subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,books,authors,publishers,subjects);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Stats(books: $books, authors: $authors, publishers: $publishers, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$StatsCopyWith(_Stats value, $Res Function(_Stats) _then) = __$StatsCopyWithImpl;
@override @useResult
$Res call({
 int books, int authors, int publishers, int subjects
});




}
/// @nodoc
class __$StatsCopyWithImpl<$Res>
    implements _$StatsCopyWith<$Res> {
  __$StatsCopyWithImpl(this._self, this._then);

  final _Stats _self;
  final $Res Function(_Stats) _then;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? books = null,Object? authors = null,Object? publishers = null,Object? subjects = null,}) {
  return _then(_Stats(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as int,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as int,publishers: null == publishers ? _self.publishers : publishers // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SubjectQueryResult implements DiagnosticableTreeMixin {

/// The number of results for this query
 int get total;/// The list of the subjects matching the query
@JsonKey(readValue: _readSubjectNames) List<String> get subjects;
/// Create a copy of SubjectQueryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectQueryResultCopyWith<SubjectQueryResult> get copyWith => _$SubjectQueryResultCopyWithImpl<SubjectQueryResult>(this as SubjectQueryResult, _$identity);

  /// Serializes this SubjectQueryResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubjectQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('subjects', subjects));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(subjects));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubjectQueryResult(total: $total, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $SubjectQueryResultCopyWith<$Res>  {
  factory $SubjectQueryResultCopyWith(SubjectQueryResult value, $Res Function(SubjectQueryResult) _then) = _$SubjectQueryResultCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(readValue: _readSubjectNames) List<String> subjects
});




}
/// @nodoc
class _$SubjectQueryResultCopyWithImpl<$Res>
    implements $SubjectQueryResultCopyWith<$Res> {
  _$SubjectQueryResultCopyWithImpl(this._self, this._then);

  final SubjectQueryResult _self;
  final $Res Function(SubjectQueryResult) _then;

/// Create a copy of SubjectQueryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectQueryResult].
extension SubjectQueryResultPatterns on SubjectQueryResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectQueryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectQueryResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectQueryResult value)  $default,){
final _that = this;
switch (_that) {
case _SubjectQueryResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectQueryResult value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectQueryResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readSubjectNames)  List<String> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectQueryResult() when $default != null:
return $default(_that.total,_that.subjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(readValue: _readSubjectNames)  List<String> subjects)  $default,) {final _that = this;
switch (_that) {
case _SubjectQueryResult():
return $default(_that.total,_that.subjects);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(readValue: _readSubjectNames)  List<String> subjects)?  $default,) {final _that = this;
switch (_that) {
case _SubjectQueryResult() when $default != null:
return $default(_that.total,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectQueryResult with DiagnosticableTreeMixin implements SubjectQueryResult {
   _SubjectQueryResult({required this.total, @JsonKey(readValue: _readSubjectNames) final  List<String> subjects = const []}): _subjects = subjects;
  factory _SubjectQueryResult.fromJson(Map<String, dynamic> json) => _$SubjectQueryResultFromJson(json);

/// The number of results for this query
@override final  int total;
/// The list of the subjects matching the query
 final  List<String> _subjects;
/// The list of the subjects matching the query
@override@JsonKey(readValue: _readSubjectNames) List<String> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}


/// Create a copy of SubjectQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectQueryResultCopyWith<_SubjectQueryResult> get copyWith => __$SubjectQueryResultCopyWithImpl<_SubjectQueryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectQueryResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubjectQueryResult'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('subjects', subjects));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectQueryResult&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_subjects));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubjectQueryResult(total: $total, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$SubjectQueryResultCopyWith<$Res> implements $SubjectQueryResultCopyWith<$Res> {
  factory _$SubjectQueryResultCopyWith(_SubjectQueryResult value, $Res Function(_SubjectQueryResult) _then) = __$SubjectQueryResultCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(readValue: _readSubjectNames) List<String> subjects
});




}
/// @nodoc
class __$SubjectQueryResultCopyWithImpl<$Res>
    implements _$SubjectQueryResultCopyWith<$Res> {
  __$SubjectQueryResultCopyWithImpl(this._self, this._then);

  final _SubjectQueryResult _self;
  final $Res Function(_SubjectQueryResult) _then;

/// Create a copy of SubjectQueryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? subjects = null,}) {
  return _then(_SubjectQueryResult(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Subject implements DiagnosticableTreeMixin {

/// The subject
 String get subject;/// The list of the books matching this subject
@JsonKey(readValue: _readSubjectBooks) List<Book> get books;
/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectCopyWith<Subject> get copyWith => _$SubjectCopyWithImpl<Subject>(this as Subject, _$identity);

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Subject'))
    ..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subject&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Subject(subject: $subject, books: $books)';
}


}

/// @nodoc
abstract mixin class $SubjectCopyWith<$Res>  {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) _then) = _$SubjectCopyWithImpl;
@useResult
$Res call({
 String subject,@JsonKey(readValue: _readSubjectBooks) List<Book> books
});




}
/// @nodoc
class _$SubjectCopyWithImpl<$Res>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._self, this._then);

  final Subject _self;
  final $Res Function(Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subject = null,Object? books = null,}) {
  return _then(_self.copyWith(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}

}


/// Adds pattern-matching-related methods to [Subject].
extension SubjectPatterns on Subject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subject value)  $default,){
final _that = this;
switch (_that) {
case _Subject():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subject value)?  $default,){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subject, @JsonKey(readValue: _readSubjectBooks)  List<Book> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.subject,_that.books);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subject, @JsonKey(readValue: _readSubjectBooks)  List<Book> books)  $default,) {final _that = this;
switch (_that) {
case _Subject():
return $default(_that.subject,_that.books);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subject, @JsonKey(readValue: _readSubjectBooks)  List<Book> books)?  $default,) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.subject,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subject with DiagnosticableTreeMixin implements Subject {
   _Subject({required this.subject, @JsonKey(readValue: _readSubjectBooks) final  List<Book> books = const []}): _books = books;
  factory _Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

/// The subject
@override final  String subject;
/// The list of the books matching this subject
 final  List<Book> _books;
/// The list of the books matching this subject
@override@JsonKey(readValue: _readSubjectBooks) List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectCopyWith<_Subject> get copyWith => __$SubjectCopyWithImpl<_Subject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Subject'))
    ..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('books', books));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subject&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(_books));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Subject(subject: $subject, books: $books)';
}


}

/// @nodoc
abstract mixin class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) _then) = __$SubjectCopyWithImpl;
@override @useResult
$Res call({
 String subject,@JsonKey(readValue: _readSubjectBooks) List<Book> books
});




}
/// @nodoc
class __$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(this._self, this._then);

  final _Subject _self;
  final $Res Function(_Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? books = null,}) {
  return _then(_Subject(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}


/// @nodoc
mixin _$ThemaEntry implements DiagnosticableTreeMixin {

 String get code; String get name;@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType get type;/// Whether this is the book's main subject; qualifiers are never main.
 bool get main;
/// Create a copy of ThemaEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemaEntryCopyWith<ThemaEntry> get copyWith => _$ThemaEntryCopyWithImpl<ThemaEntry>(this as ThemaEntry, _$identity);

  /// Serializes this ThemaEntry to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaEntry'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('main', main));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemaEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.main, main) || other.main == main));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,main);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaEntry(code: $code, name: $name, type: $type, main: $main)';
}


}

/// @nodoc
abstract mixin class $ThemaEntryCopyWith<$Res>  {
  factory $ThemaEntryCopyWith(ThemaEntry value, $Res Function(ThemaEntry) _then) = _$ThemaEntryCopyWithImpl;
@useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, bool main
});




}
/// @nodoc
class _$ThemaEntryCopyWithImpl<$Res>
    implements $ThemaEntryCopyWith<$Res> {
  _$ThemaEntryCopyWithImpl(this._self, this._then);

  final ThemaEntry _self;
  final $Res Function(ThemaEntry) _then;

/// Create a copy of ThemaEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? type = null,Object? main = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemaEntry].
extension ThemaEntryPatterns on ThemaEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemaEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemaEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemaEntry value)  $default,){
final _that = this;
switch (_that) {
case _ThemaEntry():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemaEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ThemaEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  bool main)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemaEntry() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.main);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  bool main)  $default,) {final _that = this;
switch (_that) {
case _ThemaEntry():
return $default(_that.code,_that.name,_that.type,_that.main);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  bool main)?  $default,) {final _that = this;
switch (_that) {
case _ThemaEntry() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.main);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemaEntry with DiagnosticableTreeMixin implements ThemaEntry {
   _ThemaEntry({required this.code, required this.name, @JsonKey(unknownEnumValue: ThemaType.unknown) required this.type, required this.main});
  factory _ThemaEntry.fromJson(Map<String, dynamic> json) => _$ThemaEntryFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey(unknownEnumValue: ThemaType.unknown) final  ThemaType type;
/// Whether this is the book's main subject; qualifiers are never main.
@override final  bool main;

/// Create a copy of ThemaEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemaEntryCopyWith<_ThemaEntry> get copyWith => __$ThemaEntryCopyWithImpl<_ThemaEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemaEntryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaEntry'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('main', main));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemaEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.main, main) || other.main == main));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,main);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaEntry(code: $code, name: $name, type: $type, main: $main)';
}


}

/// @nodoc
abstract mixin class _$ThemaEntryCopyWith<$Res> implements $ThemaEntryCopyWith<$Res> {
  factory _$ThemaEntryCopyWith(_ThemaEntry value, $Res Function(_ThemaEntry) _then) = __$ThemaEntryCopyWithImpl;
@override @useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, bool main
});




}
/// @nodoc
class __$ThemaEntryCopyWithImpl<$Res>
    implements _$ThemaEntryCopyWith<$Res> {
  __$ThemaEntryCopyWithImpl(this._self, this._then);

  final _ThemaEntry _self;
  final $Res Function(_ThemaEntry) _then;

/// Create a copy of ThemaEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? type = null,Object? main = null,}) {
  return _then(_ThemaEntry(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ThemaNode implements DiagnosticableTreeMixin {

 String get code; String get name;@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType get type; String? get parent;@JsonKey(name: 'has_children') bool get hasChildren;
/// Create a copy of ThemaNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemaNodeCopyWith<ThemaNode> get copyWith => _$ThemaNodeCopyWithImpl<ThemaNode>(this as ThemaNode, _$identity);

  /// Serializes this ThemaNode to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaNode'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parent', parent))..add(DiagnosticsProperty('hasChildren', hasChildren));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemaNode&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.hasChildren, hasChildren) || other.hasChildren == hasChildren));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,parent,hasChildren);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaNode(code: $code, name: $name, type: $type, parent: $parent, hasChildren: $hasChildren)';
}


}

/// @nodoc
abstract mixin class $ThemaNodeCopyWith<$Res>  {
  factory $ThemaNodeCopyWith(ThemaNode value, $Res Function(ThemaNode) _then) = _$ThemaNodeCopyWithImpl;
@useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, String? parent,@JsonKey(name: 'has_children') bool hasChildren
});




}
/// @nodoc
class _$ThemaNodeCopyWithImpl<$Res>
    implements $ThemaNodeCopyWith<$Res> {
  _$ThemaNodeCopyWithImpl(this._self, this._then);

  final ThemaNode _self;
  final $Res Function(ThemaNode) _then;

/// Create a copy of ThemaNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? type = null,Object? parent = freezed,Object? hasChildren = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String?,hasChildren: null == hasChildren ? _self.hasChildren : hasChildren // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemaNode].
extension ThemaNodePatterns on ThemaNode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemaNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemaNode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemaNode value)  $default,){
final _that = this;
switch (_that) {
case _ThemaNode():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemaNode value)?  $default,){
final _that = this;
switch (_that) {
case _ThemaNode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent, @JsonKey(name: 'has_children')  bool hasChildren)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemaNode() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.parent,_that.hasChildren);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent, @JsonKey(name: 'has_children')  bool hasChildren)  $default,) {final _that = this;
switch (_that) {
case _ThemaNode():
return $default(_that.code,_that.name,_that.type,_that.parent,_that.hasChildren);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent, @JsonKey(name: 'has_children')  bool hasChildren)?  $default,) {final _that = this;
switch (_that) {
case _ThemaNode() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.parent,_that.hasChildren);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemaNode with DiagnosticableTreeMixin implements ThemaNode {
   _ThemaNode({required this.code, required this.name, @JsonKey(unknownEnumValue: ThemaType.unknown) required this.type, this.parent, @JsonKey(name: 'has_children') required this.hasChildren});
  factory _ThemaNode.fromJson(Map<String, dynamic> json) => _$ThemaNodeFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey(unknownEnumValue: ThemaType.unknown) final  ThemaType type;
@override final  String? parent;
@override@JsonKey(name: 'has_children') final  bool hasChildren;

/// Create a copy of ThemaNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemaNodeCopyWith<_ThemaNode> get copyWith => __$ThemaNodeCopyWithImpl<_ThemaNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemaNodeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaNode'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parent', parent))..add(DiagnosticsProperty('hasChildren', hasChildren));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemaNode&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.hasChildren, hasChildren) || other.hasChildren == hasChildren));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,parent,hasChildren);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaNode(code: $code, name: $name, type: $type, parent: $parent, hasChildren: $hasChildren)';
}


}

/// @nodoc
abstract mixin class _$ThemaNodeCopyWith<$Res> implements $ThemaNodeCopyWith<$Res> {
  factory _$ThemaNodeCopyWith(_ThemaNode value, $Res Function(_ThemaNode) _then) = __$ThemaNodeCopyWithImpl;
@override @useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, String? parent,@JsonKey(name: 'has_children') bool hasChildren
});




}
/// @nodoc
class __$ThemaNodeCopyWithImpl<$Res>
    implements _$ThemaNodeCopyWith<$Res> {
  __$ThemaNodeCopyWithImpl(this._self, this._then);

  final _ThemaNode _self;
  final $Res Function(_ThemaNode) _then;

/// Create a copy of ThemaNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? type = null,Object? parent = freezed,Object? hasChildren = null,}) {
  return _then(_ThemaNode(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String?,hasChildren: null == hasChildren ? _self.hasChildren : hasChildren // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ThemaListResponse implements DiagnosticableTreeMixin {

 int get total; int get page;@JsonKey(name: 'page_size') int get pageSize; List<ThemaNode> get codes;
/// Create a copy of ThemaListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemaListResponseCopyWith<ThemaListResponse> get copyWith => _$ThemaListResponseCopyWithImpl<ThemaListResponse>(this as ThemaListResponse, _$identity);

  /// Serializes this ThemaListResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaListResponse'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('codes', codes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemaListResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.codes, codes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(codes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaListResponse(total: $total, page: $page, pageSize: $pageSize, codes: $codes)';
}


}

/// @nodoc
abstract mixin class $ThemaListResponseCopyWith<$Res>  {
  factory $ThemaListResponseCopyWith(ThemaListResponse value, $Res Function(ThemaListResponse) _then) = _$ThemaListResponseCopyWithImpl;
@useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<ThemaNode> codes
});




}
/// @nodoc
class _$ThemaListResponseCopyWithImpl<$Res>
    implements $ThemaListResponseCopyWith<$Res> {
  _$ThemaListResponseCopyWithImpl(this._self, this._then);

  final ThemaListResponse _self;
  final $Res Function(ThemaListResponse) _then;

/// Create a copy of ThemaListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? codes = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,codes: null == codes ? _self.codes : codes // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemaListResponse].
extension ThemaListResponsePatterns on ThemaListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemaListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemaListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemaListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ThemaListResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemaListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ThemaListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ThemaNode> codes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemaListResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.codes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ThemaNode> codes)  $default,) {final _that = this;
switch (_that) {
case _ThemaListResponse():
return $default(_that.total,_that.page,_that.pageSize,_that.codes);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ThemaNode> codes)?  $default,) {final _that = this;
switch (_that) {
case _ThemaListResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.codes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemaListResponse with DiagnosticableTreeMixin implements ThemaListResponse {
   _ThemaListResponse({required this.total, required this.page, @JsonKey(name: 'page_size') required this.pageSize, final  List<ThemaNode> codes = const []}): _codes = codes;
  factory _ThemaListResponse.fromJson(Map<String, dynamic> json) => _$ThemaListResponseFromJson(json);

@override final  int total;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
 final  List<ThemaNode> _codes;
@override@JsonKey() List<ThemaNode> get codes {
  if (_codes is EqualUnmodifiableListView) return _codes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codes);
}


/// Create a copy of ThemaListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemaListResponseCopyWith<_ThemaListResponse> get copyWith => __$ThemaListResponseCopyWithImpl<_ThemaListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemaListResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaListResponse'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('codes', codes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemaListResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._codes, _codes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(_codes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaListResponse(total: $total, page: $page, pageSize: $pageSize, codes: $codes)';
}


}

/// @nodoc
abstract mixin class _$ThemaListResponseCopyWith<$Res> implements $ThemaListResponseCopyWith<$Res> {
  factory _$ThemaListResponseCopyWith(_ThemaListResponse value, $Res Function(_ThemaListResponse) _then) = __$ThemaListResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<ThemaNode> codes
});




}
/// @nodoc
class __$ThemaListResponseCopyWithImpl<$Res>
    implements _$ThemaListResponseCopyWith<$Res> {
  __$ThemaListResponseCopyWithImpl(this._self, this._then);

  final _ThemaListResponse _self;
  final $Res Function(_ThemaListResponse) _then;

/// Create a copy of ThemaListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? codes = null,}) {
  return _then(_ThemaListResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,codes: null == codes ? _self._codes : codes // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,
  ));
}


}


/// @nodoc
mixin _$ThemaDetailsResponse implements DiagnosticableTreeMixin {

 String get code; String get name;@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType get type; String? get parent; List<ThemaNode> get ancestors; List<ThemaNode> get children;/// The requested retired code, when the API returned its replacement.
@JsonKey(name: 'replaced_from') String? get replacedFrom;
/// Create a copy of ThemaDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemaDetailsResponseCopyWith<ThemaDetailsResponse> get copyWith => _$ThemaDetailsResponseCopyWithImpl<ThemaDetailsResponse>(this as ThemaDetailsResponse, _$identity);

  /// Serializes this ThemaDetailsResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaDetailsResponse'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parent', parent))..add(DiagnosticsProperty('ancestors', ancestors))..add(DiagnosticsProperty('children', children))..add(DiagnosticsProperty('replacedFrom', replacedFrom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemaDetailsResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other.ancestors, ancestors)&&const DeepCollectionEquality().equals(other.children, children)&&(identical(other.replacedFrom, replacedFrom) || other.replacedFrom == replacedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,parent,const DeepCollectionEquality().hash(ancestors),const DeepCollectionEquality().hash(children),replacedFrom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaDetailsResponse(code: $code, name: $name, type: $type, parent: $parent, ancestors: $ancestors, children: $children, replacedFrom: $replacedFrom)';
}


}

/// @nodoc
abstract mixin class $ThemaDetailsResponseCopyWith<$Res>  {
  factory $ThemaDetailsResponseCopyWith(ThemaDetailsResponse value, $Res Function(ThemaDetailsResponse) _then) = _$ThemaDetailsResponseCopyWithImpl;
@useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, String? parent, List<ThemaNode> ancestors, List<ThemaNode> children,@JsonKey(name: 'replaced_from') String? replacedFrom
});




}
/// @nodoc
class _$ThemaDetailsResponseCopyWithImpl<$Res>
    implements $ThemaDetailsResponseCopyWith<$Res> {
  _$ThemaDetailsResponseCopyWithImpl(this._self, this._then);

  final ThemaDetailsResponse _self;
  final $Res Function(ThemaDetailsResponse) _then;

/// Create a copy of ThemaDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? type = null,Object? parent = freezed,Object? ancestors = null,Object? children = null,Object? replacedFrom = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String?,ancestors: null == ancestors ? _self.ancestors : ancestors // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,replacedFrom: freezed == replacedFrom ? _self.replacedFrom : replacedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemaDetailsResponse].
extension ThemaDetailsResponsePatterns on ThemaDetailsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemaDetailsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemaDetailsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemaDetailsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ThemaDetailsResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemaDetailsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ThemaDetailsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent,  List<ThemaNode> ancestors,  List<ThemaNode> children, @JsonKey(name: 'replaced_from')  String? replacedFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemaDetailsResponse() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.parent,_that.ancestors,_that.children,_that.replacedFrom);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent,  List<ThemaNode> ancestors,  List<ThemaNode> children, @JsonKey(name: 'replaced_from')  String? replacedFrom)  $default,) {final _that = this;
switch (_that) {
case _ThemaDetailsResponse():
return $default(_that.code,_that.name,_that.type,_that.parent,_that.ancestors,_that.children,_that.replacedFrom);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name, @JsonKey(unknownEnumValue: ThemaType.unknown)  ThemaType type,  String? parent,  List<ThemaNode> ancestors,  List<ThemaNode> children, @JsonKey(name: 'replaced_from')  String? replacedFrom)?  $default,) {final _that = this;
switch (_that) {
case _ThemaDetailsResponse() when $default != null:
return $default(_that.code,_that.name,_that.type,_that.parent,_that.ancestors,_that.children,_that.replacedFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemaDetailsResponse with DiagnosticableTreeMixin implements ThemaDetailsResponse {
   _ThemaDetailsResponse({required this.code, required this.name, @JsonKey(unknownEnumValue: ThemaType.unknown) required this.type, this.parent, final  List<ThemaNode> ancestors = const [], final  List<ThemaNode> children = const [], @JsonKey(name: 'replaced_from') this.replacedFrom}): _ancestors = ancestors,_children = children;
  factory _ThemaDetailsResponse.fromJson(Map<String, dynamic> json) => _$ThemaDetailsResponseFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey(unknownEnumValue: ThemaType.unknown) final  ThemaType type;
@override final  String? parent;
 final  List<ThemaNode> _ancestors;
@override@JsonKey() List<ThemaNode> get ancestors {
  if (_ancestors is EqualUnmodifiableListView) return _ancestors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ancestors);
}

 final  List<ThemaNode> _children;
@override@JsonKey() List<ThemaNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

/// The requested retired code, when the API returned its replacement.
@override@JsonKey(name: 'replaced_from') final  String? replacedFrom;

/// Create a copy of ThemaDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemaDetailsResponseCopyWith<_ThemaDetailsResponse> get copyWith => __$ThemaDetailsResponseCopyWithImpl<_ThemaDetailsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemaDetailsResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaDetailsResponse'))
    ..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parent', parent))..add(DiagnosticsProperty('ancestors', ancestors))..add(DiagnosticsProperty('children', children))..add(DiagnosticsProperty('replacedFrom', replacedFrom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemaDetailsResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other._ancestors, _ancestors)&&const DeepCollectionEquality().equals(other._children, _children)&&(identical(other.replacedFrom, replacedFrom) || other.replacedFrom == replacedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,type,parent,const DeepCollectionEquality().hash(_ancestors),const DeepCollectionEquality().hash(_children),replacedFrom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaDetailsResponse(code: $code, name: $name, type: $type, parent: $parent, ancestors: $ancestors, children: $children, replacedFrom: $replacedFrom)';
}


}

/// @nodoc
abstract mixin class _$ThemaDetailsResponseCopyWith<$Res> implements $ThemaDetailsResponseCopyWith<$Res> {
  factory _$ThemaDetailsResponseCopyWith(_ThemaDetailsResponse value, $Res Function(_ThemaDetailsResponse) _then) = __$ThemaDetailsResponseCopyWithImpl;
@override @useResult
$Res call({
 String code, String name,@JsonKey(unknownEnumValue: ThemaType.unknown) ThemaType type, String? parent, List<ThemaNode> ancestors, List<ThemaNode> children,@JsonKey(name: 'replaced_from') String? replacedFrom
});




}
/// @nodoc
class __$ThemaDetailsResponseCopyWithImpl<$Res>
    implements _$ThemaDetailsResponseCopyWith<$Res> {
  __$ThemaDetailsResponseCopyWithImpl(this._self, this._then);

  final _ThemaDetailsResponse _self;
  final $Res Function(_ThemaDetailsResponse) _then;

/// Create a copy of ThemaDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? type = null,Object? parent = freezed,Object? ancestors = null,Object? children = null,Object? replacedFrom = freezed,}) {
  return _then(_ThemaDetailsResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThemaType,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String?,ancestors: null == ancestors ? _self._ancestors : ancestors // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ThemaNode>,replacedFrom: freezed == replacedFrom ? _self.replacedFrom : replacedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ThemaBooksResponse implements DiagnosticableTreeMixin {

 ThemaNode get thema; List<Book> get books; int get total; int get page;@JsonKey(name: 'page_size') int get pageSize;
/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemaBooksResponseCopyWith<ThemaBooksResponse> get copyWith => _$ThemaBooksResponseCopyWithImpl<ThemaBooksResponse>(this as ThemaBooksResponse, _$identity);

  /// Serializes this ThemaBooksResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaBooksResponse'))
    ..add(DiagnosticsProperty('thema', thema))..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemaBooksResponse&&(identical(other.thema, thema) || other.thema == thema)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thema,const DeepCollectionEquality().hash(books),total,page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaBooksResponse(thema: $thema, books: $books, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $ThemaBooksResponseCopyWith<$Res>  {
  factory $ThemaBooksResponseCopyWith(ThemaBooksResponse value, $Res Function(ThemaBooksResponse) _then) = _$ThemaBooksResponseCopyWithImpl;
@useResult
$Res call({
 ThemaNode thema, List<Book> books, int total, int page,@JsonKey(name: 'page_size') int pageSize
});


$ThemaNodeCopyWith<$Res> get thema;

}
/// @nodoc
class _$ThemaBooksResponseCopyWithImpl<$Res>
    implements $ThemaBooksResponseCopyWith<$Res> {
  _$ThemaBooksResponseCopyWithImpl(this._self, this._then);

  final ThemaBooksResponse _self;
  final $Res Function(ThemaBooksResponse) _then;

/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thema = null,Object? books = null,Object? total = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
thema: null == thema ? _self.thema : thema // ignore: cast_nullable_to_non_nullable
as ThemaNode,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemaNodeCopyWith<$Res> get thema {

  return $ThemaNodeCopyWith<$Res>(_self.thema, (value) {
    return _then(_self.copyWith(thema: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThemaBooksResponse].
extension ThemaBooksResponsePatterns on ThemaBooksResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemaBooksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemaBooksResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemaBooksResponse value)  $default,){
final _that = this;
switch (_that) {
case _ThemaBooksResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemaBooksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ThemaBooksResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemaNode thema,  List<Book> books,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemaBooksResponse() when $default != null:
return $default(_that.thema,_that.books,_that.total,_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemaNode thema,  List<Book> books,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _ThemaBooksResponse():
return $default(_that.thema,_that.books,_that.total,_that.page,_that.pageSize);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemaNode thema,  List<Book> books,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _ThemaBooksResponse() when $default != null:
return $default(_that.thema,_that.books,_that.total,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemaBooksResponse with DiagnosticableTreeMixin implements ThemaBooksResponse {
   _ThemaBooksResponse({required this.thema, final  List<Book> books = const [], required this.total, required this.page, @JsonKey(name: 'page_size') required this.pageSize}): _books = books;
  factory _ThemaBooksResponse.fromJson(Map<String, dynamic> json) => _$ThemaBooksResponseFromJson(json);

@override final  ThemaNode thema;
 final  List<Book> _books;
@override@JsonKey() List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override final  int total;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;

/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemaBooksResponseCopyWith<_ThemaBooksResponse> get copyWith => __$ThemaBooksResponseCopyWithImpl<_ThemaBooksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemaBooksResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ThemaBooksResponse'))
    ..add(DiagnosticsProperty('thema', thema))..add(DiagnosticsProperty('books', books))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemaBooksResponse&&(identical(other.thema, thema) || other.thema == thema)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thema,const DeepCollectionEquality().hash(_books),total,page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ThemaBooksResponse(thema: $thema, books: $books, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$ThemaBooksResponseCopyWith<$Res> implements $ThemaBooksResponseCopyWith<$Res> {
  factory _$ThemaBooksResponseCopyWith(_ThemaBooksResponse value, $Res Function(_ThemaBooksResponse) _then) = __$ThemaBooksResponseCopyWithImpl;
@override @useResult
$Res call({
 ThemaNode thema, List<Book> books, int total, int page,@JsonKey(name: 'page_size') int pageSize
});


@override $ThemaNodeCopyWith<$Res> get thema;

}
/// @nodoc
class __$ThemaBooksResponseCopyWithImpl<$Res>
    implements _$ThemaBooksResponseCopyWith<$Res> {
  __$ThemaBooksResponseCopyWithImpl(this._self, this._then);

  final _ThemaBooksResponse _self;
  final $Res Function(_ThemaBooksResponse) _then;

/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thema = null,Object? books = null,Object? total = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_ThemaBooksResponse(
thema: null == thema ? _self.thema : thema // ignore: cast_nullable_to_non_nullable
as ThemaNode,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ThemaBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemaNodeCopyWith<$Res> get thema {

  return $ThemaNodeCopyWith<$Res>(_self.thema, (value) {
    return _then(_self.copyWith(thema: value));
  });
}
}


/// @nodoc
mixin _$UpdatedBook implements DiagnosticableTreeMixin {

/// Updated book ISBN-13.
 String get isbn13;/// Timestamp when the book was last updated by ISBNdb.
@JsonKey(name: 'updated_at') DateTime get updatedAt;/// Kind of update; unknown for older responses or unrecognized values.
@JsonKey(unknownEnumValue: UpdatedBookStatus.unknown) UpdatedBookStatus get status;
/// Create a copy of UpdatedBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedBookCopyWith<UpdatedBook> get copyWith => _$UpdatedBookCopyWithImpl<UpdatedBook>(this as UpdatedBook, _$identity);

  /// Serializes this UpdatedBook to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdatedBook'))
    ..add(DiagnosticsProperty('isbn13', isbn13))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedBook&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isbn13,updatedAt,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdatedBook(isbn13: $isbn13, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdatedBookCopyWith<$Res>  {
  factory $UpdatedBookCopyWith(UpdatedBook value, $Res Function(UpdatedBook) _then) = _$UpdatedBookCopyWithImpl;
@useResult
$Res call({
 String isbn13,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(unknownEnumValue: UpdatedBookStatus.unknown) UpdatedBookStatus status
});




}
/// @nodoc
class _$UpdatedBookCopyWithImpl<$Res>
    implements $UpdatedBookCopyWith<$Res> {
  _$UpdatedBookCopyWithImpl(this._self, this._then);

  final UpdatedBook _self;
  final $Res Function(UpdatedBook) _then;

/// Create a copy of UpdatedBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isbn13 = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UpdatedBookStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatedBook].
extension UpdatedBookPatterns on UpdatedBook {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatedBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatedBook() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatedBook value)  $default,){
final _that = this;
switch (_that) {
case _UpdatedBook():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatedBook value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatedBook() when $default != null:
return $default(_that);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatedBook extends UpdatedBook with DiagnosticableTreeMixin {
   _UpdatedBook({required this.isbn13, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(unknownEnumValue: UpdatedBookStatus.unknown) this.status = UpdatedBookStatus.unknown}): super._();
  factory _UpdatedBook.fromJson(Map<String, dynamic> json) => _$UpdatedBookFromJson(json);

/// Updated book ISBN-13.
@override final  String isbn13;
/// Timestamp when the book was last updated by ISBNdb.
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
/// Kind of update; unknown for older responses or unrecognized values.
@override@JsonKey(unknownEnumValue: UpdatedBookStatus.unknown) final  UpdatedBookStatus status;

/// Create a copy of UpdatedBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedBookCopyWith<_UpdatedBook> get copyWith => __$UpdatedBookCopyWithImpl<_UpdatedBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatedBookToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdatedBook'))
    ..add(DiagnosticsProperty('isbn13', isbn13))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatedBook&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isbn13,updatedAt,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdatedBook(isbn13: $isbn13, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdatedBookCopyWith<$Res> implements $UpdatedBookCopyWith<$Res> {
  factory _$UpdatedBookCopyWith(_UpdatedBook value, $Res Function(_UpdatedBook) _then) = __$UpdatedBookCopyWithImpl;
@override @useResult
$Res call({
 String isbn13,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(unknownEnumValue: UpdatedBookStatus.unknown) UpdatedBookStatus status
});




}
/// @nodoc
class __$UpdatedBookCopyWithImpl<$Res>
    implements _$UpdatedBookCopyWith<$Res> {
  __$UpdatedBookCopyWithImpl(this._self, this._then);

  final _UpdatedBook _self;
  final $Res Function(_UpdatedBook) _then;

/// Create a copy of UpdatedBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isbn13 = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_UpdatedBook(
isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UpdatedBookStatus,
  ));
}


}


/// @nodoc
mixin _$UpdatedBookFeed implements DiagnosticableTreeMixin {

/// Updated ISBN entries.
@JsonKey(name: 'data') List<UpdatedBook> get updates;/// Total number of updates available for the query, when provided.
 int? get total;/// Opaque cursor for the next page; null when no more updates remain.
 String? get next;/// Legacy offset page number, defaulting to 1 for cursor-only responses.
/// ISBNdb API 2.9.0 no longer returns this field.
@Deprecated('Use next for cursor pagination instead.') int get page;/// Requested page size.
@JsonKey(name: 'page_size') int get pageSize;
/// Create a copy of UpdatedBookFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedBookFeedCopyWith<UpdatedBookFeed> get copyWith => _$UpdatedBookFeedCopyWithImpl<UpdatedBookFeed>(this as UpdatedBookFeed, _$identity);

  /// Serializes this UpdatedBookFeed to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdatedBookFeed'))
    ..add(DiagnosticsProperty('updates', updates))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('next', next))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedBookFeed&&const DeepCollectionEquality().equals(other.updates, updates)&&(identical(other.total, total) || other.total == total)&&(identical(other.next, next) || other.next == next)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(updates),total,next,page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdatedBookFeed(updates: $updates, total: $total, next: $next, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $UpdatedBookFeedCopyWith<$Res>  {
  factory $UpdatedBookFeedCopyWith(UpdatedBookFeed value, $Res Function(UpdatedBookFeed) _then) = _$UpdatedBookFeedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') List<UpdatedBook> updates, int? total, String? next,@Deprecated('Use next for cursor pagination instead.') int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class _$UpdatedBookFeedCopyWithImpl<$Res>
    implements $UpdatedBookFeedCopyWith<$Res> {
  _$UpdatedBookFeedCopyWithImpl(this._self, this._then);

  final UpdatedBookFeed _self;
  final $Res Function(UpdatedBookFeed) _then;

/// Create a copy of UpdatedBookFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updates = null,Object? total = freezed,Object? next = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
updates: null == updates ? _self.updates : updates // ignore: cast_nullable_to_non_nullable
as List<UpdatedBook>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatedBookFeed].
extension UpdatedBookFeedPatterns on UpdatedBookFeed {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatedBookFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatedBookFeed() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatedBookFeed value)  $default,){
final _that = this;
switch (_that) {
case _UpdatedBookFeed():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatedBookFeed value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatedBookFeed() when $default != null:
return $default(_that);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatedBookFeed extends UpdatedBookFeed with DiagnosticableTreeMixin {
   _UpdatedBookFeed({@JsonKey(name: 'data') final  List<UpdatedBook> updates = const [], this.total, this.next, @Deprecated('Use next for cursor pagination instead.') this.page = 1, @JsonKey(name: 'page_size') required this.pageSize}): _updates = updates,super._();
  factory _UpdatedBookFeed.fromJson(Map<String, dynamic> json) => _$UpdatedBookFeedFromJson(json);

/// Updated ISBN entries.
 final  List<UpdatedBook> _updates;
/// Updated ISBN entries.
@override@JsonKey(name: 'data') List<UpdatedBook> get updates {
  if (_updates is EqualUnmodifiableListView) return _updates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_updates);
}

/// Total number of updates available for the query, when provided.
@override final  int? total;
/// Opaque cursor for the next page; null when no more updates remain.
@override final  String? next;
/// Legacy offset page number, defaulting to 1 for cursor-only responses.
/// ISBNdb API 2.9.0 no longer returns this field.
@override@JsonKey()@Deprecated('Use next for cursor pagination instead.') final  int page;
/// Requested page size.
@override@JsonKey(name: 'page_size') final  int pageSize;

/// Create a copy of UpdatedBookFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedBookFeedCopyWith<_UpdatedBookFeed> get copyWith => __$UpdatedBookFeedCopyWithImpl<_UpdatedBookFeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatedBookFeedToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdatedBookFeed'))
    ..add(DiagnosticsProperty('updates', updates))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('next', next))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatedBookFeed&&const DeepCollectionEquality().equals(other._updates, _updates)&&(identical(other.total, total) || other.total == total)&&(identical(other.next, next) || other.next == next)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_updates),total,next,page,pageSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdatedBookFeed(updates: $updates, total: $total, next: $next, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$UpdatedBookFeedCopyWith<$Res> implements $UpdatedBookFeedCopyWith<$Res> {
  factory _$UpdatedBookFeedCopyWith(_UpdatedBookFeed value, $Res Function(_UpdatedBookFeed) _then) = __$UpdatedBookFeedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') List<UpdatedBook> updates, int? total, String? next,@Deprecated('Use next for cursor pagination instead.') int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class __$UpdatedBookFeedCopyWithImpl<$Res>
    implements _$UpdatedBookFeedCopyWith<$Res> {
  __$UpdatedBookFeedCopyWithImpl(this._self, this._then);

  final _UpdatedBookFeed _self;
  final $Res Function(_UpdatedBookFeed) _then;

/// Create a copy of UpdatedBookFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updates = null,Object? total = freezed,Object? next = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_UpdatedBookFeed(
updates: null == updates ? _self._updates : updates // ignore: cast_nullable_to_non_nullable
as List<UpdatedBook>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

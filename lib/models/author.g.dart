// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Author _$_$_AuthorFromJson(Map<String, dynamic> json) {
  return _$_Author(
    author: json['author'] as String,
    books: (json['books'] as List<dynamic>?)
            ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'author': instance.author,
      'books': instance.books,
    };

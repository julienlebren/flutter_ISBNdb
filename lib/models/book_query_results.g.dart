// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_query_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookQueryResult _$$_BookQueryResultFromJson(Map<String, dynamic> json) =>
    _$_BookQueryResult(
      total: json['total'] as int,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BookQueryResultToJson(_$_BookQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'books': instance.books,
    };

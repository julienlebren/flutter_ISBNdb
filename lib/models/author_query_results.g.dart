// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_query_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorQueryResult _$_$_AuthorQueryResultFromJson(Map<String, dynamic> json) {
  return _$_AuthorQueryResult(
    total: json['total'] as int,
    authors:
        (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
  );
}

Map<String, dynamic> _$_$_AuthorQueryResultToJson(
        _$_AuthorQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'authors': instance.authors,
    };

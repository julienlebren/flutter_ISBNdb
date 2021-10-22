// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_query_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublisherQueryResult _$$_PublisherQueryResultFromJson(
        Map<String, dynamic> json) =>
    _$_PublisherQueryResult(
      total: json['total'] as int,
      publishers: (json['publishers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PublisherQueryResultToJson(
        _$_PublisherQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'publishers': instance.publishers,
    };

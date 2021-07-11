// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_query_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubjectQueryResult _$_$_SubjectQueryResultFromJson(
    Map<String, dynamic> json) {
  return _$_SubjectQueryResult(
    total: json['total'] as int,
    subjects: (json['subjects'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SubjectQueryResultToJson(
        _$_SubjectQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'subjects': instance.subjects,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subject _$_$_SubjectFromJson(Map<String, dynamic> json) {
  return _$_Subject(
    subject: json['subject'] as String,
    books: (json['books'] as List<dynamic>?)
            ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'books': instance.books,
    };

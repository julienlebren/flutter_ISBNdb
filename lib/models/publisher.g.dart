// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Publisher _$$_PublisherFromJson(Map<String, dynamic> json) => _$_Publisher(
      name: json['name'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PublisherToJson(_$_Publisher instance) =>
    <String, dynamic>{
      'name': instance.name,
      'books': instance.books,
    };

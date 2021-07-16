// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$_$_BookFromJson(Map<String, dynamic> json) {
  return _$_Book(
    title: json['title'] as String,
    titleLong: json['title_long'] as String?,
    isbn: json['isbn'] as String,
    isbn13: json['isbn13'] as String,
    deweyDecimal: json['dewey_decimal'] as String?,
    binding: json['binding'] as String?,
    publisher: json['publisher'] as String?,
    language: json['language'] as String?,
    datePublished: const DateConverter().fromJson(json['date_published']),
    edition: json['edition'] as String?,
    pages: json['pages'] as int?,
    dimensions: json['dimensions'] as String?,
    overview: json['overview'] as String?,
    image: json['image'] as String?,
    msrp: const MsrpConverter().fromJson(json['msrp']),
    excerpt: json['excerpt'] as String?,
    synopsys: json['synopsys'] as String?,
    authors:
        (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    subjects:
        (json['subjects'] as List<dynamic>?)?.map((e) => e as String).toList(),
    reviews:
        (json['reviews'] as List<dynamic>?)?.map((e) => e as String).toList(),
    prices: (json['prices'] as List<dynamic>?)
        ?.map((e) => Merchant.fromJson(e as Map<String, dynamic>))
        .toList(),
    related:
        (json['related'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'title_long': instance.titleLong,
      'isbn': instance.isbn,
      'isbn13': instance.isbn13,
      'dewey_decimal': instance.deweyDecimal,
      'binding': instance.binding,
      'publisher': instance.publisher,
      'language': instance.language,
      'date_published': const DateConverter().toJson(instance.datePublished),
      'edition': instance.edition,
      'pages': instance.pages,
      'dimensions': instance.dimensions,
      'overview': instance.overview,
      'image': instance.image,
      'msrp': const MsrpConverter().toJson(instance.msrp),
      'excerpt': instance.excerpt,
      'synopsys': instance.synopsys,
      'authors': instance.authors,
      'subjects': instance.subjects,
      'reviews': instance.reviews,
      'prices': instance.prices,
      'related': instance.related,
    };

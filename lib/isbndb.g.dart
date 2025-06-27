// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isbndb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthorQueryResult _$AuthorQueryResultFromJson(Map<String, dynamic> json) =>
    _AuthorQueryResult(
      total: (json['total'] as num).toInt(),
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AuthorQueryResultToJson(_AuthorQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'authors': instance.authors,
    };

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
      author: json['author'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
      'author': instance.author,
      'books': instance.books,
    };

_BookQueryResult _$BookQueryResultFromJson(Map<String, dynamic> json) =>
    _BookQueryResult(
      total: (json['total'] as num).toInt(),
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BookQueryResultToJson(_BookQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'books': instance.books,
    };

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
      title: json['title'] as String,
      titleLong: json['title_long'] as String?,
      isbn: json['isbn'] as String,
      isbn13: json['isbn13'] as String,
      deweyDecimal: json['dewey_decimal'] as String?,
      binding: json['binding'] as String?,
      publisher: json['publisher'] as String?,
      language: json['language'] as String?,
      datePublished: const _DateConverter().fromJson(json['date_published']),
      edition: json['edition'] as String?,
      pages: (json['pages'] as num?)?.toInt(),
      dimensions: json['dimensions'] as String?,
      overview: json['overview'] as String?,
      image: json['image'] as String?,
      msrp: const _MsrpConverter().fromJson(json['msrp']),
      excerpt: json['excerpt'] as String?,
      synopsys: json['synopsys'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviews:
          (json['reviews'] as List<dynamic>?)?.map((e) => e as String).toList(),
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => Merchant.fromJson(e as Map<String, dynamic>))
          .toList(),
      related:
          (json['related'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
      'title': instance.title,
      'title_long': instance.titleLong,
      'isbn': instance.isbn,
      'isbn13': instance.isbn13,
      'dewey_decimal': instance.deweyDecimal,
      'binding': instance.binding,
      'publisher': instance.publisher,
      'language': instance.language,
      'date_published': const _DateConverter().toJson(instance.datePublished),
      'edition': instance.edition,
      'pages': instance.pages,
      'dimensions': instance.dimensions,
      'overview': instance.overview,
      'image': instance.image,
      'msrp': const _MsrpConverter().toJson(instance.msrp),
      'excerpt': instance.excerpt,
      'synopsys': instance.synopsys,
      'authors': instance.authors,
      'subjects': instance.subjects,
      'reviews': instance.reviews,
      'prices': instance.prices,
      'related': instance.related,
    };

_Merchant _$MerchantFromJson(Map<String, dynamic> json) => _Merchant(
      condition: json['condition'] as String,
      merchant: json['merchant'] as String,
      merchantLogo: json['merchant_logo'] as String,
      merchantLogoOffset: json['merchant_logo_offset'] as Map<String, dynamic>,
      shipping: json['shipping'] as String,
      price: json['price'] as String,
      total: json['total'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$MerchantToJson(_Merchant instance) => <String, dynamic>{
      'condition': instance.condition,
      'merchant': instance.merchant,
      'merchant_logo': instance.merchantLogo,
      'merchant_logo_offset': instance.merchantLogoOffset,
      'shipping': instance.shipping,
      'price': instance.price,
      'total': instance.total,
      'link': instance.link,
    };

_PublisherQueryResult _$PublisherQueryResultFromJson(
        Map<String, dynamic> json) =>
    _PublisherQueryResult(
      total: (json['total'] as num).toInt(),
      publishers: (json['publishers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PublisherQueryResultToJson(
        _PublisherQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'publishers': instance.publishers,
    };

_Publisher _$PublisherFromJson(Map<String, dynamic> json) => _Publisher(
      name: json['name'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PublisherToJson(_Publisher instance) =>
    <String, dynamic>{
      'name': instance.name,
      'books': instance.books,
    };

_SubjectQueryResult _$SubjectQueryResultFromJson(Map<String, dynamic> json) =>
    _SubjectQueryResult(
      total: (json['total'] as num).toInt(),
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubjectQueryResultToJson(_SubjectQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'subjects': instance.subjects,
    };

_Subject _$SubjectFromJson(Map<String, dynamic> json) => _Subject(
      subject: json['subject'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubjectToJson(_Subject instance) => <String, dynamic>{
      'subject': instance.subject,
      'books': instance.books,
    };

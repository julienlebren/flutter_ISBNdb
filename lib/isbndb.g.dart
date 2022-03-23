// GENERATED CODE - DO NOT MODIFY BY HAND

part of isbndb_flutter;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorQueryResult _$$_AuthorQueryResultFromJson(Map<String, dynamic> json) =>
    _$_AuthorQueryResult(
      total: json['total'] as int,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AuthorQueryResultToJson(
        _$_AuthorQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'authors': instance.authors,
    };

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      author: json['author'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'author': instance.author,
      'books': instance.books,
    };

_$_BookQueryResult _$$_BookQueryResultFromJson(Map<String, dynamic> json) =>
    _$_BookQueryResult(
      total: json['total'] as int,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BookQueryResultToJson(_$_BookQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'books': instance.books,
    };

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
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

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
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

_$_Merchant _$$_MerchantFromJson(Map<String, dynamic> json) => _$_Merchant(
      condition: json['condition'] as String,
      merchant: json['merchant'] as String,
      merchantLogo: json['merchant_logo'] as String,
      merchantLogoOffset: json['merchant_logo_offset'] as Map<String, dynamic>,
      shipping: json['shipping'] as String,
      price: json['price'] as String,
      total: json['total'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_MerchantToJson(_$_Merchant instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'merchant': instance.merchant,
      'merchant_logo': instance.merchantLogo,
      'merchant_logo_offset': instance.merchantLogoOffset,
      'shipping': instance.shipping,
      'price': instance.price,
      'total': instance.total,
      'link': instance.link,
    };

_$_PublisherQueryResult _$$_PublisherQueryResultFromJson(
        Map<String, dynamic> json) =>
    _$_PublisherQueryResult(
      total: json['total'] as int,
      publishers: (json['publishers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PublisherQueryResultToJson(
        _$_PublisherQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'publishers': instance.publishers,
    };

_$_Publisher _$$_PublisherFromJson(Map<String, dynamic> json) => _$_Publisher(
      name: json['name'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PublisherToJson(_$_Publisher instance) =>
    <String, dynamic>{
      'name': instance.name,
      'books': instance.books,
    };

_$_SubjectQueryResult _$$_SubjectQueryResultFromJson(
        Map<String, dynamic> json) =>
    _$_SubjectQueryResult(
      total: json['total'] as int,
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SubjectQueryResultToJson(
        _$_SubjectQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'subjects': instance.subjects,
    };

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      subject: json['subject'] as String,
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'books': instance.books,
    };

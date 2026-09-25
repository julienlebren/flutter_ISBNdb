// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isbndb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthorQueryResult _$AuthorQueryResultFromJson(Map<String, dynamic> json) =>
    _AuthorQueryResult(
      total: (json['total'] as num).toInt(),
      authors:
          (_readAuthorNames(json, 'authors') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AuthorQueryResultToJson(_AuthorQueryResult instance) =>
    <String, dynamic>{'total': instance.total, 'authors': instance.authors};

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
  author: json['author'] as String,
  books:
      (_readAuthorBooks(json, 'books') as List<dynamic>?)
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
      books:
          (_readBookQueryBooks(json, 'books') as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookQueryResultToJson(_BookQueryResult instance) =>
    <String, dynamic>{
      'total': instance.total,
      'books': instance.books,
      'page': ?instance.page,
      'page_size': ?instance.pageSize,
    };

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  title: json['title'] as String,
  titleLong: json['title_long'] as String?,
  isbn: json['isbn'] as String,
  isbn13: json['isbn13'] as String,
  deweyDecimal: const _DeweyDecimalConverter().fromJson(json['dewey_decimal']),
  binding: json['binding'] as String?,
  publisher: json['publisher'] as String?,
  language: json['language'] as String?,
  datePublished: const _DateConverter().fromJson(json['date_published']),
  edition: json['edition'] as String?,
  editionNumber: (json['edition_number'] as num?)?.toInt(),
  pages: (json['pages'] as num?)?.toInt(),
  dimensions: json['dimensions'] as String?,
  overview: json['overview'] as String?,
  image: json['image'] as String?,
  msrp: const _MsrpConverter().fromJson(json['msrp']),
  listPrice: json['list_price'] == null
      ? null
      : ListPrice.fromJson(json['list_price'] as Map<String, dynamic>),
  excerpt: json['excerpt'] as String?,
  synopsys: json['synopsys'] as String?,
  authors: (_readBookAuthors(json, 'authors') as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  subjects: (_readBookSubjects(json, 'subjects') as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  reviews: (_readBookReviews(json, 'reviews') as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  prices: (json['prices'] as List<dynamic>?)
      ?.map((e) => Merchant.fromJson(e as Map<String, dynamic>))
      .toList(),
  related: (_readBookRelated(json, 'related') as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'title': instance.title,
  'title_long': instance.titleLong,
  'isbn': instance.isbn,
  'isbn13': instance.isbn13,
  'dewey_decimal': const _DeweyDecimalConverter().toJson(instance.deweyDecimal),
  'binding': instance.binding,
  'publisher': instance.publisher,
  'language': instance.language,
  'date_published': const _DateConverter().toJson(instance.datePublished),
  'edition': instance.edition,
  'edition_number': instance.editionNumber,
  'pages': instance.pages,
  'dimensions': instance.dimensions,
  'overview': instance.overview,
  'image': instance.image,
  'msrp': const _MsrpConverter().toJson(instance.msrp),
  'list_price': instance.listPrice,
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
  Map<String, dynamic> json,
) => _PublisherQueryResult(
  total: (json['total'] as num).toInt(),
  publishers:
      (_readPublisherNames(json, 'publishers') as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$PublisherQueryResultToJson(
  _PublisherQueryResult instance,
) => <String, dynamic>{
  'total': instance.total,
  'publishers': instance.publishers,
};

_Publisher _$PublisherFromJson(Map<String, dynamic> json) => _Publisher(
  name: json['name'] as String,
  books:
      (_readPublisherBooks(json, 'books') as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PublisherToJson(_Publisher instance) =>
    <String, dynamic>{'name': instance.name, 'books': instance.books};

_KeyDetails _$KeyDetailsFromJson(Map<String, dynamic> json) => _KeyDetails(
  apiHost: json['api_host'] as String,
  planName: json['plan_name'] as String? ?? '',
  planLimit: PlanLimit.fromJson(json['plan_limit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$KeyDetailsToJson(_KeyDetails instance) =>
    <String, dynamic>{
      'api_host': instance.apiHost,
      'plan_name': instance.planName,
      'plan_limit': instance.planLimit,
    };

_ListPrice _$ListPriceFromJson(Map<String, dynamic> json) => _ListPrice(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$ListPriceToJson(_ListPrice instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};

_PlanLimit _$PlanLimitFromJson(Map<String, dynamic> json) => _PlanLimit(
  total: (json['total'] as num).toInt(),
  spent: (json['spent'] as num).toInt(),
  left: (json['left'] as num).toInt(),
  keyTotal: (json['key_total'] as num?)?.toInt(),
  keySpent: (json['key_spent'] as num?)?.toInt() ?? 0,
  keyLeft: (json['key_left'] as num?)?.toInt(),
  limitedBy:
      $enumDecodeNullable(
        _$PlanLimitAllowanceEnumMap,
        json['limited_by'],
        unknownValue: PlanLimitAllowance.unknown,
      ) ??
      PlanLimitAllowance.subject,
);

Map<String, dynamic> _$PlanLimitToJson(_PlanLimit instance) =>
    <String, dynamic>{
      'total': instance.total,
      'spent': instance.spent,
      'left': instance.left,
      'key_total': instance.keyTotal,
      'key_spent': instance.keySpent,
      'key_left': instance.keyLeft,
      'limited_by': _$PlanLimitAllowanceEnumMap[instance.limitedBy]!,
    };

const _$PlanLimitAllowanceEnumMap = {
  PlanLimitAllowance.subject: 'subject',
  PlanLimitAllowance.key: 'key',
  PlanLimitAllowance.unknown: 'unknown',
};

_Stats _$StatsFromJson(Map<String, dynamic> json) => _Stats(
  books: (json['books'] as num).toInt(),
  authors: (json['authors'] as num).toInt(),
  publishers: (json['publishers'] as num).toInt(),
  subjects: (json['subjects'] as num).toInt(),
);

Map<String, dynamic> _$StatsToJson(_Stats instance) => <String, dynamic>{
  'books': instance.books,
  'authors': instance.authors,
  'publishers': instance.publishers,
  'subjects': instance.subjects,
};

_SubjectQueryResult _$SubjectQueryResultFromJson(Map<String, dynamic> json) =>
    _SubjectQueryResult(
      total: (json['total'] as num).toInt(),
      subjects:
          (_readSubjectNames(json, 'subjects') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubjectQueryResultToJson(_SubjectQueryResult instance) =>
    <String, dynamic>{'total': instance.total, 'subjects': instance.subjects};

_Subject _$SubjectFromJson(Map<String, dynamic> json) => _Subject(
  subject: json['subject'] as String,
  books:
      (_readSubjectBooks(json, 'books') as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SubjectToJson(_Subject instance) => <String, dynamic>{
  'subject': instance.subject,
  'books': instance.books,
};

_UpdatedBook _$UpdatedBookFromJson(Map<String, dynamic> json) => _UpdatedBook(
  isbn13: json['isbn13'] as String,
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UpdatedBookToJson(_UpdatedBook instance) =>
    <String, dynamic>{
      'isbn13': instance.isbn13,
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_UpdatedBookFeed _$UpdatedBookFeedFromJson(Map<String, dynamic> json) =>
    _UpdatedBookFeed(
      updates:
          (json['data'] as List<dynamic>?)
              ?.map((e) => UpdatedBook.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
    );

Map<String, dynamic> _$UpdatedBookFeedToJson(_UpdatedBookFeed instance) =>
    <String, dynamic>{
      'data': instance.updates,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
    };

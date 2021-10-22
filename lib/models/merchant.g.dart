// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

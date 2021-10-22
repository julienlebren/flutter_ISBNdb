// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return _Merchant.fromJson(json);
}

/// @nodoc
class _$MerchantTearOff {
  const _$MerchantTearOff();

  _Merchant call(
      {required String condition,
      required String merchant,
      @JsonKey(name: 'merchant_logo')
          required String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          required Map<dynamic, dynamic> merchantLogoOffset,
      required String shipping,
      required String price,
      required String total,
      required String link}) {
    return _Merchant(
      condition: condition,
      merchant: merchant,
      merchantLogo: merchantLogo,
      merchantLogoOffset: merchantLogoOffset,
      shipping: shipping,
      price: price,
      total: total,
      link: link,
    );
  }

  Merchant fromJson(Map<String, Object?> json) {
    return Merchant.fromJson(json);
  }
}

/// @nodoc
const $Merchant = _$MerchantTearOff();

/// @nodoc
mixin _$Merchant {
  /// Not documented in the official API
  String get condition => throw _privateConstructorUsedError;

  /// Name of the seller of the book
  String get merchant => throw _privateConstructorUsedError;

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  String get merchantLogo => throw _privateConstructorUsedError;

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  Map<dynamic, dynamic> get merchantLogoOffset =>
      throw _privateConstructorUsedError;

  /// Shipping cost
  String get shipping => throw _privateConstructorUsedError;

  /// Price of the book
  String get price => throw _privateConstructorUsedError;

  /// Not documented in the official API
  String get total => throw _privateConstructorUsedError;

  /// Link to the purchase url
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantCopyWith<Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantCopyWith<$Res> {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) then) =
      _$MerchantCopyWithImpl<$Res>;
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo')
          String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class _$MerchantCopyWithImpl<$Res> implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._value, this._then);

  final Merchant _value;
  // ignore: unused_field
  final $Res Function(Merchant) _then;

  @override
  $Res call({
    Object? condition = freezed,
    Object? merchant = freezed,
    Object? merchantLogo = freezed,
    Object? merchantLogoOffset = freezed,
    Object? shipping = freezed,
    Object? price = freezed,
    Object? total = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: merchant == freezed
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: merchantLogo == freezed
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: merchantLogoOffset == freezed
          ? _value.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory _$MerchantCopyWith(_Merchant value, $Res Function(_Merchant) then) =
      __$MerchantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String condition,
      String merchant,
      @JsonKey(name: 'merchant_logo')
          String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          Map<dynamic, dynamic> merchantLogoOffset,
      String shipping,
      String price,
      String total,
      String link});
}

/// @nodoc
class __$MerchantCopyWithImpl<$Res> extends _$MerchantCopyWithImpl<$Res>
    implements _$MerchantCopyWith<$Res> {
  __$MerchantCopyWithImpl(_Merchant _value, $Res Function(_Merchant) _then)
      : super(_value, (v) => _then(v as _Merchant));

  @override
  _Merchant get _value => super._value as _Merchant;

  @override
  $Res call({
    Object? condition = freezed,
    Object? merchant = freezed,
    Object? merchantLogo = freezed,
    Object? merchantLogoOffset = freezed,
    Object? shipping = freezed,
    Object? price = freezed,
    Object? total = freezed,
    Object? link = freezed,
  }) {
    return _then(_Merchant(
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: merchant == freezed
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogo: merchantLogo == freezed
          ? _value.merchantLogo
          : merchantLogo // ignore: cast_nullable_to_non_nullable
              as String,
      merchantLogoOffset: merchantLogoOffset == freezed
          ? _value.merchantLogoOffset
          : merchantLogoOffset // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Merchant implements _Merchant {
  _$_Merchant(
      {required this.condition,
      required this.merchant,
      @JsonKey(name: 'merchant_logo') required this.merchantLogo,
      @JsonKey(name: 'merchant_logo_offset') required this.merchantLogoOffset,
      required this.shipping,
      required this.price,
      required this.total,
      required this.link});

  factory _$_Merchant.fromJson(Map<String, dynamic> json) =>
      _$$_MerchantFromJson(json);

  @override

  /// Not documented in the official API
  final String condition;
  @override

  /// Name of the seller of the book
  final String merchant;
  @override

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  final String merchantLogo;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  final Map<dynamic, dynamic> merchantLogoOffset;
  @override

  /// Shipping cost
  final String shipping;
  @override

  /// Price of the book
  final String price;
  @override

  /// Not documented in the official API
  final String total;
  @override

  /// Link to the purchase url
  final String link;

  @override
  String toString() {
    return 'Merchant(condition: $condition, merchant: $merchant, merchantLogo: $merchantLogo, merchantLogoOffset: $merchantLogoOffset, shipping: $shipping, price: $price, total: $total, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Merchant &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.merchantLogo, merchantLogo) ||
                other.merchantLogo == merchantLogo) &&
            const DeepCollectionEquality()
                .equals(other.merchantLogoOffset, merchantLogoOffset) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      condition,
      merchant,
      merchantLogo,
      const DeepCollectionEquality().hash(merchantLogoOffset),
      shipping,
      price,
      total,
      link);

  @JsonKey(ignore: true)
  @override
  _$MerchantCopyWith<_Merchant> get copyWith =>
      __$MerchantCopyWithImpl<_Merchant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerchantToJson(this);
  }
}

abstract class _Merchant implements Merchant {
  factory _Merchant(
      {required String condition,
      required String merchant,
      @JsonKey(name: 'merchant_logo')
          required String merchantLogo,
      @JsonKey(name: 'merchant_logo_offset')
          required Map<dynamic, dynamic> merchantLogoOffset,
      required String shipping,
      required String price,
      required String total,
      required String link}) = _$_Merchant;

  factory _Merchant.fromJson(Map<String, dynamic> json) = _$_Merchant.fromJson;

  @override

  /// Not documented in the official API
  String get condition;
  @override

  /// Name of the seller of the book
  String get merchant;
  @override

  /// URL of the merchant logo
  @JsonKey(name: 'merchant_logo')
  String get merchantLogo;
  @override

  /// Not documented in the official API
  @JsonKey(name: 'merchant_logo_offset')
  Map<dynamic, dynamic> get merchantLogoOffset;
  @override

  /// Shipping cost
  String get shipping;
  @override

  /// Price of the book
  String get price;
  @override

  /// Not documented in the official API
  String get total;
  @override

  /// Link to the purchase url
  String get link;
  @override
  @JsonKey(ignore: true)
  _$MerchantCopyWith<_Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

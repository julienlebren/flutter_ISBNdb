import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant.freezed.dart';
part 'merchant.g.dart';

/// An object which returns the details about a seller of a book on the web.
@freezed
class Merchant with _$Merchant {
  factory Merchant({
    required String condition,
    required String merchant,
    @JsonKey(name: 'merchant_logo') required String merchantLogo,
    @JsonKey(name: 'merchant_logo_offset') required Map merchantLogoOffset,
    required String shipping,
    required String price,
    required String total,
    required String link,
  }) = _Merchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}

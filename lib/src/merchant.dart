part of isbndb_flutter;

/// An object which returns the details about a seller of a book on the web.
@freezed
class Merchant with _$Merchant {
  factory Merchant({
    /// Not documented in the official API
    required String condition,

    /// Name of the seller of the book
    required String merchant,

    /// URL of the merchant logo
    @JsonKey(name: 'merchant_logo') required String merchantLogo,

    /// Not documented in the official API
    @JsonKey(name: 'merchant_logo_offset') required Map merchantLogoOffset,

    /// Shipping cost
    required String shipping,

    /// Price of the book
    required String price,

    /// Not documented in the official API
    required String total,

    /// Link to the purchase url
    required String link,
  }) = _Merchant;

  /// Used to build the object from the response of the ISBNdb API
  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}

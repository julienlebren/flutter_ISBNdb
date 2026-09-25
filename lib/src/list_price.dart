part of isbndb_flutter;

/// A book list price and its ISO 4217 currency.
@freezed
sealed class ListPrice with _$ListPrice {
  factory ListPrice({
    /// Price amount, rounded to two decimal places by ISBNdb.
    required double amount,

    /// ISO 4217 currency code.
    required String currency,
  }) = _ListPrice;

  /// Used to build the object from an ISBNdb API response.
  factory ListPrice.fromJson(Map<String, dynamic> json) =>
      _$ListPriceFromJson(json);
}

part of isbndb_flutter;

/// Account details returned by the `/key` endpoint.
@freezed
sealed class KeyDetails with _$KeyDetails {
  factory KeyDetails({
    /// API host tied to this key.
    @JsonKey(name: 'api_host') required String apiHost,

    /// Plan usage details.
    @JsonKey(name: 'plan_limit') required PlanLimit planLimit,
  }) = _KeyDetails;

  /// Used to build the object from the response of the ISBNdb API.
  factory KeyDetails.fromJson(Map<String, dynamic> json) =>
      _$KeyDetailsFromJson(json);
}

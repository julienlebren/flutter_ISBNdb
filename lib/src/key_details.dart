part of isbndb_flutter;

/// Account details returned by the `/key` endpoint.
@Freezed(when: FreezedWhenOptions.none)
sealed class KeyDetails with _$KeyDetails {
  const KeyDetails._();

  /// Destructure the details using the original three-field callback.
  /// Access [bulkLimit] directly for the maximum ISBN batch size.
  TResult when<TResult extends Object?>(
    TResult Function(String apiHost, String planName, PlanLimit planLimit)
    callback,
  ) => callback(apiHost, planName, planLimit);

  /// Invoke the original callback when supplied, otherwise use [orElse].
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String apiHost, String planName, PlanLimit planLimit)?
    callback, {
    required TResult Function() orElse,
  }) => callback == null ? orElse() : callback(apiHost, planName, planLimit);

  /// Invoke the original callback when supplied, otherwise return null.
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String apiHost, String planName, PlanLimit planLimit)?
    callback,
  ) => callback?.call(apiHost, planName, planLimit);

  factory KeyDetails({
    /// API host tied to this key.
    @JsonKey(name: 'api_host') required String apiHost,

    /// Name of the subscription plan attached to this key.
    ///
    /// Empty only for legacy payloads captured before API 2.7.1.
    @JsonKey(name: 'plan_name') @Default('') String planName,

    /// Plan usage details.
    @JsonKey(name: 'plan_limit') required PlanLimit planLimit,

    /// Maximum ISBNs accepted by one `POST /books` request.
    /// Null for older responses that do not report the limit.
    @JsonKey(name: 'bulk_limit') int? bulkLimit,
  }) = _KeyDetails;

  /// Used to build the object from the response of the ISBNdb API.
  factory KeyDetails.fromJson(Map<String, dynamic> json) =>
      _$KeyDetailsFromJson(json);
}

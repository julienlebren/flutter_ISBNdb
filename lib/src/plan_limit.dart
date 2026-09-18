part of isbndb_flutter;

/// Allowance that currently determines the remaining number of requests.
enum PlanLimitAllowance {
  /// The shared subscription allowance runs out first.
  subject,

  /// The allowance attached to this API key runs out first.
  key,

  /// A value introduced by a newer ISBNdb API version.
  unknown,
}

/// Usage limits attached to the current API plan.
@freezed
sealed class PlanLimit with _$PlanLimit {
  factory PlanLimit({
    /// Daily request allowance shared by every key in the subscription.
    required int total,

    /// Requests charged today across the subscription.
    required int spent,

    /// Requests remaining under the more restrictive active allowance.
    required int left,

    /// Daily allowance attached to this key, or `null` when it has no cap.
    @JsonKey(name: 'key_total') int? keyTotal,

    /// Requests charged today to this key.
    @JsonKey(name: 'key_spent') @Default(0) int keySpent,

    /// Requests remaining for this key, or `null` when it has no cap.
    @JsonKey(name: 'key_left') int? keyLeft,

    /// Allowance that currently determines [left].
    @JsonKey(name: 'limited_by', unknownEnumValue: PlanLimitAllowance.unknown)
    @Default(PlanLimitAllowance.subject)
    PlanLimitAllowance limitedBy,
  }) = _PlanLimit;

  /// Used to build the object from the response of the ISBNdb API.
  factory PlanLimit.fromJson(Map<String, dynamic> json) =>
      _$PlanLimitFromJson(json);
}

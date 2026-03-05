part of isbndb_flutter;

/// Usage limits attached to the current API plan.
@freezed
sealed class PlanLimit with _$PlanLimit {
  factory PlanLimit({
    /// Total number of requests available for the period.
    required int total,

    /// Number of requests already used.
    required int spent,

    /// Number of requests remaining.
    required int left,
  }) = _PlanLimit;

  /// Used to build the object from the response of the ISBNdb API.
  factory PlanLimit.fromJson(Map<String, dynamic> json) =>
      _$PlanLimitFromJson(json);
}

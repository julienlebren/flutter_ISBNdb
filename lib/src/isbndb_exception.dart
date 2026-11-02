part of isbndb_flutter;

/// Exception thrown when an ISBNdb API request fails.
class ISBNdbException implements Exception {
  const ISBNdbException({
    required this.message,
    required this.method,
    required this.path,
    this.statusCode,
    this.code,
    this.cause,
  });

  /// Human-readable error description.
  final String message;

  /// HTTP method used for the request.
  final String method;

  /// Relative API path (without base URL).
  final String path;

  /// Optional HTTP status code returned by the API.
  final int? statusCode;

  /// Machine-readable API reason, when provided.
  /// HTTP 429 uses `rate_limited` for the per-minute limit and
  /// `quota_exceeded` for the daily quota. Unknown future codes are preserved.
  final String? code;

  /// Original underlying error when available.
  final Object? cause;

  @override
  String toString() {
    final status = statusCode != null ? " [HTTP $statusCode]" : "";
    return "ISBNdbException$status $method $path: $message";
  }
}

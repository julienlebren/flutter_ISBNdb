part of isbndb_flutter;

/// An object which handle the details of a book
@freezed
sealed class Book with _$Book {
  factory Book({
    /// Title of the book
    required String title,

    /// Long version of the title
    @JsonKey(name: 'title_long') String? titleLong,

    /// ISBN of the book
    required String isbn,

    /// New 13-digit ISBN
    required String isbn13,

    /// Not documented in the official API
    @_DeweyDecimalConverter()
    @JsonKey(name: 'dewey_decimal')
    String? deweyDecimal,

    /// Not documented in the official API
    String? binding,

    /// The name of the publisher
    String? publisher,

    /// Language of the book
    String? language,

    /// Date when the book was published. Can be a year or a full date.
    @_DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,

    /// Details about the edition
    String? edition,

    /// Number of pages of the book
    int? pages,

    /// Dimensions of the book
    String? dimensions,

    /// Not documented in the official API
    String? overview,

    /// URL of the cover
    String? image,

    /// Not documented in the official API
    @_MsrpConverter() double? msrp,

    /// Excerpt of the book
    String? excerpt,

    /// Synopsys of the book
    String? synopsys,

    /// List of the authors of the book
    @JsonKey(readValue: _readAuthors) List<String?>? authors,

    /// List of the subjects of the book
    @JsonKey(readValue: _readSubjects) List<String>? subjects,

    /// Not documented in the official API
    @JsonKey(readValue: _readReviews) List<String>? reviews,

    /// List of the merchants selling this book with real-time prices
    List<Merchant>? prices,

    /// Not documented in the official API
    @JsonKey(readValue: _readRelated) List<String>? related,
  }) = _Book;

  /// Used to build the object from the response of the ISBNdb API
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  static Object? _readAuthors(Map<dynamic, dynamic> json, String key) {
    return _readListOrMapValues(json[key]);
  }

  static Object? _readSubjects(Map<dynamic, dynamic> json, String key) {
    return _readListOrMapValues(json[key]);
  }

  static Object? _readReviews(Map<dynamic, dynamic> json, String key) {
    return _readListOrMapValues(json[key]);
  }

  static Object? _readRelated(Map<dynamic, dynamic> json, String key) {
    return _readListOrMapValues(json[key]);
  }

  static Object? _readListOrMapValues(Object? value) {
    if (value is Map) {
      return value.values.toList();
    }
    return value;
  }
}

/// A json converter that handles the date_published field of the API
/// It can be either a year, a full date... so we need to handle this properly
/// to return always the same type.
@protected
class _DateConverter implements JsonConverter<DateTime?, dynamic> {
  const _DateConverter();

  @override
  DateTime? fromJson(dynamic value) {
    if (value is int) {
      return DateTime(value);
    } else if (value is String) {
      if (value.length == 4) {
        return DateTime(int.parse(value));
      } else if (value.length == 20) {
        return DateTime.parse(value.toUpperCase());
      }
    }
    return null;
  }

  @override
  dynamic toJson(DateTime? value) =>
      value != null ? DateFormat().format(value) : null;
}

/// A json converter that handles the msrp field of the API
/// It can be either a string, an int... so we need to handle this properly
/// to return always the same type.
class _MsrpConverter implements JsonConverter<double?, dynamic> {
  const _MsrpConverter();

  @override
  double? fromJson(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value.trim());
    }
    return null;
  }

  @override
  dynamic toJson(double? value) => value != null ? "$value" : null;
}

/// A json converter that handles the dewey field of the API
/// It can be either a string, an array of string...
/// so we need to handle this properly to return always the same type.
class _DeweyDecimalConverter implements JsonConverter<String?, dynamic> {
  const _DeweyDecimalConverter();

  @override
  String? fromJson(dynamic json) {
    if (json is String) return json;
    if (json is List && json.isNotEmpty && json.first is String) {
      return json.first as String;
    }
    return null;
  }

  @override
  dynamic toJson(String? value) => value;
}

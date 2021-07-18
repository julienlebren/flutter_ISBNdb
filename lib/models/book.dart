import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:isbndb/models/merchant.dart';

part 'book.freezed.dart';
part 'book.g.dart';

/// An object which handle the details of a book
@freezed
class Book with _$Book {
  factory Book({
    required String title,
    @JsonKey(name: 'title_long') String? titleLong,
    required String isbn,
    required String isbn13,
    @JsonKey(name: 'dewey_decimal') String? deweyDecimal,
    String? binding,
    String? publisher,
    String? language,
    @DateConverter() @JsonKey(name: 'date_published') DateTime? datePublished,
    String? edition,
    int? pages,
    String? dimensions,
    String? overview,
    String? image,
    @MsrpConverter() double? msrp,
    String? excerpt,
    String? synopsys,
    List<String>? authors,
    List<String>? subjects,
    List<String>? reviews,
    List<Merchant>? prices,
    List<String>? related,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

/// A json converter that handles the date_published field of the API
/// It can be either a year, a full date... so we need to handle this properly
/// to return always the same type.
class DateConverter implements JsonConverter<DateTime?, dynamic> {
  const DateConverter();

  @override
  DateTime? fromJson(dynamic value) {
    if (value is int) {
      return DateTime(value);
    } else if (value is String) {
      if (value.length == 4) {
        return DateTime(int.parse(value));
      } else if (value.length == 20) {
        return DateTime.parse(value);
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
class MsrpConverter implements JsonConverter<double?, dynamic> {
  const MsrpConverter();

  @override
  double? fromJson(dynamic value) {
    if (value != null) {
      if (value is String) {
        return double.parse(value);
      } else if (value is int) {
        return value.toDouble();
      }
    }
    return null;
  }

  @override
  dynamic toJson(double? value) => value != null ? "$value" : null;
}

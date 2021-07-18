import 'package:isbndb/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher.freezed.dart';
part 'publisher.g.dart';

/// An object which returns the name of a publisher and the list of the books he published.
@freezed
class Publisher with _$Publisher {
  factory Publisher({
    /// The name of this publisher
    required String name,

    /// The list of the books this publisher published
    @Default([]) List<Book> books,
  }) = _Publisher;

  /// Used to build the object from the response of the ISBNdb API
  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);
}

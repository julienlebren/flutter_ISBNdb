import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isbndb/models/book.dart';

part 'book_query_results.freezed.dart';
part 'book_query_results.g.dart';

@freezed
class BookQueryResult with _$BookQueryResult {
  factory BookQueryResult({
    required int total,
    @Default([]) List<Book> books,
  }) = _BookQueryResult;

  factory BookQueryResult.fromJson(Map<String, dynamic> json) =>
      _$BookQueryResultFromJson(json);
}

extension BookQueryResultX on BookQueryResult {
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return books.length > 0;
  }
}

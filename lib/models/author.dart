import 'package:isbndb/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';

/// An object which returns the name of an author and the list of the books he published.
@freezed
class Author with _$Author {
  factory Author({
    required String author,
    @Default([]) List<Book> books,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

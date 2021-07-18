import 'package:isbndb/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

/// An object which returns the name of a subject and the list of the books related to this subject.
@freezed
class Subject with _$Subject {
  factory Subject({
    /// The subject
    required String subject,

    /// The list of the books matching this subject
    @Default([]) List<Book> books,
  }) = _Subject;

  /// Used to build the object from the response of the ISBNdb API
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

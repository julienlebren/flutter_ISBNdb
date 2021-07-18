import 'package:isbndb/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

/// An object which returns the name of a subject and the list of the books related to this subject.
@freezed
class Subject with _$Subject {
  factory Subject({
    required String subject,
    @Default([]) List<Book> books,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

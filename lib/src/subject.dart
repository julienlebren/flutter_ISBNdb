part of isbndb_flutter;

/// An object which returns the name of a subject and the list of the books related to this subject.
@freezed
abstract class Subject with _$Subject {
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

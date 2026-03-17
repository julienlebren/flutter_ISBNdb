import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OpenAPI snapshot contract', () {
    late Map<String, dynamic> spec;

    setUpAll(() {
      spec = _readJsonFile('api/upstream/isbndb-openapi.json');
    });

    test('contains all public endpoints currently exposed by the package', () {
      final paths = _paths(spec).keys.toSet();

      expect(
        paths,
        containsAll(<String>{
          '/book/{isbn}',
          '/books',
          '/books/{query}',
          '/author/{name}',
          '/authors/{query}',
          '/publisher/{name}',
          '/publishers/{query}',
          '/subject/{name}',
          '/subjects/{query}',
          '/key',
          '/stats',
        }),
      );
    });

    test('/books/{query} documents all supported filters', () {
      final parameterNames = _parameterNames(spec, '/books/{query}', 'get');

      expect(
        parameterNames,
        containsAll(<String>{
          'query',
          'page',
          'pageSize',
          'year',
          'edition',
          'shouldMatchAll',
          'language',
          'column',
        }),
      );
    });

    test('/books keeps POST body contract for ISBN batch lookup', () {
      final postOperation = _operation(spec, '/books', 'post');
      final requestBody = Map<String, dynamic>.from(
        postOperation['requestBody'] as Map,
      );
      final content = Map<String, dynamic>.from(requestBody['content'] as Map);

      expect(content.keys, contains('application/json'));
      expect(content.keys, contains('application/x-www-form-urlencoded'));
    });
  });

  group('Live smoke fixtures', () {
    late Map<String, dynamic> fixtures;

    setUpAll(() {
      fixtures = _readJsonFile('api/smoke/known_queries.json');
    });

    test('contains known ISBN fixtures for single and batch requests', () {
      final books = Map<String, dynamic>.from(fixtures['books'] as Map);
      final singleIsbn = books['single_isbn13'] as String;
      final batchIsbns = List<String>.from(books['batch_isbn13'] as List);

      expect(singleIsbn, isNotEmpty);
      expect(batchIsbns, hasLength(greaterThanOrEqualTo(2)));
      expect(batchIsbns, contains(singleIsbn));
    });

    test(
      'contains detail fixtures for author, publisher and subject endpoints',
      () {
        final authors = Map<String, dynamic>.from(fixtures['authors'] as Map);
        final publishers = Map<String, dynamic>.from(
          fixtures['publishers'] as Map,
        );
        final subjects = Map<String, dynamic>.from(fixtures['subjects'] as Map);

        expect(authors['search_query'], isA<String>());
        expect(authors['detail_name'], isA<String>());
        expect(publishers['search_query'], isA<String>());
        expect(publishers['detail_name'], isA<String>());
        expect(subjects['search_query'], isA<String>());
        expect(subjects['detail_name'], isA<String>());
      },
    );
  });
}

Map<String, dynamic> _readJsonFile(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: 'Missing fixture file: $path');
  return Map<String, dynamic>.from(jsonDecode(file.readAsStringSync()) as Map);
}

Map<String, dynamic> _paths(Map<String, dynamic> spec) {
  return Map<String, dynamic>.from(spec['paths'] as Map);
}

Map<String, dynamic> _operation(
  Map<String, dynamic> spec,
  String path,
  String method,
) {
  final pathItem = Map<String, dynamic>.from(_paths(spec)[path] as Map);
  return Map<String, dynamic>.from(pathItem[method] as Map);
}

Set<String> _parameterNames(
  Map<String, dynamic> spec,
  String path,
  String method,
) {
  final operation = _operation(spec, path, method);
  final parameters = List<Map<String, dynamic>>.from(
    (operation['parameters'] as List).map(
      (item) => Map<String, dynamic>.from(item as Map),
    ),
  );
  return parameters.map((parameter) => parameter['name'] as String).toSet();
}

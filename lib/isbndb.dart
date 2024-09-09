library isbndb_flutter;

import 'dart:convert' show jsonDecode, utf8;
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart';

part 'isbndb.freezed.dart';
part 'isbndb.g.dart';

part 'src/author_query_results.dart';
part 'src/author.dart';
part 'src/book_column.dart';
part 'src/book_query_results.dart';
part 'src/book.dart';
part 'src/merchant.dart';
part 'src/publisher_query_results.dart';
part 'src/publisher.dart';
part 'src/service.dart';
part 'src/subject_query_results.dart';
part 'src/subject.dart';

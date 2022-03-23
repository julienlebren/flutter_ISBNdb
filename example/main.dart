import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:isbndb/isbndb.dart';

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoading = false;
  Book? book;
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.length == 13) {
        _search(value);
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> _search(String isbn) async {
    setState(() {
      isLoading = true;
      book = null;
    });

    final isbnDb = ISBNdb("your_key_here");

    try {
      final _book = await isbnDb.getBook(isbn);
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      setState(() {
        book = _book;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 18),
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "Type an ISBN...",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffixIcon: Container(
                child: IconButton(
                  onPressed: () {
                    textEditingController.clear();
                    setState(() {
                      book = null;
                    });
                  },
                  icon: Icon(Icons.clear, size: 28, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (book != null) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (book!.image != null)
                        Container(
                          height: 200,
                          width: 150,
                          child: Image.network(book!.image!),
                        ),
                      BookRow(label: "Title:", value: book!.title),
                      if (book!.authors != null)
                        BookRow(
                            label: "Author(s):",
                            value: book!.authors!.join(' - ')),
                      if (book!.pages != null)
                        BookRow(
                            label: "Number of pages:",
                            value: "${book!.pages!} pages"),
                      if (book!.publisher != null)
                        BookRow(label: "Publisher:", value: book!.publisher!),
                      if (book!.datePublished != null)
                        BookRow(
                            label: "Published on:",
                            value: DateFormat.yMMMMd()
                                .format(book!.datePublished!)),
                      if (book!.synopsys != null)
                        BookRow(label: "Synopsys:", value: book!.synopsys!),
                    ],
                  ),
                ),
              );
            } else {
              return Text("ISBN example to test this app: 9781092297370");
            }
          }),
        ),
      ),
    );
  }
}

class BookRow extends StatelessWidget {
  const BookRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

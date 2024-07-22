import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/withGolang/book_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Posfin Test',
      home: BookListView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hands_on/view/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hands on',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryPage(title: 'Flutter Hands on Page'),
    );
  }
}
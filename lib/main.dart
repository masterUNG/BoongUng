import 'package:boongung/scaffold/main_home.dart';
import 'package:boongung/scaffold/show_list_area.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      title: 'Boong Ung',
      home: ShowListArea(),
    );
  }
}

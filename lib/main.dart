// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:jsontask/widgets/json_page.dart';
import 'package:jsontask/widgets/show_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      ShowData(),
    );
  }
}

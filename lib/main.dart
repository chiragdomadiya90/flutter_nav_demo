import 'package:flutter/material.dart';
import 'package:flutter_nav_demo/View/expandable_text-1.dart';

import 'View/expandable_text-2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Textdemo(),
    );
  }
}

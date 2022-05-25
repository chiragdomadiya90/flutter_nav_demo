import 'package:flutter/material.dart';

import 'Drawer Animation.dart';
import 'Expantion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpansionPanelDemo(),
    );
  }
}

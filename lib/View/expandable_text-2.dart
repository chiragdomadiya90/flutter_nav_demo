import 'package:flutter/material.dart';

import 'expandable_text-1.dart';

class Textdemo extends StatelessWidget {
  const Textdemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ExpandableText(
                text:
                    'Chicken marinated in spiced yoghurs it placed in a larg pot, then layred with fried onion ,Chicken marinated in spiced yoghurs it placed in a larg pot, then layred with fried o,Chicken marinated in spiced yoghurs it placed in a larg pot, then layred with fried onion'),
          ],
        ),
      ),
    );
  }
}

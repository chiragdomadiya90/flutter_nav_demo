import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelDemo> createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 600),
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text("Header"),
                      );
                    },
                    body: ListTile(
                      title: Text("Body"),
                    ),
                    canTapOnHeader: true,
                    isExpanded: expanded)
              ],
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  expanded = !expanded;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

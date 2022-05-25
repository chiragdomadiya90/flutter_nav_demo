import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  int tabSelected = 0;

  List<String> items = ["Apple", "Banana", "Grapes", "Guava"];
  @override
  void initState() {
    tabController = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TabBar(
                indicatorColor: Colors.green,
                onTap: (value) {
                  setState(() {
                    tabSelected = value;
                  });
                },
                controller: tabController,
                tabs: List.generate(
                    items.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            items[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ))),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.teal,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

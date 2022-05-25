import 'package:flutter/material.dart';

import '1.Statefull.dart';
import '2.slider++.dart';
import 'list generate.dart';
import 'listbuilder.dart';

class AppBarDemo extends StatefulWidget {
  @override
  AppBarDemoState createState() => AppBarDemoState();
}

class AppBarDemoState extends State<AppBarDemo> {
  List<Widget> screens = [
    FilterScreen(),
    ListBuil(),
    Stfull(),
    StatefulDemo(),
  ];

  int screenSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenSelected],
      appBar: AppBar(
        backgroundColor: Colors.green,
        //centerTitle: true,
        titleSpacing: 50,
        elevation: 10,
        title: Text("Awesome App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Abc"),
                  accountEmail: Text("abc@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.brown,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Account"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text("Settings"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenSelected,
        onTap: (value) {
          setState(() {
            screenSelected = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        backgroundColor: Colors.grey.shade300,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: "Notification"),
        ],
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 250,
      //         width: double.infinity,
      //         decoration: BoxDecoration(color: Colors.green),
      //         child: SafeArea(
      //           child: Column(
      //             children: [
      //               Row(
      //                 children: [
      //                   IconButton(
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                       icon: Icon(
      //                         Icons.close,
      //                         size: 30,
      //                         color: Colors.white,
      //                       )),
      //                   Text(
      //                     "Welcome Abc",
      //                     style: TextStyle(color: Colors.white, fontSize: 18),
      //                   )
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

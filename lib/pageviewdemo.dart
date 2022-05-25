import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController pageController = PageController(initialPage: 0);
  int pageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 200,
              child: PageView(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageSelected = value;
                  });
                },
                children: [
                  Container(
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            pageSelected = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: pageSelected == index
                                  ? Colors.green
                                  : Colors.grey.shade400),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

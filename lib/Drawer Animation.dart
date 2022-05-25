import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerAnimation extends StatefulWidget {
  @override
  _StackWidgetState createState() => _StackWidgetState();
}

class _StackWidgetState extends State<DrawerAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  bool bottomDrawerOpen = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<Offset>(begin: Offset(0.0, 500), end: Offset(0.0, 100))
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.easeIn));

    _animationController!.addListener(() {
      setState(() {});

      // print(_animationController.status);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
            ),
            AnimatedBuilder(
              animation: _animationController!.view,
              builder: (context, child) {
                return Transform.translate(
                  offset: _animation!.value,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _animationController!.reverse();
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.home_menu,
                  progress: _animationController!.view,
                ),
                onPressed: () {
                  if (bottomDrawerOpen) {
                    _animationController!.reverse();
                    bottomDrawerOpen = !bottomDrawerOpen;
                  } else {
                    _animationController!.forward();
                    bottomDrawerOpen = !bottomDrawerOpen;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

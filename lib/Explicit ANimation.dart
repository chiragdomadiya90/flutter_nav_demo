import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<Offset>? animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController!.repeat();

    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(1.5, 0)).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AnimatedBuilder(
              //   animation: animationController!,
              //   builder: (context, child) {
              //     return Transform.rotate(
              //       angle: animationController!.value  2  pi,
              //       child: FlutterLogo(
              //         size: 200,
              //       ),
              //     );
              //   },
              // )
              AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  return SlideTransition(
                    position: animation!,
                    child: FlutterLogo(
                      size: 200,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

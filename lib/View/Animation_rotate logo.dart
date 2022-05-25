import 'dart:math';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? animation;
  @override
  void initState() {
    animation =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation!.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation!.view,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation!.value * 2 * pi,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/2.svg',
                        height: 150.sp,
                        width: 150.sp,
                      ),
                      const Positioned(
                          top: 80,
                          left: 70,
                          child: Text(
                            'D',
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          )),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double oldHeight = 150;
  double oldWidth = 250;

  double newHeight = 50;
  double newWidth = 50;

  double newRadius = 100;
  double oldRadius = 20;

  double oldPostioned = -20;
  double newPostioned = -60;

  double oldOpacity = 0.2;
  double newOpacity = 0.8;

  var oldColor = Colors.red;
  final newColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(

                height: 25,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.decelerate,
                height: oldHeight,
                width: oldWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(oldRadius),
                    color: oldColor),
              ),
              SizedBox(

                height: 25,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.purple,
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 2),
                    curve: Curves.easeIn,
                    left: oldPostioned,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(

                height: 25,
              ),
              AnimatedOpacity(
                opacity: oldOpacity,
                duration: Duration(seconds: 2),
                curve: Curves.bounceInOut,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
              ),
              SizedBox(

                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    oldHeight = newHeight;
                    oldWidth = newWidth;
                    oldColor = newColor;
                    oldRadius = newRadius;
                    oldPostioned = newPostioned;
                    oldOpacity = newOpacity;
                  });
                },
                child: Text("Tap To Change"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
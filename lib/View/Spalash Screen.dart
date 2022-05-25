import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_nav_demo/View/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomepAGE.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userEmail;

  @override
  void initState() {
    getUserEmail().whenComplete(() => Timer(
          Duration(seconds: 3),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  userEmail == null ? LoginScreen() : MyHomePage(),
            ),
          ),
        ));
    super.initState();
  }

  Future getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var obtainedEmail = prefs.getString("Email");
    setState(() {
      userEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

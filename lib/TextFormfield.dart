import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav_demo/tabbardemo.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.09,
                ),
                Text('Add your detail to login',
                    style: TextStyle(
                      color: Color(0xff7C7D7E),
                    )),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can not be empty";
                    }
                  },
                  controller: _email,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      hintText: '    Your Email',
                      hintStyle: TextStyle(
                          fontSize: screenSize.height * 0.014,
                          color: Color(0xffB6B7B7)),
                      filled: true,
                      fillColor: Color(0xffF2F2F2)),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can not be empty";
                    } else if (value.length < 6) {
                      return "password must be at least 6 digit";
                    }
                  },
                  controller: _password,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      hintText: '   Password',
                      hintStyle: TextStyle(
                          fontSize: screenSize.height * 0.014,
                          color: Color(0xffB6B7B7)),
                      filled: true,
                      fillColor: Color(0xffF2F2F2)),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                SizedBox(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFC6011)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabBarDemo(),
                          ),
                        );
                      }
                    },
                    child: Text('Add your detail to login',
                        style: TextStyle(
                          color: Color(0xff7C7D7E),
                        )),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabBarDemo(),
                      ),
                    );
                  },
                  child: Text('Add your detail to login',
                      style: TextStyle(
                        color: Color(0xff7C7D7E),
                      )),
                ),
                SizedBox(
                  height: screenSize.height * 0.07,
                ),
                SizedBox(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff367FC0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: screenSize.width * 0.07),
                        Text('Add your detail to login',
                            style: TextStyle(
                              color: Color(0xff7C7D7E),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                SizedBox(
                  height: screenSize.height * 0.06,
                  width: screenSize.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xffDD4B39),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: screenSize.width * 0.07),
                        Text('Add your detail to login',
                            style: TextStyle(
                              color: Color(0xff7C7D7E),
                            )),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add your detail to login',
                        style: TextStyle(
                          color: Color(0xff7C7D7E),
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Add your detail to login',
                          style: TextStyle(
                            color: Color(0xff7C7D7E),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

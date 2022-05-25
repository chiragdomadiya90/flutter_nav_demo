import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../extra.dart';
import 'constant.dart';
import 'enter_mobile.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _otpController = TextEditingController();

  Future verifyOtp() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verficationCode!, smsCode: _otpController.text);
    if (phoneAuthCredential == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("enter valid OTP"),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: '',),
        ),
      );
    }
    firebaseAuth.signInWithCredential(phoneAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(hintText: "Enter Otp"),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  await verifyOtp();
                },
                child: Text("Verify Otp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

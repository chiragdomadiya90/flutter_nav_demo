import 'package:flutter/material.dart';
import 'package:flutter_nav_demo/Phone%20Auth/verify_otp.dart';

import 'constant.dart';

String? verficationCode;

class EnterMobile extends StatefulWidget {
  const EnterMobile({Key? key}) : super(key: key);

  @override
  State<EnterMobile> createState() => _EnterMobileState();
}

class _EnterMobileState extends State<EnterMobile> {
  final _phoneController = TextEditingController();

  Future sendOtp() async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91" + _phoneController.text,
      verificationCompleted: (phoneAuthCredential) {
        print("Verification Completed");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        setState(() {
          verficationCode = verificationId;
        });
      },
      verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$error"),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter your Mobile No"),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  await sendOtp().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyOtp(),
                      ),
                    ),
                  );
                },
                child: Text("Send Otp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

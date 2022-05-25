// import 'dart:io';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sizer/sizer.dart';
// import 'package:dio/dio.dart' as dio;
//
// import 'Ts.dart';
// import 'TsButton.dart';
// import 'Txf.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   bool showPassword = true;
//
//   bool isVisible = false;
//   final _firsName = TextEditingController();
//   final _lastName = TextEditingController();
//   final _userName = TextEditingController();
//   final _password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   File? _image;
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     var pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//
//   Future uploadImage({String? filename}) async {
//     dio.FormData formData = new dio.FormData.fromMap({
//       "avatar":
//           await dio.MultipartFile.fromFile(_image!.path, filename: filename)
//     });
//     dio.Response response = await dio.Dio().post(
//         "https://codelineinfotech.com/student_api/User/user_avatar_upload.php",
//         data: formData);
//
//     if (response.data['url'] != null) {
//       return response.data['url'];
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SafeArea(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 25,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     getImage();
//                   },
//                   child: Container(
//                     height: 150,
//                     width: 150,
//                     color: Colors.grey,
//                     child: _image == null
//                         ? Icon(Icons.camera)
//                         : Image.file(
//                             _image!,
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 80.w,
//                           decoration: BoxDecoration(
//                             boxShadow: const [
//                               BoxShadow(
//                                 offset: Offset(0, 10),
//                                 blurRadius: 20.0,
//                                 color: Color.fromRGBO(143, 145, 251, 0.2),
//                               )
//                             ],
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 4.w, vertical: 2.h),
//                             child: Column(
//                               children: [
//                                 TsField(
//                                   length: 10,
//                                   color: Colors.white,
//                                   hintText: 'First Name',
//                                   prefixIcon: Icons.person,
//                                   obText: false,
//                                   borderColor: Colors.white,
//                                   borderRadius: 0.0,
//                                   focusBorderRadius: 0.0,
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Name';
//                                     }
//                                   },
//                                   controller: _firsName,
//                                 ),
//                                 const Divider(),
//                                 TsField(
//                                   length: 10,
//                                   color: Colors.white,
//                                   hintText: 'Last Name',
//                                   prefixIcon: Icons.person,
//                                   obText: false,
//                                   borderColor: Colors.white,
//                                   borderRadius: 0.0,
//                                   focusBorderRadius: 0.0,
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Phone Number';
//                                     }
//                                   },
//                                   controller: _lastName,
//                                 ),
//                                 const Divider(),
//                                 TsField(
//                                   length: 10,
//                                   color: Colors.white,
//                                   hintText: 'UserName',
//                                   prefixIcon: Icons.lock,
//                                   obText: false,
//                                   borderColor: Colors.white,
//                                   borderRadius: 0.0,
//                                   focusBorderRadius: 0.0,
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter UserName';
//                                     }
//                                   },
//                                   suffixTap: () {
//                                     setState(() {
//                                       showPassword = !showPassword;
//                                     });
//                                   },
//                                   controller: _userName,
//                                 ),
//                                 const Divider(),
//                                 TsField(
//                                   length: 10,
//                                   color: Colors.white,
//                                   hintText: 'Password',
//                                   prefixIcon: Icons.lock,
//                                   obText: false,
//                                   borderColor: Colors.white,
//                                   borderRadius: 0.0,
//                                   focusBorderRadius: 0.0,
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return 'Enter Password';
//                                     }
//                                   },
//                                   onTap: () {
//                                     setState(() {
//                                       isVisible = true;
//                                     });
//                                   },
//                                   suffixTap: () {
//                                     setState(() {
//                                       showPassword = !showPassword;
//                                     });
//                                   },
//                                   controller: _password,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         TsButton(
//                           height: 6.h,
//                           width: 80.w,
//                           onTap: () async {
//                             String url = await uploadImage(
//                                 filename:
//                                     "${DateTime.now()}${Random().nextInt(1000)}${_image!.path}");
//
//                             SignUpReqModel _model = SignUpReqModel();
//                             model.firstName = firsName.text;
//                             model.lastName = lastName.text;
//                             model.username = userName.text;
//                             model.password = password.text;
//                             _model.avatar = "$url";
//                             SignUpServices.signUp(reqBody: _model.toJson())
//                                 .then((value) => ScaffoldMessenger.of(context)
//                                     .showSnackBar(
//                                         SnackBar(content: Text("DOne !"))));
//                           },
//                           btColor: isVisible == true
//                               ? Colors.blue.shade700
//                               : Colors.grey.shade300,
//                           text: 'SignIn',
//                           radius: 7.sp,
//                           textColor: Colors.white,
//                           textSize: 20.0,
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Ts(
//                               text: 'Already have a Account ? ',
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Ts(
//                                 text: 'SignUp ',
//                                 weight: FontWeight.w900,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

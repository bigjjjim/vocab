// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:vocab/appwithnav.dart';
// import 'package:vocab/Components/constant.dart';


// class RegistrationScreen extends StatefulWidget {
//   static const String id = 'registration_screen';

//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;
//   bool showSpinner = false;
//   String email;
//   String password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//               inAsyncCall: showSpinner,
//               child: SingleChildScrollView(
//                 child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 200.0,
//                     child: Text('logo'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 48.0,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     //Do something with the user input.
//                     email = value;
//                   },
//                   decoration:
//                       kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     //Do something with the user input.
//                     password = value;
//                   },
//                   decoration: kTextFieldDecoration,
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 FlatButton(
//                   color: Colors.blueAccent,
//                   child: Text('Register'),
//                   onPressed: () async{
//                     // print(email);
//                     // print(password);
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     try {
//                     final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//                     if (newUser != null) {
//                       Navigator.pushReplacementNamed(context, TabsScreen.id);
//                     }
//                     setState(() {
//                       showSpinner = false;
//                     });
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
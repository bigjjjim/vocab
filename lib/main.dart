import 'package:flutter/material.dart';
import 'package:vocab/Pages/memoire.dart';
import 'Pages/home4.dart';
import 'package:vocab/authentification/login.dart';
import 'Pages/translator.dart';
import 'Pages/annexe.dart';
import 'authentification/login.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Module/authservice.dart';
import 'package:vocab/Pages/quizPage.dart';
import 'Components/constant.dart';

AuthService appAuth = new AuthService();

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
 
    
 
    return MaterialApp(
       theme: ThemeData(
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      // subtitle2: TextStyle(),
      // subhead: TextStyle(),
    ).apply(
      bodyColor: kcolorblacktext, 
      //  displayColor: Colors.red
      // displayColor: Colors.blue, 
    ),),
            routes: {
        '/': (BuildContext context) =>  _handleWindowDisplay(),
        '/homeTable': (BuildContext context) => HomeTable()
         ,
        '/loginscreen': (BuildContext context) => LoginScreen(),
        // '/Annexe': (BuildContext context) => Annexe(),
        '/favourite': (BuildContext context) => Memoire(),
        '/translator': (BuildContext context) => Translator(),
        '/Quiz': ( BuildContext context) => MyQuiz(),
      },
    );
  }


  Widget _handleWindowDisplay() {
  //Check if user is logged in or not
  print('HERRRRE WHEN YOU GO HOME AND BACK');


   return FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                       if (snapshot.hasData){
                           FirebaseUser user = snapshot.data; // this is your user instance
                           /// is because there is user already logged
                           return Home();
                        }
                         /// other way there is no user logged.
                         return LoginScreen();
             }
          );
}
}

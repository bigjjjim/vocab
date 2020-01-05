import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'modiftable.dart';
import 'memoire.dart';
import 'annexe.dart';
import 'translator.dart';
import 'quiz2.dart';
import 'appwithnav.dart';
import 'app_custom_nav.dart';
import 'coppertab.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   // final navigatorKey = GlobalKey<NavigatorState>();
//   // final pagesRouteFactories = {
//   //   "/": () => MaterialPageRoute(
//   //         builder: (context) => TableVocab(),),
//   //   '/fav': () => MaterialPageRoute( builder: (context) => Memoire(),),
//   //       '/annexe': () => MaterialPageRoute( builder: (context) => Annexe(),),
//   //   '/translator': () => MaterialPageRoute( builder: (context) => Translator(),),
//   //   '/quiz': () => MaterialPageRoute( builder: (context) => Quiz(),),

//   };
// @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: _buildBody(),
//           bottomNavigationBar: _buildBottomNavigationBar(context),
//         ),
//       );
// Widget _buildBody() =>
//       MaterialApp(
//         navigatorKey: navigatorKey,
//         onGenerateRoute: (route) => pagesRouteFactories[route.name]()
//         );

//         Widget _buildBottomNavigationBar(context) => BottomNavigationBar(
//         items: [
//           _buildBottomNavigationBarItem("Home", Icons.home),
//           _buildBottomNavigationBarItem("Annexe", Icons.book),
//           _buildBottomNavigationBarItem("favourite", Icons.star),
//           _buildBottomNavigationBarItem("translator", Icons.compare_arrows)
//         ],
        
//         onTap: (routeIndex) =>
//             navigatorKey.currentState.pushNamed(pagesRouteFactories.keys.toList()[routeIndex]),
//       );


//   _buildBottomNavigationBarItem(name, icon) => BottomNavigationBarItem(
//       icon: Icon(icon), title: Text(name), backgroundColor: Colors.black45);
// }



void main() => runApp(MyApp());

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainNavigatorKey,
      
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsScreen()
    );
  }
}
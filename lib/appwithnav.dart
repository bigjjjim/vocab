import 'package:flutter/material.dart';
import 'Pages/modiftable.dart';
import 'Pages/memoire.dart';
import 'Pages/translator.dart';
// import 'Pages/annexe.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final _firestore = Firestore.instance;
// FirebaseUser loggedInUser;

// class TabsScreen extends StatefulWidget {

//     static const String id = 'Tabs_screen';

//   TabsScreen();
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   int currentIndex = 0;

//     final _auth = FirebaseAuth.instance;


//   final _homeScreen = GlobalKey<NavigatorState>();
//   final _annexeScreen = GlobalKey<NavigatorState>();
//   final _favouriteScreen = GlobalKey<NavigatorState>();
//   final _translatorScreen = GlobalKey<NavigatorState>();
// //  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser();
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: currentIndex,
//         children: <Widget>[
//           Navigator(
//             key: _homeScreen,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => TableVocab(),
//             ),
//           ),
          
//           Navigator(
//             key: _annexeScreen,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => Annexe(),
//             ),
//           ),
//           Navigator(
//             key: _favouriteScreen,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => Memoire(),
//             ),
//           ),
//           Navigator(
//             key: _translatorScreen,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => Translator(),
//             ),
//           ),
          
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (val) => _onTap(val, context),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.library_books),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             title: Text('Annexe'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             title: Text('Favourite'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.compare_arrows),
//             title: Text('Translator'),
//           ),
          
//         ],
//       ),
//     );
//   }

//   void _onTap(int val, BuildContext context) {
//     if (currentIndex == val) {
//       switch (val) {
//         case 0:
//           _homeScreen.currentState.popUntil((route) => route.isFirst);
//           break;
//         case 1:
//           _annexeScreen.currentState.popUntil((route) => route.isFirst);
//           break;
//         case 2:
//           _favouriteScreen.currentState.popUntil((route) => route.isFirst);
//           break;
//         case 3:
//           _translatorScreen.currentState.popUntil((route) => route.isFirst);
//           break;
       
//         default:
//       }
//     } else {
//       if (mounted) {
//         setState(() {
//           currentIndex = val;
//         });
//       }
//     }
//   }

  
// }
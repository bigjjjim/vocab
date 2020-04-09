// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vocab/Components/Paginated.dart';
// import 'package:vocab/Module/words.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vocab/main.dart';
// import 'memoire.dart';
// import 'translator.dart';
// import 'annexe.dart';
// import 'home2.dart';
// import 'package:vocab/authentification/sign_in.dart';
// import 'dart:async';
// import 'package:vocab/authentification/login.dart';

// FirebaseUser loggedInUser;


// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   String userId;

//    @override
//   void initState() {
//     super.initState();
//     getUserRef();
//   }

//   getUserRef() async {
//     final FirebaseUser user = await auth.currentUser();
//     final uid = user.uid;
   
//     // DocumentReference userRef =
//     //     Firestore.instance.collection('users').document(uid);

//     setState(() {
//       userId = user.uid;

//     });
//     // here you write the codes to input the data into firestore
//   }



//   int _selectedIndex = 0;

//   List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>()
//   ];

//   @override
//   Widget build(BuildContext context) {

//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//             !await _navigatorKeys[_selectedIndex].currentState.maybePop();

//         print(
//             'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

//         // let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.library_books,
//                 color: Colors.black,
//               ),
//               title: Text('HOME'),
//               activeIcon: Icon(
//                 Icons.library_books,
//                 color: Colors.purple,
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.list,
//                 color: Colors.black,
//               ),
//               title: Text('Annexe'),
//               activeIcon: Icon(
//                 Icons.list,
//                 color: Colors.purple,
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.star,
//                 color: Colors.black,
//                 size: 36,
//               ),
//               title: Text('Favourite'),
//               activeIcon: Icon(
//                 Icons.star,
//                 color: Colors.purple,
//                 size: 36,
//               ),
//             ),
//           ],
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//         ),
//         body: Stack(
//           children: [
//             _buildOffstageNavigator(0),
//             _buildOffstageNavigator(1),
//             _buildOffstageNavigator(2),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _next() {
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
//   // }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
//     return {
//       '/': (context) {
//         return [
//           HomeTable(),
//           Annexe(
//             // onNext: _next,
//           ),
//           Memoire(),
//         ].elementAt(index);
//       },
//     };
//   }

//   Widget _buildOffstageNavigator(int index) {
//     var routeBuilders = _routeBuilders(context, index);

//     return Offstage(
//       offstage: _selectedIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (context) => routeBuilders[routeSettings.name](context),
//           );
//         },
//       ),
//     );
//   }
// }

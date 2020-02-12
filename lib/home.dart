import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nested_navigators/nested_nav_item.dart';
import 'package:vocab/Components/Paginated.dart';
import 'package:vocab/Module/words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/memoire.dart';
import 'Pages/translator.dart';
import 'Pages/annexe.dart';
// import 'Pages/modiftable.dart';
import 'Pages/home2.dart';
import 'authentification/sign_in.dart';
import 'package:nested_navigators/nested_navigators.dart';
import 'dart:async';
import 'authentification/login.dart';

FirebaseUser loggedInUser;


enum TabItem { homeTable, annexe, favourite, translator }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  String userId;

  Map<TabItem, GlobalKey<NavigatorState>> navkeys = {
    TabItem.homeTable: GlobalKey<NavigatorState>(),
    TabItem.annexe: GlobalKey<NavigatorState>(),
    TabItem.favourite: GlobalKey<NavigatorState>(),
    TabItem.translator: GlobalKey<NavigatorState>(),
  };
// final _homeScreen = GlobalKey<NavigatorState>();
//   final _annexeScreen = GlobalKey<NavigatorState>();
//   final _favouriteScreen = GlobalKey<NavigatorState>();
//   final _translatorScreen = GlobalKey<NavigatorState>();
  //  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    getUserRef();
  }

  getUserRef() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
   
    // DocumentReference userRef =
    //     Firestore.instance.collection('users').document(uid);

    setState(() {
      userId = user.uid;

    });
    // here you write the codes to input the data into firestore
  }

// static List<Widget> _widgetOptions =

//FUNTCION FOR BOTTOM BAR
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return
        // _selectedIndex==0 ? () async => Future<bool>.value(false):,
        // !await navkeys[_selectedIndex].currentState.maybePop());
        // return navkeys['home'].currentState.popUntil((r) => r.isFirst),

        // }
        WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return Future.value(false);

        } else if (_selectedIndex == 1) {
          setState(() {
            _selectedIndex = 0;
          });
          return Future.value(false);
        }
        else if (_selectedIndex == 2) {
          setState(() {
            _selectedIndex = 0;
          });
          return Future.value(false);
        }
        else if (_selectedIndex == 3) {
          setState(() {
            _selectedIndex = 0;
          });
          return Future.value(false);
        }
        return Future.value(false);
        // _selectedIndex==0;

        // return Future.value(false);

        //  return _selectedIndex==0 ? 
          
        //    Future<bool>.value(false):Future<bool>.value(true);
      },
      //  _requestPop,
      child:
       Scaffold(
        // key: navigatorKey,
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality
                   Navigator.pop(context);
                  handleSignOut();
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                }),
          ],
        ),
        // appBar: AppBar(title: Text("Vocabulary")),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            Navigator(
              key: navkeys['homeTable'],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeTable(),
              ),
            ),
            // TableVocab(),
            // Annexe(),
            // Memoire(),
            // Tr

            Navigator(
              key: navkeys['annexe'],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => Annexe(),
              ),
            ),
            Navigator(
              key: navkeys['favourite'],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => Memoire(),
              ),
            ),
            Navigator(
              key: navkeys['translator'],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => Translator(),
              ),
            ),
          ],
        ),

        //  _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          selectedItemColor: Colors.pink,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (val) => _onTap(val, context),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Annexe'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourite'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows),
              title: Text('Translator'),
            ),
          ],
        ),
      
    ),);
  }

  void _onTap(int val, BuildContext context) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
          // navkeys['home'].currentState.pop();
          // Navigator.of(context).popUntil((route) => route.isFirst);
          // Navigator.of(context).pop();
          _selectedIndex = 0;

          //          setState(() {
          //   _selectedIndex = 0;
          // });
          break;
        case 1:
          setState(() {
            _selectedIndex = 1;
          });
          break;
        case 2:
          setState(() {
            _selectedIndex = 2;
          });
          break;
        case 3:
          setState(() {
            _selectedIndex = 3;
          });
          break;

        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = val;
        });
      }
    }
  }

  Future<bool> _requestPop() {
    //  _selectedIndex = 0;
    // setState(() {
    // _selectedIndex = 0;
    //  Navigator.of(context).popUntil((route) => route.isFirst);

    // });
    
    return Future.value(false);
  }

// Future<bool> _onBackPressed() async {

// // Navigator.pop(context, true);
//                        Navigator.of(context).popUntil((route) => route.isFirst);
//   //                      setState(() {
//   //   _selectedIndex = 0;
//   // });
//                        return false;

// }

}

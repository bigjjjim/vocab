import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/memoire.dart';
import 'Pages/translator.dart';
import 'Pages/annexe.dart';
// import 'Pages/modiftable.dart';
import 'Pages/home4.dart';
import 'authentification/sign_in.dart';
import 'dart:async';
import 'authentification/login.dart';
import 'package:flutter/cupertino.dart';
import 'Pages/quizPage.dart';


FirebaseUser loggedInUser;
enum TabItem { homeTable, annexe, favourite, translator }
// final quizNav = GlobalKey<NavigatorState>();


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;

  Map<TabItem, GlobalKey<NavigatorState>> navkeys = {
    TabItem.homeTable: GlobalKey<NavigatorState>(),
    TabItem.annexe: GlobalKey<NavigatorState>(),
    TabItem.favourite: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();
    getUserRef();
  }

  getUserRef() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    setState(() {
      userId = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        appBar: AppBar(
            title: new Text('Minilo'),
            backgroundColor: Colors.green[800],
            actions: [
              // action button
              FlatButton(
                child:  Text('Log out',),
                onPressed: () { 
                   handleSignOut();
                  //  Navigator.of(context).popUntil((route) => route.isFirst); 
                  Navigator.of(context).pushNamed('/');
                },
              ),
            ],),
        body: IndexedStack(index: _selectedIndex, children: <Widget>[
                  Offstage(
                    offstage:  _selectedIndex != 0,
                    child:
                    Navigator(
                    key: navkeys['homeTable'],
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => HomeTable(),
                    ),
                  ),),               
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
                ]),
        bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
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
              ],
              selectedItemColor: Colors.orange,
              onTap: (val) => _onTap(val, context),
              currentIndex: _selectedIndex) ,
        
      ),
    );
  }  
    
  

  


  void _onTap(val, BuildContext context) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
       
          setState(() {
            _selectedIndex = 0;
          });
     
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

  // Future<bool> _requestPop() {
  //   //  _selectedIndex = 0;
  //   // setState(() {
  //   // _selectedIndex = 0;
  //   //  Navigator.of(context).popUntil((route) => route.isFirst);

  //   // });

  //   return Future.value(false);
  // }

Future<bool> _onBackPressed() async {

// Navigator.pop(context, true);
                       Navigator.of(context).popUntil((route) => route.isFirst);
  //                      setState(() {
  //   _selectedIndex = 0;
  // });
                       return false;

}

}

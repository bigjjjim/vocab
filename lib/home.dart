import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/memoire.dart';
import 'Pages/annexe.dart';
import 'Pages/home4.dart';
import 'authentification/sign_in.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

FirebaseUser loggedInUser;
enum TabItem { homeTable, annexe, favourite, translator }

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
          backgroundColor: Color(0xFF2e7d32),
          actions: [
            FlatButton(
              child: Container(
                width: 70,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF123214),
                  shape: BoxShape.rectangle,
                  borderRadius:  BorderRadius.all(Radius.circular(10))
                ),
                
                // color: Color(0xFF123214),
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                handleSignOut();
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ),
        body: IndexedStack(index: _selectedIndex, children: <Widget>[
          Offstage(
            offstage: _selectedIndex != 0,
            child: Navigator(
              key: navkeys['homeTable'],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeTable(),
              ),
            ),
          ),
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
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
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
            backgroundColor: Colors.white,
            // Color(0xFFf6fff6),
            elevation: 16,
            
            onTap: (val) => _onTap(val, context),
            currentIndex: _selectedIndex),
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

  Future<bool> _onBackPressed() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return false;
  }
}

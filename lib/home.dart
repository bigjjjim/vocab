import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/memoire.dart';
import 'Pages/annexe.dart';
import 'Pages/home4.dart';
import 'authentification/sign_in.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:vocab/Pages/nombres.dart';
import 'package:vocab/Pages/jours.dart';
import 'package:vocab/Pages/expressionPage.dart';
import 'package:vocab/Pages/VerbPage.dart';
import 'package:vocab/Pages/VerbDetail.dart';


FirebaseUser loggedInUser;
enum TabItem { homeTable, annexe, favourite, }
List tab = ["homeTable", "annexe", "favourite",];

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

  // void _selectTab(TabItem tabItem) {
  //   if (tabItem == _selectedIndex) {
  //     // pop to first route
  //     _selectedIndex[tabItem].currentState.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() => _currentTab = tabItem);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print(TabItem.values[0]);
    return 
    WillPopScope(
      onWillPop:
      () async {
        final isFirstRouteInCurrentTab =
            !await navkeys[TabItem.values[_selectedIndex]].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_selectedIndex != 0) {
            // select 'main' tab
            // _selectTab(TabItem.homeTable);
            // back button handled by app
            setState(() {
              _selectedIndex = 0;

            });
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
     
      child:
       Scaffold(
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
              key: navkeys[TabItem.homeTable],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeTable(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
              child: Navigator(
                initialRoute: 'annexe'
                ,
              key: navkeys[TabItem.annexe],
              onGenerateRoute:  (settings) {
                switch (settings.name) {
                case 'annexe':
                return MaterialPageRoute(builder: (context) => Annexe(), settings: settings);
                break;

                case 'grammairePage':
                return MaterialPageRoute(builder: (context) => GrammairePage(), settings: settings);
               break;
                case 'nombresPage':
                return MaterialPageRoute(builder: (context) => NombresPage(), settings: settings);
               break;
               case 'joursPage':
                return MaterialPageRoute(builder: (context) => JoursPage(), settings: settings);
               break;
               case 'expressionsPage':
                return MaterialPageRoute(builder: (context) => ExpressionsPage(), settings: settings);
               break;

               default: throw Exception("Invalid route");
                }
              }
              
              //  MaterialPageRoute(
              //   settings: route,
              //   builder: (context) => Annexe(),
              // ),
            ),
          ),
        Offstage(
          offstage: _selectedIndex != 2,
          child: Navigator(
            key: navkeys[TabItem.favourite],
            initialRoute: 'verbPage',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case 'verbPage':
                return MaterialPageRoute(builder: (context) => VerbPage(), settings: settings);
                break;

                case 'VerbDetailPage':
                return MaterialPageRoute(builder: (context) => Verbdetail(), settings: settings);
                break;

                default: throw Exception("Invalid route");
                }
            }),),
            
            
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
                icon: Icon(Icons.search),
                title: Text('Verbes'),
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
    // Navigator.of(context).popUntil((route) => route.isFirst);
  //  _selectedIndex = 0;
    return false;
  }
}

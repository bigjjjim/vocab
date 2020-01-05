import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'modiftable.dart';
import 'annexe.dart';
import 'memoire.dart';
import 'translator.dart';

  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),

      // Children are the pages that will be shown by every click
      // They should placed in order such as
      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
      children: <Widget>[
        TableVocab(),
        Annexe(),
        Memoire(),       
        Translator()
      ],

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }

  final _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
    BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('annexe')),
    BottomNavigationBarItem(
        icon: Icon(Icons.star), title: Text('favourite')),
            BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), title: Text('translator')),

  ];
}
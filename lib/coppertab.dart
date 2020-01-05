import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocab/modiftable.dart';
import 'annexe.dart';
import 'memoire.dart';
import 'translator.dart';



class Cupertab extends StatefulWidget {
  @override
  _CupertabState createState() => _CupertabState();
}

class _CupertabState extends State<Cupertab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
    // activeColor: Colors.blue,
    // onTap: onNavigationTap,
    // currentIndex: currentCategory,
    items:  const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('annexe'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('favourite'),
          ),
      BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            title: Text('Translator'),
          ),
          
          
          
          ]
          
          
          ),
          tabBuilder:  (BuildContext context, int index) {
        switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return TableVocab();
                },
                defaultTitle: 'Home',
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Annexe(),
                defaultTitle: 'Annexe',
              );
              break;
              case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => Memoire(),
                defaultTitle: 'favourite',
              );
              case 3:
              return CupertinoTabView(
                builder: (BuildContext context) => Translator(),
                defaultTitle: 'translator',
              );
          }

          return null;
        },
      );
    
  }
}
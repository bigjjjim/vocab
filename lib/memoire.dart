import 'package:flutter/material.dart';
import 'paginated.dart';

class Memoire extends StatefulWidget {
  Memoire({this.selectedList});
  final selectedList;

  @override
  _MemoireState createState() => _MemoireState();
}

class _MemoireState extends State<Memoire> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('memoire'),
      
    );
  }
}
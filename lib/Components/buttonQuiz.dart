import 'package:flutter/material.dart';


class QuizButton extends StatelessWidget {
  QuizButton({ @required this.onPressed, @required this.word});
  // final IconData icon;
  final Function onPressed;
  String word;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 120.0,
      color: Colors.blueGrey,
      onPressed: onPressed,
      child: Text(word,
          style: TextStyle(fontSize: 20.0, color: Colors.white),),
    );}
}

import 'package:flutter/material.dart';
import 'quiz2.dart';
import 'constant.dart';
import 't.dart';

class TransitionQuiz extends StatefulWidget {
  final firstWordIndex;
  final lastWordIndex;
  final description;

  TransitionQuiz({this.firstWordIndex, this.lastWordIndex, this.description});
  @override
  _TransitionQuizState createState() => _TransitionQuizState();
}

class _TransitionQuizState extends State<TransitionQuiz> {
  String dropdownValue = 'Facile';
  String value;
  TextEditingController quizStartController = TextEditingController();
  TextEditingController quizEndController = TextEditingController();
  String _hint, _hint2;
  Function onchanged, onchanged2;
  FocusNode _focusNode, _focusNode2;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode2 = FocusNode();
    //initialise hint text for words index

    _hint = widget.firstWordIndex.toString();
    _hint2 = widget.lastWordIndex.toString();

    //change the textfield when inserting value
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _hint = quizStartController.text;
        });
        quizStartController.clear();
      }
    });

    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        setState(() {
          _hint2 = quizEndController.text;
        });
        quizEndController.clear();
      }
    });
  }









  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          //...bottom card part,
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text('Options', style: kwidgetTitleStyle),
                SizedBox(height: 16.0),
                Text(widget.description,
                    textAlign: TextAlign.center, style: kdialogueDescripStyle),
                SizedBox(height: 24.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Difficulté:',
                      style: kwidgetTitleStyle,
                    ),
                    SizedBox(width: 16.0),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Facile', 'Intermédiaire', 'Difficile']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:textFieldDialogue(
                             _focusNode, 
                            quizStartController, 
                              _hint,
                            (String newValue) {
                          setState(() {
                            _hint = newValue;
                          });
                        }),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Text('à')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: textFieldDialogue(
                            _focusNode2, quizEndController, _hint2,
                            (String newValue) {
                          setState(() {
                            _hint2 = newValue;
                          });
                        }),
                        width: 30,
                      ),
                    ),
                  ],
                ),
                
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          // To close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Fermer'),
                      ),
                      
                      FlatButton(
                       child: Text('Commencer'),

                        onPressed: ()  { 
// _openDetailsPage(context);
                          int sta = int.parse(_hint);
                        int end = int.parse(_hint2);

                      // // CustomNavigator(home: Quiz(difficulty: dropdownValue, indexFirstWord: sta, indexLastWord: end,),
                      // // pageRoute: PageRoutes.materialPageRoute,);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Quiz(difficulty: dropdownValue, indexFirstWord: sta, indexLastWord: end,)));
                      //   //  _homeScreen.currentState.push(MaterialPageRoute(builder: (context) => Quiz(difficulty: dropdownValue,indexFirstWord: int.parse(_hint),indexLastWord: int.parse(_hint2),)));

                        } 

                        
                       ) // Proceed to quiz

   
                    ]),
                ),
              ]),
                ),
              ],
            ),
    );
    
    
    
    
    
  }
}

    // Quiz(difficulty: 'facile', indexFirstWord: 1, indexLastWord: 10,);

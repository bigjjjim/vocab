import 'package:flutter/material.dart';
import 'package:vocab/Components/dropdownlists.dart';
import 'Pages/quizPage.dart';
import 'package:vocab/Components/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'authentification/sign_in.dart';

FirebaseUser loggedInUser;

class TransitionQuiz extends StatefulWidget {
  final firstWordIndex;
  final lastWordIndex;
  final description;

  TransitionQuiz({this.firstWordIndex, this.lastWordIndex, this.description});
  @override
  _TransitionQuizState createState() => _TransitionQuizState();
}

class _TransitionQuizState extends State<TransitionQuiz> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  String dropdownValue = 'Facile';
  String value;
  TextEditingController quizStartController = TextEditingController(); //need to dispose controller!!
  TextEditingController quizEndController = TextEditingController();
  String _hint, _hint2;
  Function onchanged, onchanged2;
  FocusNode _focusNode, _focusNode2;
  int maxValuewait;
  int _numberQuestion = 10;

  @override
  void initState() {
    super.initState();
    getCurrentUser();

    _focusNode = FocusNode();
    _focusNode2 = FocusNode();
    //initialise hint text for words index

    _hint = widget.firstWordIndex.toString();
    _hint2 = widget.lastWordIndex.toString();
    // maxValue = (widget.lastWordIndex+1 - widget.firstWordIndex).toDouble();
    maxValuewait = (widget.lastWordIndex+1 - widget.firstWordIndex);

    //change the textfield when inserting value
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _hint = quizStartController.text;
          // maxValue = int.parse(quizEndController.text).toDouble() +1 - int.parse(quizEndController.text).toDouble() ;
          // maxValuewait = int.parse(_hint2) +1 - int.parse(_hint);

        });
        quizStartController.clear();
      }
    });

    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        setState(() {
          _hint2 = quizEndController.text;
          // maxValuewait = int.parse(_hint2) +1 - int.parse(_hint);

          // maxValue = int.parse(quizEndController.text).toDouble() +1 - int.parse(quizEndController.text).toDouble() ;
        });
        quizEndController.clear();
      }
    });
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

// double _value = 6.0;
// // double _maxValue = 10.0;
// // double end2 .toDouble();
//   double  _setEndValue() {
//     double end2 = widget.lastWordIndex.toDouble();
//     // setState(() {
//     //     end2 = int.parse(_hint2).toDouble();      

//     // });
//     return end2;
//   }
  //     // if bla bla bla
  //     // double maxValue = double.parse(_hint2);
  //     double maxValue = 10.0;
  //     setState(() {
  //       maxValue = int.parse(quizEndController.text).toDouble();
  //       //  double.parse(quizEndController.text);
  //     });
  //     return maxValue;
  //   }
    // double setvalue() {
    //   double maxValue = maxValue;
    //   setState(() {
    //     maxValue = int.parse(_hint2).toDouble() +1 - int.parse(_hint).toDouble() ;
    //   });
    // }


  @override
  Widget build(BuildContext context) {
// _setEndValue();

    return Scaffold(
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
                  borderRadius: BorderRadius.all(Radius.circular(10))),

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
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: kcolorbackground,
            child: Stack(children: <Widget>[
              //...bottom card part,
            Column(children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.25),


              Container( 
                width: MediaQuery.of(context).size.width,
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.settings, color: Colors.orange,size: 40,),
                  SizedBox(width:5),
                  Text('Option', style: TextStyle(fontSize: 30),),
                ]),),
              
              SizedBox(height:15),
              


              Container(child: Text('Matière pour le test: ', style: TextStyle(fontSize: 20))),

SizedBox(height:15),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                             Container(
                                height: 35,
                                width: 80,   
                                color: Colors.white,
  
                                child:                        
                                    textFieldDialogue(
                                    _focusNode, quizStartController, _hint,
                                    (String newValue) {
                                  setState(() {
                                    _hint = newValue;
                                    maxValuewait = int.parse(_hint2) +1 - int.parse(newValue);  
                                    _numberQuestion = 10;                                    
                                  },);
                                },
                                ),
                              ),
                            

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(child: Text('à')),
                            ),
                             Container(
                                height: 35,
                                width: 80,
                                color: Colors.white,
                                child: textFieldDialogue(
                                    _focusNode2, quizEndController, _hint2,
                                    (String newValue) {

                                  setState(() {

                                    _hint2 = newValue;

                                     maxValuewait = int.parse(newValue) +1- int.parse(_hint);
                                     _numberQuestion = 10;
                                  });
                                },
                                ),
                                
                              ),
                            
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('Nombre de questions: ', style: TextStyle(fontSize: 20)), 
                            
                            Container(
                              // color: Colors.white,
                              
                              height: 30,
                              // width: 65,
                              padding: EdgeInsets.only(left: 8, ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                    width: 1.0,
                    color: Colors.black38,
                  ),
                  borderRadius:  BorderRadius.all(
                    Radius.circular(4),
                    ),
                              ),
                              // alignment: Alignment.center,
                              child: 
                              
                               DropdownButton(
                                  // focusColor: Colors.white,
                                  
                                      items:
                                      //  maxValuewait <20 ? drop1 :
                                      //         maxValuewait < 30 ? drop2:
                                      //         maxValuewait <50 ? drop3:
                                      //          drop4 ,
                                      drop2,
                                      
                                  onChanged: (value) {
                                    setState(() {
                                      _numberQuestion = value;
                                    });
                                  },
                                  value: _numberQuestion,
                                  elevation: 8,
                                  style: TextStyle( color: Colors.black, fontSize: 20),
                                  isDense: true,
                                  
                                  iconSize: 40.0,
                                  // dropdownColor: Colors.orange
                                ),
                              
                            ),
                          ]) 
                          ),
                    
                        



                        SizedBox(height: 40),


                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[
                            // FlatButton(
                            //   onPressed: () {
                            //     //  close the dialog
                            //     Navigator.of(context).pop();
                            //   },
                            //   child: Icon(Icons.arrow_back, color: Colors.orange,),
                            // ),
                            // SizedBox(width: 50),
                            Container(
                              height: 40,
                            width: 140,
                            
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius:  BorderRadius.all(
                                        Radius.circular(7),
                                        ),
                            ),
                              child: FlatButton(
                                  child: Text('Lancer', style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    int sta = int.parse(_hint);
                                    int end = int.parse(_hint2);
                                    sta < end && sta > 0 && end < 1000 ?
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => MyQuiz(
                                          difficulty: dropdownValue,
                                          indexFirstWord: sta,
                                          indexLastWord: end,
                                          numberQuestion: _numberQuestion,
                                        ),
                                      ),
                                    ): showDialog(context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                      title: Text('Erreur de valeurs'),
                                      content: 
                                      
                                      Text('range index incorrect'));
                                    }
                                    );
                                  }),
                            )
                          ]),
                        ),
                      ]),
            ],),
          ),

          ),
        ),
      
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    quizStartController.dispose();
    quizEndController.dispose();
    
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:vocab/Components/buttonQuiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/Pages/home4.dart';
import 'package:vocab/home.dart';



var finalScore = 0;
var questionNumber = 0;
List<int> scorelist = [];
final List<int> indexanswerQuiz = [0, 1, 2, 3];

Future<bool> _onBackPressed() async {
  return false;
}


class MyQuiz extends StatefulWidget {
  final String difficulty ;
  final int indexFirstWord;
  final int indexLastWord;
  MyQuiz({
    this.difficulty,
    this.indexFirstWord,
    this.indexLastWord,
  });



  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz>  with AutomaticKeepAliveClientMixin {
   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int start = widget.indexFirstWord;
    int end = widget.indexLastWord;
    final db = DatabaseServiceQuiz(start, end);
    super.build(context);
    
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
       
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamProvider<List<Words>>.value(
                  value:  db.streamWord(),
                  lazy: true,
                  
                  initialData: 
                  [Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0)],
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                  
                      child: Entire(),
                      
                                         
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  @override
  void dispose() {
    super.dispose();
  }
   @override
  bool get wantKeepAlive => true;
}
  


class Entire extends StatefulWidget {

 @override
  _EntireState createState() => _EntireState();
}


class _EntireState extends State<Entire>  {

  @override
  Widget build(BuildContext context) {
    final _wordsback = Provider.of<List<Words>>(context, );
 
    // print(_wordsback);
    List<Words> getListForEachElement(int i, List l) {
    final List<Words> list2 = List<Words>.from(l);
       list2.remove(l[i]);
      // print(list2);
       list2.shuffle();
      // print(list2);
      // list3 = 
      // print(list3);
      final List<Words> list3 = list2.sublist(0,3);
      list3.add(l[i]);
      // print(list3);
      return list3;
    }

    List<List<Words>> answersQuiz() {
      int _wordcount = _wordsback.length;

      int quizLength;
      if ((_wordcount >= 10) && (_wordcount <= 20)) {
        //no quiz if less than 10 words, need to put catch errors in dialog.dart
        quizLength = (_wordcount / 1.67).round();
      } else if ((_wordcount > 20) && (_wordcount <= 40)) {
        quizLength = (_wordcount / 2).round();
      } else if (_wordcount > 40) {
        quizLength = 20;
      }

      List<Words> newList = [];
      newList = List<Words>.from(_wordsback);
      newList.shuffle();
      List<Words> listQuiz = newList.sublist(0, quizLength);
      final List<List<Words>> answersQuiz = [];

      //here insert function in a loop?
      for (int i = 0; i < listQuiz.length; i++) {
      List<Words> transit = [];
        transit = getListForEachElement(i, listQuiz);
        answersQuiz.add(transit);
      }

      return answersQuiz; //return list of list of 4 words for quiz
    }
    final List<List<Words>> answersMapQuiz = answersQuiz();
    
    var r = Random(56);
    double proportion = ((r.nextInt(100)) / 100);

    int lengthFirstLang = (proportion * answersMapQuiz.length).round();
    List question = []; //thats my question words
    List<List> answersList = [];
    List answers = [];
    List correctAnswers = [];

    for (int i = 0; i < lengthFirstLang; i++) {
      question.add(answersMapQuiz[i][3].francais);
      correctAnswers.add(answersMapQuiz[i][3].portugais);
      answers = [];
      answers.add(answersMapQuiz[i][0].portugais);
      answers.add(answersMapQuiz[i][1].portugais);
      answers.add(answersMapQuiz[i][2].portugais);
      answers.add(answersMapQuiz[i][3].portugais);
      answersList.add(answers);
    }

    for (int i = lengthFirstLang; i < answersMapQuiz.length; i++) {
      question.add(answersMapQuiz[i][3].portugais);
      correctAnswers.add(answersMapQuiz[i][3].francais);
      answers = [];

      answers.add(answersMapQuiz[i][0].francais);
      answers.add(answersMapQuiz[i][1].francais);
      answers.add(answersMapQuiz[i][2].francais);
      answers.add(answersMapQuiz[i][3].francais);
      answersList.add(answers);
    }
  

    return QuizFront(question: question, 
    answersList: answersList, 
    answersMapQuiz: answersMapQuiz, 
    correctAnswers: correctAnswers);
  }
  

}

class Words {
  final String francais;
  final String portugais;
  final int index;
  Words({this.francais, this.portugais, this.index});

  factory Words.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Words(
        index: data['index'] ?? '',
        francais: data['francais'] ?? '',
        portugais: data['portugais'] ?? '');
  }
}

class DatabaseServiceQuiz {
  DatabaseServiceQuiz(this.start, this.end);
  final Firestore _db = Firestore.instance;
  int start;
  int end;
  var x;
  var i;
  Stream<List<Words>> streamWord() {
    var ref = _db
        .collection('words')
        .orderBy('index')
        .where('index')
        .startAt([start]).endAt([end]);

    print(ref
        .snapshots()
        .map((list) => list.documents.map((doc) => Words.fromFirestore(doc))));
        print('functio called');

     x = ref.snapshots().map((list) =>
        list.documents.map((doc) => Words.fromFirestore(doc)).toList());    
        // ..shuffle()
    return x;    
  }
  
}


// List shuffle(var items) {
//   var random = new Random();

//   // Go through all elements.
//   for (var i = items.length - 1; i > 0; i--) {

//     // Pick a pseudorandom number according to the list length
//     var n = random.nextInt(i + 1);

//     var temp = items[i];
//     items[i] = items[n];
//     items[n] = temp;
//   }

//   return items;
// }


class QuizFront extends StatefulWidget  {
  QuizFront(
      {this.question,
      this.answersMapQuiz,
      this.correctAnswers,
      this.answersList}
      );
  final question;
  final answersMapQuiz;
  final correctAnswers;
  final answersList;
  @override
  _QuizFrontState createState() => _QuizFrontState();
}

class _QuizFrontState extends State<QuizFront>  {    
  
  @override
  Widget build(BuildContext context) {
   
    void updateQuestion() {
      setState(() {
        if (questionNumber == widget.question.length - 1) {
          
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => Summary(
                  score: finalScore,
                  listscore: scorelist,
                  listinQuiz: widget.answersMapQuiz),
            ),
          );
        } else {
          questionNumber++;
          indexanswerQuiz.shuffle();

        }
      });
    }

    quizAnswerChecker(
      int indexAnswer,
    ) {
      if (widget.answersList[questionNumber][indexAnswer] ==
          widget.correctAnswers[questionNumber]) {
        debugPrint("Correct");
  
        finalScore++;
        setState(() {
          scorelist.add(1);
        });
      } else {
        debugPrint("Wrong");
        setState(() {
          scorelist.add(0);
        });
      }
      updateQuestion();

      return scorelist;
    }
    int count = 0;

    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),

        Container(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Question ${questionNumber + 1} of ${widget.question.length}",
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                "Score: $finalScore",
                style: TextStyle(fontSize: 22.0),
              )
            ],
          ),
        ),

        Padding(padding: EdgeInsets.all(10.0)),
        Padding(padding: EdgeInsets.all(10.0)),
        
        Text(
          
          widget.question[questionNumber],
          style: TextStyle(
            fontSize: 20.0,
          ),
        ), 

        Padding(padding: EdgeInsets.all(10.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //button 1

            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[0]);
              },
              word: widget.answersList[questionNumber][indexanswerQuiz[0]],
            ),

            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[1]);
              },
              word: widget.answersList[questionNumber][indexanswerQuiz[1]],
            )
          ],
        ),

        Padding(padding: EdgeInsets.all(10.0)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[2]);
              },
              word: widget.answersList[questionNumber][indexanswerQuiz[2]],
            ),
            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[3]);
              },
              word: widget.answersList[questionNumber][indexanswerQuiz[3]],
            )
          ],
        ),

        Padding(padding: EdgeInsets.all(15.0)),

        Container(
          alignment: Alignment.bottomCenter,
          child: MaterialButton(
              minWidth: 240.0,
              height: 30.0,
              color: Colors.red,
              onPressed: () {
                questionNumber = 0;
                finalScore = 0;
                scorelist = [];
               
                Navigator.of(context).popUntil((route) => route.isFirst);
               
              },
              
              child: Text(
                "Quit",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              )),
        ),
      ]),
    );
  }

}





FirebaseUser loggedInUser;

class Summary extends StatefulWidget {
  final int score;
  final List listscore;
  final List<dynamic> listinQuiz;

  Summary({Key key, @required this.score, this.listscore, this.listinQuiz})
      : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {


  String userId;
  final FirebaseAuth auth = FirebaseAuth.instance;

   @override
  void initState() {
    super.initState();
    getUserRef();
  }

  getUserRef() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
   debugPrint(uid);
    // DocumentReference userRef =
    //     Firestore.instance.collection('users').document(uid);

    setState(() {
      userId = user.uid;

    });
    // here you write the codes to input the data into firestore
  }
  
  @override
  Widget build(BuildContext context) {

    print(widget.listinQuiz[0][3].index);
  

    // for (var h in widget.listscore) {
    //   print(h);
    // }
    // print(widget.listscore);
    // Firestore.instance.collection('users')
    //   .document(userid)
    //   .collection('wordsscore')
    //   .document('wordssc').updateData({'words.1.quiz1': 1});




        var i;
  var docRef =Firestore.instance.collection('users')
      .document(userid)
      .collection('wordsscore')
      .document('wordssc');
      
//       updateData({'words.$indexWordsToUp.quiz1': 1});
    
    for (i=0; i< widget.listscore.length; i++) {
      var indexToUp = widget.listinQuiz[i][3].index;

      if (widget.listscore[i] == 1) {
        docRef.updateData({'words.$indexToUp.quiz1': 1});
      
    } else if (widget.listscore[i] == 0){
        docRef.updateData({'words.$indexToUp.quiz1': -1});
    }
   
    }


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
       
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Final Score: ${widget.score}",
                style: TextStyle(fontSize: 35.0),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              Row(
                children: <Widget>[
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      scorelist = [];

                      Navigator.of(context).popUntil((route) => route.isFirst); //nned to find another way
                      // Navigator.of(context).pop();
                    },
                    child: Text(
                      "Back to liste",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
              
              Container(
                height: 300,
                child:
                    // Text(listinQuiz.length.toString())
                    ListView.builder(
                  itemCount: widget.listscore.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 15,
                              child: Icon(
                                  IconData(59539,
                                      fontFamily: 'MaterialIcons',
                                      matchTextDirection: true),
                                  color: widget.listscore[index] == 1
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            SizedBox(width: 50),
                            Container(
                                width: 120,
                                child: Text(widget.listinQuiz[index][3].francais)),
                                 
                            SizedBox(width: 30),
                            Container(
                                width: 120,
                                child: Text(widget.listinQuiz[index][3].portugais)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// void updateData() {
//   try {
//     databaseReference
//         .collection('books')
//         .document('1')
//         .updateData({'description': 'Head First Flutter'});
//   } catch (e) {
//     print(e.toString());
//   }
// }

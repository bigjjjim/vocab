import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:vocab/Components/buttonQuiz.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/Components/constant.dart';
// import 'package:vocab/Pages/home4.dart';
import 'package:vocab/authentification/sign_in.dart';
import 'summaryQuiz.dart';
// import 'package:connectivity/connectivity.dart';

var finalScore = 0;
var questionNumber = 0;
List<int> scorelist = [];

final List<int> indexanswerQuiz = [0, 1, 2, 3];

Future<bool> _onBackPressed() async {
  return true;
}



class MyQuiz extends StatefulWidget {
  final String difficulty ;
  final int indexFirstWord;
  final int indexLastWord;
  final int numberQuestion;
  MyQuiz({
    this.difficulty,
    this.indexFirstWord,
    this.indexLastWord,
    this.numberQuestion
  });



  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz>   {
   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int start = widget.indexFirstWord;
    int end = widget.indexLastWord;
    
    final db = DatabaseServiceQuiz(start, end);
    // super.build(context);
    
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
        appBar: AppBar(
        title: new Text('Minilo'),
        automaticallyImplyLeading: false,

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
          body: Container(
                            height: MediaQuery.of(context).size.height,
                color: kcolorbackground,

            child: SingleChildScrollView(
              child: Container(
                // color: kcolorbackground,
                child: Column(
                  children: <Widget>[
                    StreamProvider<List<Words>>.value(

                      value:  db.streamWord(),
                      // catchError: (_, __) => null,
                      
                      // lazy: true,
                      
                      initialData: 
                     
                      [Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0), Words(francais: '', portugais: '', index: 0)],
                      child: 
                      
                      Container(
                        // height: MediaQuery.of(context).size.height,
                      
                          child: Entire(widget.numberQuestion),                                                              
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  @override
  void dispose() {
    super.dispose();
  }
  //  @override
  // bool get wantKeepAlive => true;
}
  


class Entire extends StatefulWidget {
 final int numberQuestion;
  Entire(this.numberQuestion);


 @override
  _EntireState createState() => _EntireState();
}


class _EntireState extends State<Entire>  {

  @override
  Widget build(BuildContext context) {
    final _wordsback = Provider.of<List<Words>>(context, );
     List<Words> getListForEachElement(int i, List l) {
    final List<Words> list2 = List<Words>.from(l);
       list2.remove(l[i]);
       list2.shuffle();
      final List<Words> list3 = list2.sublist(0,3);
      list3.add(l[i]);
      return list3;
    }
    List<List<Words>> answersQuiz() {
      // int _wordcount = _wordsback.length;

      int quizLength = widget.numberQuestion; //have to view this again
      // if ((_wordcount >= 10) && (_wordcount <= 20)) {
      //   quizLength = (_wordcount / 1.67).round();
      // } else if ((_wordcount > 20) && (_wordcount <= 40)) {
      //   quizLength = (_wordcount / 2).round();
      // } else if (_wordcount > 40) {
      //   quizLength = 20;
      // }

      List<Words> newList =  List<Words>.from(_wordsback);
      newList.shuffle();
      List<Words> listQuiz = newList.length > quizLength? newList.sublist(0, quizLength): newList;
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
    // double proportion = ((r.nextInt(100)) / 100);

    int lengthFirstLang = (answersMapQuiz.length/2).round();
    // (proportion * answersMapQuiz.length).round();
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
  
  
    return 
     QuizFront(question: question, 
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

class _QuizFrontState extends State<QuizFront> with SingleTickerProviderStateMixin  {    
  

  // Animation<double> _animation;
  // AnimationController _animationController;
  List<int> color1 = List.generate(52, (index) => 0); // attention que bientot able to change number of question heyyyyy
  List<int> color2 = List.generate(52, (index) => 0);
  List<int> color3 = List.generate(52, (index) => 0);
  List<int> color4 = List.generate(52, (index) => 0);
  
  @override
  Widget build(BuildContext context) {


    void updateQuestion() {

      setState(() {
        if (questionNumber == widget.question.length -1 ) {
          
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
      int indexAnswer, List color
    ) {
      if (widget.answersList[questionNumber][indexAnswer] ==
          widget.correctAnswers[questionNumber]) {
        debugPrint("Correct");
        // print(scorelist2);
        finalScore++;
        setState(() {
          scorelist.add(1);
          color[questionNumber ] = 1;
        });
      } else {
        debugPrint("Wrong");

        setState(() {
          scorelist.add(0);
          color[questionNumber ] = -1;
        });
      }
      Future.delayed(const Duration(milliseconds: 500), () {
      updateQuestion();
      });
      
      return scorelist;
    }
    int count = 0;

    return Container(
      // height: MediaQuery.of(context).size.height,
      // margin: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: widget.answersMapQuiz.isEmpty?CircularProgressIndicator(): Column(children: <Widget>[
        
        Padding(padding: EdgeInsets.all(20.0)),

        Container(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Question: ${questionNumber + 1} / ${widget.question.length}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold ),
                
              ),
                
                
              // Text(
              //   "Score: $finalScore",
              //   style: TextStyle(fontSize: 22.0),
              // )
            ],
          ),
          
        ),

        Padding(padding: EdgeInsets.all(5.0)),

        // StepProgressIndicator(
        //           totalSteps: widget.question.length,
        //           currentStep: questionNumber ,
        //           customColor: (index) => scorelist2[index] == 1? Colors.green: scorelist2[index] == -1? Colors.red : Colors.white,
        //           ),
        LinearProgressIndicator( 
          value: (questionNumber / widget.question.length),
          backgroundColor: Color(0xFFe6ffe7),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),

        ),
        Padding(padding: EdgeInsets.all(20.0)),
        
        ClipRRect(
                  child: Container(
            width: 500,
            // MediaQuery.of(context).size.width,
            height: 60,
            margin: const EdgeInsets.only(bottom: 1.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              color: krow1,
              boxShadow: [BoxShadow(color: Colors.grey[600], offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0, )],
              border: Border(top: BorderSide(width: 1,color: Colors.black),
              bottom:  BorderSide(width: 1,color: Colors.black),),
              
            ),
            child: Text(
              
              widget.question[questionNumber],
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ), 

        Padding(padding: EdgeInsets.all(35.0)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
            //button 1

          
              //   QuizButton(
              //   onPressed: () {
              //     quizAnswerChecker(indexanswerQuiz[0]);
              //   },
              //   word: widget.answersList[questionNumber][indexanswerQuiz[0]],
                
              // ),
            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[0], color1);
              },
              color: color1[questionNumber] == 1 ? kcorrect : color1[questionNumber] == -1 ? kerror : Colors.white,
              word: widget.answersList[questionNumber][indexanswerQuiz[0]],
            ),

            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[1], color2);
              },
              color:  color2[questionNumber] == 1 ? kcorrect : color2[questionNumber] == -1 ? kerror : Colors.white,
              word: widget.answersList[questionNumber][indexanswerQuiz[1]],
            ),
        //   ],
        // ),

        // Padding(padding: EdgeInsets.all(10.0)),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[2], color3);
              },
              color:  color3[questionNumber] == 1 ? kcorrect : color3[questionNumber] == -1 ? kerror : Colors.white,
              word: widget.answersList[questionNumber][indexanswerQuiz[2]],
            ),
            QuizButton(
              onPressed: () {
                quizAnswerChecker(indexanswerQuiz[3], color4);
              },
              color: color4[questionNumber] == 1 ? kcorrect : color4[questionNumber] == -1 ? kerror : Colors.white,
              word: widget.answersList[questionNumber][indexanswerQuiz[3]],
            ),
        //   ],
        // ),

        Padding(padding: EdgeInsets.all(25.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // Container(
            //   width: 140,
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   // color: Colors.grey[300],
              //   border: Border.all(color: Colors.red)
              // ),
              // alignment: Alignment.bottomCenter,
              // child: 
              MaterialButton(
                  // minWidth: 60.0,
                  height: 30.0,
                  
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    scorelist = [];
                   
                    Navigator.of(context).popUntil((route) => route.isFirst);
                   
                  },
                  
                  child: Text(
                    "Quitter",
                    style: TextStyle(fontSize: 17.0, color: Colors.grey[500]),
                  )),
            
          ],
        ),
      ]),
    );
  }
}


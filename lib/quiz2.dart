import 'package:flutter/material.dart';
import 'dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';
import 'package:provider/provider.dart';


var finalScore = 0;
var questionNumber = 0;

class Quiz extends StatefulWidget {
  final String difficulty;
  final int indexFirstWord;
  final int indexLastWord;
  //these are the words of the list displayed, need to change that to field inserted by user

  const Quiz(
      {Key key, this.difficulty, this.indexFirstWord, this.indexLastWord})
      : super(key: key);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {



  @override
  Widget build(BuildContext context) {

    int start = widget.indexFirstWord;
    int end = widget.indexLastWord;
    final db = DatabaseService(start, end);

    return Column(children: <Widget>[

      StreamProvider<List<Words>>.value(
        value: db.streamWords(),
        child: Container(
          height:  MediaQuery.of(context).size.height,
          child: WordsList()),
        )
    ],);


   
               
    }

}



class QuizBack extends StatefulWidget {
  QuizBack({this.question, this.answersMapQuiz, this.correctAnswers, this.answersList });
  final question;
  final answersMapQuiz;
  final correctAnswers;
  final answersList;

  @override
  _QuizBackState createState() => _QuizBackState();
}

class _QuizBackState extends State<QuizBack> {
  @override
  Widget build(BuildContext context) {
    final _wordsback = Provider.of<List<Words>>(context,listen: false);
    

          void updateQuestion() {
            setState(() {
              if (questionNumber == widget.question.length - 1) {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Summary(
                              score: finalScore,
                            )));
              } else {
                
               questionNumber++;

               
              }
            });
          }

          void resetQuiz() {
            setState(() {
              Navigator.pop(context);
              finalScore = 0;
              questionNumber = 0;
            });
          }
          // print(widget.answersMapQuiz[0][0].francais);
          // print(widget.answersMapQuiz[1][0].francais);
          
          // print(widget.question);
          // print(widget.correctAnswers);
          // print(widget.answersList);

    return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: Container(
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

                  //  Image.asset(
                  //     "images/${quiz.images[questionNumber]}.jpg",
                  //   ),

                  Padding(padding: EdgeInsets.all(10.0)),

                  Text(
                    widget.question[questionNumber],
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //button 1
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (widget.answersList[questionNumber][0] ==
                              widget.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                         
                          updateQuestion();

                          
                        },
                        child: Text(
                          widget.answersList[questionNumber][0],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (widget.answersList[questionNumber][1] ==
                              widget.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          widget.answersList[questionNumber][1],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (widget.answersList[questionNumber][2] ==
                              widget.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          widget.answersList[questionNumber][2],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (widget.answersList[questionNumber][3] ==
                              widget.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          widget.answersList[questionNumber][3],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  new Padding(padding: EdgeInsets.all(15.0)),

                  new Container(
                    alignment: Alignment.bottomCenter,
                    child: new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text(
                          "Quit",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        )),
                  ),
                ]),
              ),
            ),
          );
  }
}












class WordsList extends StatefulWidget {
  
  @override
  _WordsListState createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  @override
  Widget build(BuildContext context) {
    var _wordsback = Provider.of<List<Words>>(context);
    int _wordcount = _wordsback.length ;

  List<Words> getListForEachElement(int i, List l) {
            List<Words> list2= [];
            List<Words> list3=[];
                  list2 = List<Words>.from(l);
                  // print(list);
                list2.remove(l[i]);
                  // print(list2);
                list2.shuffle();
                  // print(list2);
                list3 = list2.sublist(0,3);
                  // print(list3);
                list3.add(l[i]);
                  // print(list3);
                  return list3;
  }

   List<List<Words>> randomList() {

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
            List<List<Words>> answersQuiz = [];



            //here insert function in a loop?
            for (int i = 0; i<listQuiz.length; i++) {
              List<Words> transit = [];
           transit = getListForEachElement(i, listQuiz);
            answersQuiz.add(transit);
  }

            return answersQuiz; //return list of list of 4 words for quiz
          }

          List<List<Words>> answersMapQuiz = randomList(); 
          var r = Random(56);
          double proportion = ((r.nextInt(100)) / 100);

          int lengthFirstLang = (proportion * answersMapQuiz.length).round();
          int lengthSecondLang = (answersMapQuiz.length - lengthFirstLang);
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

          for (int i = lengthFirstLang ; i < answersMapQuiz.length; i++) {
            question.add(answersMapQuiz[i][3].portugais);
            correctAnswers.add(answersMapQuiz[i][3].francais);
            answers = [];

            answers.add(answersMapQuiz[i][0].francais);
            answers.add(answersMapQuiz[i][1].francais);
            answers.add(answersMapQuiz[i][2].francais);
            answers.add(answersMapQuiz[i][3].francais);
            answersList.add(answers);

          } 

    return QuizBack(question: question, answersList: answersList,answersMapQuiz: answersMapQuiz,correctAnswers: correctAnswers, );
        } 
  }


class Words {
  final String francais;
  final String portugais;
  final int index;
  Words({this.francais, this.portugais, this.index});
  
  factory Words.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Words(index: data['index'] ?? '',
    francais: data['francais'] ?? '',
    portugais: data['portugais'] ?? ''
    );
  }
}

class DatabaseService {
  DatabaseService(this.start, this.end);
  final Firestore _db = Firestore.instance;
  int start;
  int end;

  /// Get a stream of a single document
  Stream<List<Words>> streamWords() {

    var ref = _db.collection('words').orderBy('index')
            .where('index')
            .startAt([start]).endAt([end]);

    return ref.snapshots().map((list) => 
    list.documents.map((doc) => Words.fromFirestore(doc)).toList());
  }
}

class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Final Score: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Reset Quiz",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),


      ),
    );
  }


}
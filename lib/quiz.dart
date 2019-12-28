import 'package:flutter/material.dart';
import 'dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

var finalScore = 0;
var questionNumber = 0;
// var quiz = Quiz();

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

    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('words')
            .orderBy('index')
            .where('index')
            .startAt([start]).endAt([end]).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) 
        {

          if (!snapshot.hasData) {
            return Text("Loading..");
          }

          
          // List x = _createWords(snapshot.data);
          final wordlist = snapshot.data.documents;
// final Words worditem;

          // }

          List<Words> worditems = [];
          for (var wo in wordlist) {
            final wordindex = wo.data['index'];
            final wordfrancais = wo.data['francais'];
            final wordportugais = wo.data['portugais'];

            final Words worditem = Words(
                francais: wordfrancais,
                portugais: wordportugais,
                index: wordindex);
            worditems.add(worditem);
          }
          int wordcount = worditems.length;

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


          //getting words for quiz
          List<List<Words>> randomList() {

            int quizLength;
            if ((wordcount >= 10) && (wordcount <= 20)) {
              //no quiz if less than 10 words, need to put catch errors in dialog.dart
              quizLength = (wordcount / 1.67).round();
            } else if ((wordcount > 20) && (wordcount <= 40)) {
              quizLength = (wordcount / 2).round();
            } else if (wordcount > 40) {
              quizLength = 20;
            }

            List<Words> newList = [];
            newList = List<Words>.from(worditems);
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

          void updateQuestion() {
            setState(() {
              if (questionNumber == question.length - 1) {
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
          print(answersMapQuiz[0][0].francais);
          print(answersMapQuiz[1][0].francais);
          
          print(question);
          print(correctAnswers);
          print(answersList);

          return 
          
          WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: Container(
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
                          "Question ${questionNumber + 1} of ${question.length}",
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
                    question[questionNumber],
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
                          if (answersList[questionNumber][0] ==
                              correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                         
                          updateQuestion();

                          
                        },
                        child: Text(
                          answersList[questionNumber][0],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (answersList[questionNumber][1] ==
                              correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          answersList[questionNumber][1],
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
                          if (answersList[questionNumber][2] ==
                              correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          answersList[questionNumber][2],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          if (answersList[questionNumber][3] ==
                              correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: Text(
                          answersList[questionNumber][3],
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
        },
      ),
    );
  }
}

class Words {
  Words({this.francais, this.portugais, this.index});
  final String francais;
  final String portugais;
  final int index;
  bool selected = false;
}

// ListView.builder(
//             itemExtent: 80.0,
//             itemCount: test.length,

//             itemBuilder: (context, index) {
//                 // List<Words> randomListObject = randomList();

//               return Card(
//                   child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       // _buildList(
//                       //     context, snapshot.data.documents[index], 'francais'),
//                       // _buildList(
//                       //     context, snapshot.data.documents[index], 'portugais'),
//                       // _buildList2(context, randomListObject[index])

//                       // Text(test[0][index].francais)
//                       // Text(question[index])
//                       Text(answersList[0][index])
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );

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
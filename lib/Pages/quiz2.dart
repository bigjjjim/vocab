// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:vocab/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:math';
// import 'dart:async';
// import 'package:provider/provider.dart';
// import 'package:vocab/Components/buttonQuiz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:vocab/Module/words.dart';
// import 'package:vocab/Pages/home3.dart';

// FirebaseUser loggedInUser;
// String userid;

// var finalScore = 0;
// var questionNumber = 0;
// List<int> scorelist = [];
// List<int> indexanswerQuiz = [0, 1, 2, 3];

// MyApp myapp = MyApp();

// class Quiz extends StatefulWidget {
//   final String difficulty;
//   final int indexFirstWord;
//   final int indexLastWord;
//   // final Iterable<Words> data;

//   const Quiz({
//     Key key,
//     this.difficulty,
//     this.indexFirstWord,
//     this.indexLastWord,
//   }) : super(key: key);
//   @override
//   _QuizState createState() => _QuizState();
// }

// class _QuizState extends State<Quiz> {
//   final _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser();

//       if (user != null) {
//         loggedInUser = user;
//         setState(() {
//           userid = user.uid;
//         });

//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<bool> _onBackPressed() async {
// // Navigator.pop(context, true);
//     //  Navigator.of(context).pop();
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     int start = widget.indexFirstWord;
//     int end = widget.indexLastWord;
//     final db = DatabaseService(start, end);
//     //  final data = widget.data.elementAt(start).

//     return WillPopScope(
//         onWillPop: _onBackPressed,
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 StreamProvider<List<Words>>.value(
//                   value: db.streamWords(),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     child: WordsList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class QuizBack extends StatefulWidget {
//   QuizBack(
//       {this.question,
//       this.answersMapQuiz,
//       this.correctAnswers,
//       this.answersList});
//   final question;
//   final answersMapQuiz;
//   final correctAnswers;
//   final answersList;

//   @override
//   _QuizBackState createState() => _QuizBackState();
// }

// class _QuizBackState extends State<QuizBack> {
//   @override
//   Widget build(BuildContext context) {
//     void updateQuestion() {
//       setState(() {
//         if (questionNumber == widget.question.length - 1) {
//           Navigator.push(
//             context,
//             new MaterialPageRoute(
//               builder: (context) => Summary(
//                   score: finalScore,
//                   listscore: scorelist,
//                   listinQuiz: widget.answersMapQuiz),
//             ),
//           );
//         } else {
//           questionNumber++;
//           indexanswerQuiz.shuffle();
//         }
//       });
//     }

//     void resetQuiz() {
//       setState(() {
//         Navigator.pop(context);
//         finalScore = 0;
//         questionNumber = 0;
//         scorelist = [];
//         indexanswerQuiz.shuffle();
//       });
//     }

//     quizAnswerChecker(
//       int indexAnswer,
//     ) {
//       if (widget.answersList[questionNumber][indexAnswer] ==
//           widget.correctAnswers[questionNumber]) {
//         debugPrint("Correct");
//         finalScore++;
//         setState(() {
//           scorelist.add(1);
//         });
//       } else {
//         debugPrint("Wrong");
//         setState(() {
//           scorelist.add(0);
//         });
//       }
//       updateQuestion();

//       return scorelist;
//     }

//     return Container(
//       height: MediaQuery.of(context).size.height,
//       margin: const EdgeInsets.all(10.0),
//       alignment: Alignment.topCenter,
//       child: Column(children: <Widget>[
//         Padding(padding: EdgeInsets.all(20.0)),

//         Container(
//           alignment: Alignment.centerRight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "Question ${questionNumber + 1} of ${widget.question.length}",
//                 style: TextStyle(fontSize: 22.0),
//               ),
//               Text(
//                 "Score: $finalScore",
//                 style: TextStyle(fontSize: 22.0),
//               )
//             ],
//           ),
//         ),

//         Padding(padding: EdgeInsets.all(10.0)),

//         //  Image.asset(
//         //     "images/${quiz.images[questionNumber]}.jpg",
//         //   ),

//         Padding(padding: EdgeInsets.all(10.0)),

//         Text(
//           widget.question[questionNumber],
//           style: new TextStyle(
//             fontSize: 20.0,
//           ),
//         ),

//         Padding(padding: EdgeInsets.all(10.0)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             //button 1

//             QuizButton(
//               onPressed: () {
//                 quizAnswerChecker(indexanswerQuiz[0]);
//               },
//               word: widget.answersList[questionNumber][indexanswerQuiz[0]],
//             ),

//             QuizButton(
//               onPressed: () {
//                 quizAnswerChecker(indexanswerQuiz[1]);
//               },
//               word: widget.answersList[questionNumber][indexanswerQuiz[1]],
//             )
//           ],
//         ),

//         Padding(padding: EdgeInsets.all(10.0)),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             QuizButton(
//               onPressed: () {
//                 quizAnswerChecker(indexanswerQuiz[2]);
//               },
//               word: widget.answersList[questionNumber][indexanswerQuiz[2]],
//             ),
//             QuizButton(
//               onPressed: () {
//                 quizAnswerChecker(indexanswerQuiz[3]);
//               },
//               word: widget.answersList[questionNumber][indexanswerQuiz[3]],
//             )
//           ],
//         ),

//         Padding(padding: EdgeInsets.all(15.0)),

//         Container(
//           alignment: Alignment.bottomCenter,
//           child: MaterialButton(
//               minWidth: 240.0,
//               height: 30.0,
//               color: Colors.red,
//               onPressed:  () {questionNumber = 0;
//                       finalScore = 0;
//                       scorelist = [];
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => TableVocab()));
//                       Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               child: Text(
//                 "Quit",
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//               )),
//         ),
//         //  Expanded(child: TabsScreen(0))
//       ]),
//     );
//   }
// }

// class WordsList extends StatefulWidget {
//   // final Iterable<Words> data;
//   // WordsList();
//   @override
//   _WordsListState createState() => _WordsListState();
// }

// class _WordsListState extends State<WordsList> {
//   @override
//   Widget build(BuildContext context) {
//     final _wordsback =
//         // widget.data;
//         Provider.of<List<Words>>(context);
//     //list of words here

//     List<Words> getListForEachElement(int i, List l) {
//       final List<Words> list2 = List<Words>.from(l);
//       final List<Words> list3 = list2.sublist(0, 3);
//       // list2 = 
//       // print(list);
//       list2.remove(l[i]);
//       // print(list2);
//       list2.shuffle();
//       // print(list2);
//       // list3 = 
//       // print(list3);
//       list3.add(l[i]);
//       // print(list3);
//       return list3;
//     }

//     List<List<Words>> randomList() {
//       int _wordcount = _wordsback.length;

//       int quizLength;
//       if ((_wordcount >= 10) && (_wordcount <= 20)) {
//         //no quiz if less than 10 words, need to put catch errors in dialog.dart
//         quizLength = (_wordcount / 1.67).round();
//       } else if ((_wordcount > 20) && (_wordcount <= 40)) {
//         quizLength = (_wordcount / 2).round();
//       } else if (_wordcount > 40) {
//         quizLength = 20;
//       }

//       List<Words> newList = [];
//       newList = List<Words>.from(_wordsback);
//       newList.shuffle();
//       List<Words> listQuiz = newList.sublist(0, quizLength);
//       List<List<Words>> answersQuiz = [];

//       //here insert function in a loop?
//       for (int i = 0; i < listQuiz.length; i++) {
//         List<Words> transit = [];
//         transit = getListForEachElement(i, listQuiz);
//         answersQuiz.add(transit);
//       }

//       return answersQuiz; //return list of list of 4 words for quiz
//     }

//     List<List<Words>> answersMapQuiz = randomList();
//     var r = Random(56);
//     double proportion = ((r.nextInt(100)) / 100);

//     int lengthFirstLang = (proportion * answersMapQuiz.length).round();
//     List question = []; //thats my question words
//     List<List> answersList = [];
//     List answers = [];
//     List correctAnswers = [];

//     for (int i = 0; i < lengthFirstLang; i++) {
//       question.add(answersMapQuiz[i][3].francais);
//       correctAnswers.add(answersMapQuiz[i][3].portugais);
//       answers = [];
//       answers.add(answersMapQuiz[i][0].portugais);
//       answers.add(answersMapQuiz[i][1].portugais);
//       answers.add(answersMapQuiz[i][2].portugais);
//       answers.add(answersMapQuiz[i][3].portugais);
//       answersList.add(answers);
//     }

//     for (int i = lengthFirstLang; i < answersMapQuiz.length; i++) {
//       question.add(answersMapQuiz[i][3].portugais);
//       correctAnswers.add(answersMapQuiz[i][3].francais);
//       answers = [];

//       answers.add(answersMapQuiz[i][0].francais);
//       answers.add(answersMapQuiz[i][1].francais);
//       answers.add(answersMapQuiz[i][2].francais);
//       answers.add(answersMapQuiz[i][3].francais);
//       answersList.add(answers);
//     }

//     return QuizBack(
//       question: question,
//       answersList: answersList,
//       answersMapQuiz: answersMapQuiz,
//       correctAnswers: correctAnswers,
//     );
//   }
// }

// // class Words {
// //   final String francais;
// //   final String portugais;
// //   final int index;
// //   Words({this.francais, this.portugais, this.index});

// //   factory Words.fromFirestore(DocumentSnapshot doc) {
// //     Map data = doc.data;
// //     return Words(
// //         index: data['index'] ?? '',
// //         francais: data['francais'] ?? '',
// //         portugais: data['portugais'] ?? '');
// //   }
// // }

// class DatabaseService {
//   DatabaseService(this.start, this.end);
//   final Firestore _db = Firestore.instance;
//   int start;
//   int end;

//   //  List<Words> myWordsSnapShot(DocumentSnapshot snapshot) {
//   //   return snapshot.data['words'].map((doc) {
//   //     return Words(
//   //         index: doc['index'] ?? '',
//   //       francais: doc['francais'] ?? '',
//   //       portugais: doc['portugais'] ?? '');
//   //   }).toList();
//   // }
//   //  Stream<List<Words>>  wordsStream() {
//   //   return _db.collection('wordLists').document(userid).snapshots().map(myWordsSnapShot);
//   // }

//   Stream<List<Words>> streamWords() {
//     var ref = _db
//         .collection('words')
//         .orderBy('index')
//         .where('index')
//         .startAt([start]).endAt([end]);

//     print(ref
//         .snapshots()
//         .map((list) => list.documents.map((doc) => Words.fromFirestore(doc))));

//     return ref.snapshots().map((list) =>
//         list.documents.map((doc) => Words.fromFirestore(doc)).toList());
//   }
// }
// // //     var ref = _db.collection('wordLists').document(userid);

// // //   print(ref.snapshots().map((list) =>
// // //         list.data['words'].map((doc) => Words.fromFirestore(doc)).toList()));

// // //     return ref.snapshots().documents.map((doc) => Words.fromFirestore(doc)).toList();
// // //   }
// // }

// // snapshots();

// // _db
// //     .collection('words')
// //     .orderBy('index')
// //     .where('index')
// //     //     .startAt([start]).endAt([end]);
// // print(ref.snapshots().map((list) =>
// //         list.data['words'].values.map((doc) => Words.fromFirestore(doc)).startAt([start]).endAt([end])));

// class Summary extends StatelessWidget {
//   final int score;
//   final List listscore;
//   final List<dynamic> listinQuiz;

//   Summary({Key key, @required this.score, this.listscore, this.listinQuiz})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
    
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "Final Score: $score",
//                 style: TextStyle(fontSize: 35.0),
//               ),
//               Padding(padding: EdgeInsets.all(30.0)),
//               Row(
//                 children: <Widget>[
//                   MaterialButton(
//                     color: Colors.red,
//                     onPressed: () {
//                       questionNumber = 0;
//                       finalScore = 0;
//                       scorelist = [];
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => TableVocab()));
//                       Navigator.of(context).popUntil((route) => route.isFirst);
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //         builder: (context) => TableVocab()));
//                     },
//                     child: Text(
//                       "Back to liste",
//                       style: TextStyle(fontSize: 20.0, color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),

//     //do we need a button to reset quiz? +> not really fuck that

//                   // MaterialButton(
//                   //   color: Colors.red,
//                   //   onPressed: 
                    
//                   //   // () {
//                   //   //   questionNumber = 0;
//                   //   //   finalScore = 0;
//                   //   //   scorelist = [];
//                   //   //   Navigator.pop(context);
//                   //   // }
//                   //   ,
//                   //   child: Text(
//                   //     "Reset Quiz",
//                   //     style: TextStyle(fontSize: 20.0, color: Colors.white),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               Container(
//                 height: 300,
//                 child:
//                     // Text(listinQuiz.length.toString())
//                     ListView.builder(
//                   itemCount: listscore.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 15,
//                               child: Icon(
//                                   IconData(59539,
//                                       fontFamily: 'MaterialIcons',
//                                       matchTextDirection: true),
//                                   color: listscore[index] == 1
//                                       ? Colors.green
//                                       : Colors.red),
//                             ),
//                             SizedBox(width: 50),
//                             Container(
//                                 width: 120,
//                                 child: Text(listinQuiz[index][3].francais)),
//                             SizedBox(width: 30),
//                             Container(
//                                 width: 120,
//                                 child: Text(listinQuiz[index][3].portugais)),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

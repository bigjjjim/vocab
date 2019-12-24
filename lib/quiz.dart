import 'package:flutter/material.dart';
import 'dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


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
Widget _buildList(
      BuildContext context, DocumentSnapshot document, String langue) {
   
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(document[langue])]),
    );
  }

// Widget _buildList2(
//       BuildContext context, List<Words> w, String langue) {
   
//     return Expanded(
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [Text(w[langue]),]
//     ),);
//   }
 
  
  
  @override
  Widget build(BuildContext context) {
      int start = widget.indexFirstWord;
      int end = widget.indexLastWord;

    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('words').orderBy('index').where('index').startAt([start]).endAt([end]).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading..");
            }
  // List x = _createWords(snapshot.data);
  final wordlist = snapshot.data.documents;
// final Words worditem;
  
  
  
 
   

  // }
  
  List<Words> worditems = [];
  for(var wo in wordlist) {
    final wordindex = wo.data['index'];
    final wordfrancais = wo.data['francais'];
    final wordportugais = wo.data['portugais'];
  
  
final Words worditem = Words(francais: wordfrancais, portugais: wordportugais, index: wordindex);
  worditems.add(worditem); 
  
  }
  int wordcount = worditems.length;

   //getting words for quiz
  List<Words> randomList(){
    var randnum = Random();
    int min = worditems[0].index;
    int max = worditems.last.index;
    int range = max - min;

    // List randIndex;
    List<Words> randWordsList = [];
      for (var i = 0; i < 5; i++) {

    int j = randnum.nextInt(range);
    for (var ii = 0; ii< range; i++) {

    if(worditems[ii].index == j) {
      randWordsList.add(worditems[ii]); 
    }
    }
    
    // print(randWordsList);
  } return randWordsList;
  }
  



  return ListView.builder(
            itemExtent: 80.0,
            itemCount: wordcount,
          
            itemBuilder: (context, index) {
                // List<Words> randomListObject = randomList();

              return Card(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _buildList(
                          context, snapshot.data.documents[index], 'francais'),
                      _buildList(
                          context, snapshot.data.documents[index], 'portugais'),
                      // _buildList2(context, randomListObject[index])
                      // Text(randomListObject[index].francais)
                    ],
                  ),
                ),
              );
            },
          );
      
      
      
      
      
              },),);
  }
}
class Words {
  Words({this.francais, this.portugais, this.index});
  final String francais;
  final String portugais;
  final int index;
  bool selected = false;
}


  


// ListView(
//         children: <Widget>[
//           Container(
//             child: Text(widget.indexFirstWord.toString()),
//           ),Container(
//             child: Text(widget.indexLastWord.toString()),
//           ),Container(
//             child: Text(widget.difficulty),
//           ),
//         ],
//       ),
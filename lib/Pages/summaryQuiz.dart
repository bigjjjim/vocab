import 'package:flutter/material.dart';
import 'package:vocab/authentification/sign_in.dart';
import 'package:vocab/Components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/Pages/home4.dart';
import 'quizPage.dart';



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
    setState(() {
      userId = user.uid;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    print(widget.listinQuiz[0][3].index);
  
  var i;
  var docRef =Firestore.instance.collection('users')
      .document(userid)
      .collection('wordsscore')
      .document('wordssc');

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
      appBar: 
      AppBar(
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
      
        body: Container(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5.0)),
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
              
              "Final Score: ${widget.score}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ), 
               
                // Padding(padding: EdgeInsets.all(30.0)),
                // Row(
                //   children: <Widget>[
                //     MaterialButton(
                //       color: Colors.red,
                //       onPressed: () {
                //         questionNumber = 0;
                //         finalScore = 0;
                //         scorelist = [];

                //         Navigator.of(context).popUntil((route) => route.isFirst); 
                //       },
                //       child: Text(
                //         "Back to liste",
                //         style: TextStyle(fontSize: 20.0, color: Colors.white),
                //       ),
                //     ),
                  //   SizedBox(
                  //     width: 50,
                  //   ),
                  // ],
                // ),
                Padding(padding: EdgeInsets.all(10.0)),
                
                Container(
                  height: MediaQuery.of(context).size.height*0.7 ,
                  width: MediaQuery.of(context).size.width*0.8,
                  child:
                      ListView.builder(
                    itemCount: widget.listscore.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          // width: 150,
                          height: 50,
                          child: Card(
                            color: widget.listscore[index] == 1
                                            ? kcorrect
                                            : kerror,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                
                                  Container(
                                      width: MediaQuery.of(context).size.width*0.3,
                                      
                                      child: Text(widget.listinQuiz[index][3].francais, style: TextStyle(fontSize: 20.0, color: kcolorblacktext),)),
                                       
                                  // SizedBox(width: 30),
                                  Container(
                                      width: MediaQuery.of(context).size.width*0.3,
                                      child: Text(widget.listinQuiz[index][3].portugais, textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0, color: kcolorblacktext))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 20,
                      child: MaterialButton(
                        // color: Colors.red,
                        onPressed: () {
                          questionNumber = 0;
                          finalScore = 0;
                          scorelist = [];

                          Navigator.of(context).popUntil((route) => route.isFirst); 
                        },
                        child: Text(
                          "Back to liste",
                          style:TextStyle(fontSize: 17.0, color: Colors.grey[500]),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}

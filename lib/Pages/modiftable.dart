
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vocab/Components/Paginated.dart';
// import 'package:vocab/Module/words.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// FirebaseUser loggedInUser;
// String userid;
// Stream<DocumentSnapshot> streamM;
// var isRowCountLessDefaultRowsPerPage;
// WordDataSource dts;



// class TableVocab extends StatefulWidget {




//   @override
//   _TableVocabState createState() => _TableVocabState();
// }

// class _TableVocabState extends State<TableVocab> {
//  final _auth = FirebaseAuth.instance;
 

//   int _rowsPerPage = Paginated.defaultRowsPerPage;
//   int _rowsPerPage1 = Paginated.defaultRowsPerPage;
// @override
//   void initState() {
    
//     super.initState();
//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser();
//        final uid = user.uid;
    
//     Stream<DocumentSnapshot> streame =
//         Firestore.instance.collection('users').document(user.uid).snapshots();

//       if (user != null) {
//         loggedInUser = user;
          
//         setState(() {
//       userid = uid;
//     });
//     streamM =  streame;


//         print(loggedInUser.email);
        
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   Future<bool> _requestPop() {
//     //  _selectedIndex = 0;
//     // setState(() {
//     // _selectedIndex = 0;
//     //  Navigator.of(context).popUntil((route) => route.isFirst);

//     // });
//     return Future.value(false);
//   }


  
// @override
//   Widget build(BuildContext context) {
//     // String id = loggedInUser.uid;
//     return WillPopScope(
//       onWillPop: _requestPop,
//           child: Scaffold(
//         // appBar: AppBar(
//         //   leading: null,
//         //   actions: <Widget>[
//         //     IconButton(
//         //         icon: Icon(Icons.close),
//         //         onPressed: () {
//         //           //Implement logout functionality
//         //           handleSignOut();
//         //           // Navigator.of(context).popUntil((route) => route.isFirst);
//         //         //  Navigator.popUntil(context, ModalRoute.withName('/'));
//         //         // Navigator.pop(context);
//         //         // Navigator.pushReplacementNamed(context, '/loginscreen');
//         //       //   Navigator(
//         //       // key: myGlobals.scaffoldKey,
//         //       // onGenerateRoute: (route) => MaterialPageRoute(
//         //       //   settings: route,
//         //       //   builder: (context) => LoginScreen(),
//         //       // ),);

//         //         }),
//         //   ],),
//         // appBar: AppBar(title: Text("Vocabulary")),
        
//         body:
        
//         StreamBuilder(
//           // <QuerySnapshot>
//             // stream: Firestore.instance.collection('words').orderBy('index').snapshots(),
//             // initialData: Firestore.instance.collection('words').snapshots(),
//             stream:  streamM,

//             // Firestore.instance.collection('wordLists').document(userid).snapshots(),
              
//             // dataS,
            
            
//             builder:
//                 (BuildContext context,  AsyncSnapshot snapshot) {
//           //         if (snapshot.hasError) {
//           // return Text('Error: ${snapshot.error}');
//           // } 
//         //    if( snapshot.connectionState == ConnectionState.waiting){
//         //     return  Center(child: Text('Please wait its loading...'));
//         // } 
//               if(!snapshot.hasData) {
//                 return Text("Loading..");
//               }
//              else if (snapshot!=null && !snapshot.hasError) {
//                    // your code here
//                      List<Words> worditems = [];
//                        final wordlist = snapshot.data['words'];
//                          for(var wo in wordlist.values) {
      
//       final wordfrancais = wo['francais'];
//       final wordportugais = wo['portugais'];
  
//  final item = Words(francais: wordfrancais, portugais: wordportugais);
//  worditems.add(item);
//   }
//     dts =  WordDataSource(worditems, );


//   var tableItemsCount = dts.rowCount;
//   var defaultRowsPerPage = Paginated.defaultRowsPerPage;
//   isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
//   _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
  


// }
             
              
//               // print('=== data ===: ${snapshot.data['words']}');
//   // List x = _createWords(snapshot.data);
// //     Future<Words> worditem(wordfrancais, wordportugais)async {

// //  final word = Words(francais: wordfrancais, portugais: wordportugais);
  
// //   return word;
// //   } 


  

        



//   // int wordcount = worditems.length;

//   // List selectedList() {
      
//   // }



//   return SingleChildScrollView(
      
//           child: Paginated(
//             // horizontalMargin: 10,
//           header: Text('Vocabulaire'),
//           rowsPerPage: isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
//           availableRowsPerPage: <int>[10, 20, 30],
//           onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage ? null : (int value) {
//             setState(() {
//               _rowsPerPage1 = value;
//             });
//           },
//           columns: kTableColumns,
          
//           source: dts,
//           dataquiz: dts.xx,
//         ),
                  
//               );
//             }),
//       ),
//     );
//   }
// }


// ////// Columns in table.
// const kTableColumns = <DataColumn>[
//   DataColumn(
//     label: const Text('Francais'),
//   ),
//   DataColumn(
//     label: const Text('Portugais'),    
//   ),  
// ];

// ////// Data class. 


// class WordDataSource extends DataTableSource  {
//   WordDataSource(this.xx);
//   // int _selectedCount = 0;
//   List<Words> xx;
//   // final Function onRowSelected;
//   // int wordcount;


//   @override
  
//   DataRow getRow(int index) {  
//     assert(index >= 0);
//     if (index >= xx.length) return null;
//     final Words word = xx[index];
//     return DataRow.byIndex(
//         index: index,
//         selected: word.selected,
//     //     onSelectChanged: (bool value) {
//     //       checkIfLikedOrNot(index) async{
            
//     //    DocumentSnapshot ds = await Firestore.instance.collection("wordsSelected").document(index).get();
//     //    return ds;
//     //     // this.setState(() {
//     //     //   isLiked = ds.exists;
//     //     // });

//     // }
          
//     //       if (word.selected != value) {
//     //         _selectedCount += value ? 1 : -1;
//     //         assert(_selectedCount >= 0);
//     //         word.selected = value;
//     //         notifyListeners();
//     //         // need to create entry on firestore here
//     //        if (value == true) {
//     //          print('${word.francais} selected');
//     //         Firestore.instance.collection('wordsSelected').document('$index').setData(
//     //            {'index': index, 'francais': word.francais, 'portugais': word.portugais} );
             
//     //         } else if (value == false) {
              
//     //           if (checkIfLikedOrNot(index.toString()) != null) { 
//     //           Firestore.instance.collection('wordsSelected').document('$index').delete();

//     //           }

//     //         }
//     //       //   onRowSelected();
//     //       }
           
//     //     }
//     // ,
//         cells: <DataCell>[
          
//           DataCell(Container(width: 200, child: Text('${word.francais}'))),
//           DataCell(Container(width: 200, child: Text('${word.portugais}'))),
          
//         ]);
//   }

//   @override
//   int get rowCount => xx.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;

  
  
// }
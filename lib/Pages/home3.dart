// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vocab/Components/Paginated.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:vocab/Module/words.dart';
// import 'package:provider/provider.dart';


// FirebaseUser loggedInUser; 
// String userid;
// var isRowCountLessDefaultRowsPerPage;
// WordDataSource dts;

// class HomeTable extends StatefulWidget {
//   @override
//   _HomeTableState createState() => _HomeTableState();
// }

// class _HomeTableState extends State<HomeTable> {
//   final _auth = FirebaseAuth.instance;
//   // int _rowsPerPage = Paginated.defaultRowsPerPage;
//   // int _rowsPerPage1 = Paginated.defaultRowsPerPage;

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser();
//       final uid = user.uid;
//       if (user != null) {
//         loggedInUser = user;
//         setState(() {
//           userid = uid;
//         });
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<bool> _requestPop() {
//     return Future.value(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final db = DatabaseService();

//     return WillPopScope(
//       onWillPop: _requestPop,
//       child: Scaffold(
//         body: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 StreamProvider<List<Words>>.value(
//                   value: db.streamWords(),
//                   initialData: [Words(francais: '', portugais: '', index: 0)],
//                   child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     child: PaginatedTable(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
        
        
//         )
//       );
//   }
// }


// const kTableColumns = <DataColumn>[
//   DataColumn(
//     label: const Text('Francais'),
//   ),
//   DataColumn(
//     label: const Text('Portugais'),    
//   ),  
// ];

// class WordDataSource extends DataTableSource  {
//   WordDataSource(this.xx);
//   List<Words> xx;

//   @override
  
//   DataRow getRow(int index) {  
//     assert(index >= 0);
//     if (index >= xx.length) return null;
//     final Words word = xx[index];
//     return DataRow.byIndex(
//         index: index,
//         // selected: word.selected,
  
//         cells: <DataCell>[
          
//           DataCell(Container(width: 200, child: Text('${word.francais}'))),
//           DataCell(Container(width: 200, child: Text('${word.portugais}'))),
          
//         ]);
        
//   }
//     @override
//   int get rowCount => xx.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;
// }

// class Words {
//   final String francais;
//   final String portugais;
//   final int index;
//   Words({this.francais, this.portugais, this.index});

//   factory Words.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data;
//     return Words(
//         index: data['index'] ?? '',
//         francais: data['francais'] ?? '',
//         portugais: data['portugais'] ?? '');
//   }
// }

// class DatabaseService {
  
//   final Firestore _db = Firestore.instance;

//   Stream<List<Words>> streamWords() {
//     var ref =  _db
//         .collection('words')
//         .orderBy('index');

//   //   var ref2 = Firestore.instance.collection('users').document(userid).collection('wordsscore').document('wordssc').snapshots();
//   //  List<Words> worditems = [];
//   //           final wordlist = ref2['words'];

//   //     for(var wo in wordlist.values) {
      
//   //     final wordfrancais = wo['francais'];
//   //     final wordportugais = wo['portugais'];

//   //     final item = Words(francais: wordfrancais, portugais: wordportugais);
//   //     worditems.add(item);
//   //                        }
//     return

//         ref.snapshots().map((list) =>
//         list.documents.map((doc) => Words.fromFirestore(doc)).toList());
//   }
// }
// // // DocumentReference getWords() {
// // //   return Firestore.instance.collection('users').document(userid).collection('wordsscore').document('wordssc');
// // // }

// class PaginatedTable extends StatefulWidget {
//   @override
//   _PaginatedTableState createState() => _PaginatedTableState();
// }

// class _PaginatedTableState extends State<PaginatedTable> {
//   int _rowsPerPage = Paginated.defaultRowsPerPage;
//   int _rowsPerPage1 = Paginated.defaultRowsPerPage;
//   @override
//   Widget build(BuildContext context) {
//     final _wordsback =
//         // widget.data;
//         Provider.of<List<Words>>(context);
//         dts =  WordDataSource(_wordsback, );
//               var tableItemsCount = dts.rowCount;
//               var defaultRowsPerPage = Paginated.defaultRowsPerPage;
//               isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
//               _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
                       
//     return  SingleChildScrollView(
      
//           child: 
          
//           Paginated(
//             // horizontalMargin: 10,
//           header: Text('Vocabulaire'),
//           availableRowsPerPage: <int>[10, 20, 30],
//           onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage ? null : (rowCount) {
//             setState(() {
//               _rowsPerPage1 = rowCount;
              
//             });
//           },
//           columns: kTableColumns,
          
//           source: dts,
//           dataquiz: dts.xx,
//           rowsPerPage: isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,

//         ),
                  
//               );
//   }
// }
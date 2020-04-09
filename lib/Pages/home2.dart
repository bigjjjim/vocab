// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vocab/Components/Paginated.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:vocab/Module/words.dart';

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
//   int _rowsPerPage = Paginated.defaultRowsPerPage;
//   int _rowsPerPage1 = Paginated.defaultRowsPerPage;

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
//     return WillPopScope(
//       onWillPop: _requestPop,
//       child: Scaffold(
//         body: StreamBuilder(
//           stream: getWords().snapshots(),
//           builder: (context, snapshots) {
//             if (snapshots.connectionState == ConnectionState.active && snapshots.hasData && snapshots.data.data != null) {

//                List<Words> worditems = [];
//             final wordlist = snapshots.data['words'];

//       for(var wo in wordlist.values) {
      
//       final wordfrancais = wo['francais'];
//       final wordportugais = wo['portugais'];

//       final item = Words(francais: wordfrancais, portugais: wordportugais);
//       worditems.add(item);
//                          }
              
//               dts =  WordDataSource(worditems, );
//               var tableItemsCount = dts.rowCount;
//               var defaultRowsPerPage = Paginated.defaultRowsPerPage;
//               isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
//               _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
                          
              
//               return 
//               SingleChildScrollView(
      
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
//           // dataquiz: dts.xx,
//           rowsPerPage: isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,

//         ),
                  
//               ); //here is what you wanna return




//             } else if (snapshots.connectionState == ConnectionState.waiting) {
//               return Container(child: Center(child: CircularProgressIndicator()));
//           } else {

//             return Container(child: Center(child: CircularProgressIndicator()));
//             // return Container(
//             //   child: Column(
//             //     children: <Widget>[
//             //       Padding(
//             //         padding: const EdgeInsets.all(8.0),
//             //         child: Icon(Icons.warning),
//             //       ),
//             //       Text('Error in loadind data')
//             //     ],
//             //   ),
//             // );
//           }
//           }),),);
//   }} 

// DocumentReference getWords() {
//   return Firestore.instance.collection('users').document(userid);
// }



            
// // class Word {
// //   final DocumentReference documentReference;
// //   String francais;
// //   String portugais;
// //   // bool selected = false;
// //   int index;

// //   Word.data(this.documentReference, [this.index, this.francais, this.portugais]) {
// //     this.index ??= 0;
// //     this.francais ??= '';
// //     this.portugais ??= '';
// //   }

// // factory Word.from(DocumentSnapshot document) => Word.data(
// //   document != null ? document.reference : null,
// //   document.data['index'],
// //   document.data['francais'],
// //   document.data['portugais']
// // );

// // Map<String, dynamic> toMap() {
// //   return {
// //     'index' : index,
// //     'francais' : francais,
// //     'portugais' : portugais,
// //   };
// // }

// // }       


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
//         // selected: word.selected,
  
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

      
    
  


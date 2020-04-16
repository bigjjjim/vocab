import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocab/Components/Paginated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/home.dart';
import 'quizPage.dart';

FirebaseUser loggedInUser;
String userid;
var isRowCountLessDefaultRowsPerPage;
WordDataSource dts;
  void sortingList(List a){
    a.sort((a,b) => a.index.cast .compareTo(b.index));
  }
  

class HomeTable extends StatefulWidget {
  @override
  _HomeTableState createState() => _HomeTableState();
  
}

class _HomeTableState extends State<HomeTable>  {
    // var _scaffoldKey = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;
  int _rowsPerPage = Paginated.defaultRowsPerPage;
  int _rowsPerPage1 = Paginated.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      final uid = user.uid;
      if (user != null) {
        loggedInUser = user;
        setState(() {
          userid = uid;
        });
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _requestPop() {
    return Future.value(false);
  }


  @override
  Widget build(BuildContext context) {
    // final db = DatabaseService();
  
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        body: SingleChildScrollView(
                  child: StreamBuilder(
              stream: getWords().snapshots(),
              builder: ( BuildContext context, AsyncSnapshot snapshots ) {
                
                if (snapshots.connectionState == ConnectionState.active &&
                    snapshots.hasData &&
                    snapshots.data.data != null) {
                  List<Words2> worditems = [];
                  final wordlist = snapshots.data['words'];

                  for (var wo in wordlist.values)  {
                    final wordfrancais = wo['francais'];
                    final wordportugais = wo['portugais'];
                    final wordindex = wo['index'];
                    final wordQuiz1 = wo['quiz1'];
                    final wordQuiz2 = wo['quiz2'];

                    final item = 
                        Words2(francais: wordfrancais, portugais: wordportugais, index: wordindex,quiz1: wordQuiz1, quiz2: wordQuiz2 );
                    worditems.add(item);

                  }

                  dts =  WordDataSource(worditems, );
                  var tableItemsCount = dts.rowCount;
                  
                  var defaultRowsPerPage = Paginated.defaultRowsPerPage;
                  isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
                  _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
                  return 
                  Paginated(
          // horizontalMargin: 10,
          header: Text('Vocabulaire'),
          availableRowsPerPage: <int>[10, 20, 30],
          onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage
              ? null
              : (rowCount) {
                  setState(() {
                    _rowsPerPage1 = rowCount;
                  });
                },
          columns: kTableColumns,
          onPageChanged:(b)=> setState(() {
            PageStorage.of(context).writeState(context, b, identifier: ValueKey(
              '${dts.index }'
            ));
            
          }),
          source: dts,
          dataquiz: dts.xx,
          rowsPerPage: 
          isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
          // initialFirstRowIndex: _firstRowToShow1 ,
      );

                 } else if (snapshots.connectionState == ConnectionState.waiting) {
                return Container(child: Center(child: CircularProgressIndicator()));
            } else {

              return Container(child: Center(child: CircularProgressIndicator()));
              }}),
        ),
      ),
    );
  }



}

const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('Francais'),
  ),
  DataColumn(
    label: const Text('Portugais'),
  ),
];

class WordDataSource extends DataTableSource {
  
  List<Words2> xx;
  WordDataSource(this.xx);

  int index;
  @override


  DataRow getRow(int index) {
    xx.sort((a,b) => (a.index).compareTo(b.index));

    assert(index >= 0);
    if (index >= xx.length) return null;
    final Words2 word = xx[index];
    return DataRow.byIndex(index: index,
        // selected: word.selected,
        cells: 
        ( xx[index].quiz1 == 1)? 

        

        <DataCell>[
          
          DataCell(Container(width: 200, child: Text('${word.francais}', style: TextStyle(color: Colors.green)))),
          DataCell(Container(width: 200, child: Text('${word.portugais}',  style: TextStyle(color: Colors.green)))),
        ] : ( xx[index].quiz1 == -1) ? 
        
        <DataCell>[
          
          DataCell(Container(width: 200, child: Text('${word.francais}',  style: TextStyle(color: Colors.red)))),
          DataCell(Container(width: 200, child: Text('${word.portugais}', style: TextStyle(color: Colors.red)))),
        ]: <DataCell>[
          
          DataCell(Container(width: 200, child: Text('${word.francais}'))),
          DataCell(Container(width: 200, child: Text('${word.portugais}'))),
        ]
        
        ) ;
  }

  @override
  int get rowCount => xx.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  // @override
  // int get firstrowindex => ;


}

class Words2 {
  final String francais;
  final String portugais;
  final int index;
  final int quiz1;
  final int quiz2;
  Words2({this.francais, this.portugais, this.index, this.quiz1, this.quiz2});
}

DocumentReference getWords() {
  return Firestore.instance
      .collection('users')
      .document(userid)
      .collection('wordsscore')
      .document('wordssc') ;
}



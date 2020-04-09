import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocab/Components/Paginated.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:vocab/Module/words.dart';
// import 'package:provider/provider.dart';

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
// StreamController<String> streamController = StreamController();

class _HomeTableState extends State<HomeTable>  {
    // var _scaffoldKey = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;
  int _rowsPerPage = Paginated.defaultRowsPerPage;
  int _rowsPerPage1 = Paginated.defaultRowsPerPage;
  StreamController _streamController ;
  Stream _stream;

  // int _firstRowToShow = Paginated.defaultFirstIndex;
  // int _firstRowToShow1 = Paginated.defaultFirstIndex;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getWords();
    _streamController = StreamController();
    // _stream = _streamController.
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
        // key: _scaffoldKey,
       
        body: SingleChildScrollView(
                  child: StreamBuilder(
              stream: getWords().snapshots(),
              builder: ( BuildContext context, AsyncSnapshot snapshots ) {
                
                if (snapshots.connectionState == ConnectionState.active &&
                    snapshots.hasData &&
                    snapshots.data.data != null) {
                  List<Words2> worditems = [];
                  final wordlist = snapshots.data['words'];
                  // (wordlist as List).sort((a,b) => a['index'].compareTo(b['index']));

                  // Stream.fromIterable(wordlist).asyncMap((event) => event.toList());
                  // List.generate(length, (index) => null)

                  for (var wo in wordlist.values)  {
                    final wordfrancais = wo['francais'];
                    final wordportugais = wo['portugais'];
                    final wordindex = wo['index'];

                    final item = 
                        Words2(francais: wordfrancais, portugais: wordportugais, index: wordindex);
                    worditems.add(item);

                  }

                  
                  // worditems.sort((a,b) => a.index)
                  // wordlist.values.foreach((index, value) {
                  //   final wordfrancais = wordlist.values['francais'];
                  //   final wordportugais = wordlist.values['francais'];
                  //   final item = Words2(francais: wordfrancais, portugais: wordportugais);
                  //   worditems.add(item);
                  // });
                //  var values= wordlist.values;
                //   values.forEach((key, value) {
                //     print(value['francais']);
                //     });
                //  objects.sort((a, b) {
  // return a.value['name'].toString().toLowerCase().compareTo(b.value['name'].toString().toLowerCase());
// });            
                // if (worditems.length == 1000) {
                  // worditems.sort((a,b) => a.index.compareTo(b.index));
                // }

                
                

                  dts =  WordDataSource(worditems, );
                  var tableItemsCount = dts.rowCount;
                  
                  // var defaultFirstIndex = Paginated.defaultFirstIndex;
                  var defaultRowsPerPage = Paginated.defaultRowsPerPage;
                  isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
                  _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
                  // _firstRowToShow = defaultFirstIndex;
                  return 
                  // PaginatedTable(worditems);
               
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
    
    // xx.sort((a,b) => (a.index).compareTo(b.index));
  // (productList[i]['sizes'] as List).sort((a, b) => a['price'].compareTo(b['price']))
    // (xx[index] as List).sort((a,b) => a.index.compareTo(b.index));
    xx.sort((a,b) => (a.index).compareTo(b.index));



    assert(index >= 0);
    if (index >= xx.length) return null;
    final Words2 word = xx[index];
    return DataRow.byIndex(index: index,
        // selected: word.selected,
        

        cells: <DataCell>[
          DataCell(Container(width: 200, child: Text('${word.francais}'))),
          DataCell(Container(width: 200, child: Text('${word.portugais}'))),
        ]);
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
  Words2({this.francais, this.portugais, this.index});
}

DocumentReference getWords() {
  return Firestore.instance
      .collection('users')
      .document(userid)
      .collection('wordsscore')
      .document('wordssc') ;
}



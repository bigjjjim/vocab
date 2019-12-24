import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'paginated.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart


class TableVocab extends StatefulWidget {
  @override
  _TableVocabState createState() => _TableVocabState();
}

class _TableVocabState extends State<TableVocab> {

  int _rowsPerPage = Paginated.defaultRowsPerPage;
  int _rowsPerPage1 = Paginated.defaultRowsPerPage;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Vocabulary")),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('words').orderBy('index').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading..");
            }
  // List x = _createWords(snapshot.data);
  final wordlist = snapshot.data.documents;
  List<Words> worditems = [];
  for(var wo in wordlist) {
    final wordfrancais = wo.data['francais'];
    final wordportugais = wo.data['portugais'];
  
  final Words worditem = Words(francais: wordfrancais, portugais: wordportugais);
  worditems.add(worditem); 
  }
  int wordcount = worditems.length;
  WordDataSource dts = WordDataSource(worditems);
  var tableItemsCount = dts.rowCount;
  var defaultRowsPerPage = Paginated.defaultRowsPerPage;
  var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
  _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
  

  return SingleChildScrollView(
        child: Paginated(
          // horizontalMargin: 10,
        header: Text('Vocabulaire'),
        rowsPerPage: isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
        availableRowsPerPage: <int>[10, 20, 30],
        onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage ? null : (int value) {
          setState(() {
            _rowsPerPage1 = value;
          });
        },
        columns: kTableColumns,
        source: dts,
      ),
                
            );
          }),
    );
  }
}


////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('Francais'),
  ),
  DataColumn(
    label: const Text('Portugais'),    
  ),  
];

////// Data class. 
class Words {
  Words({this.francais, this.portugais});
  final String francais;
  final String portugais;
  bool selected = false;
}

class WordDataSource extends DataTableSource {
  WordDataSource(this.xx);
  int _selectedCount = 0;
  List<Words> xx;
  // int wordcount;

  
  @override
  
  DataRow getRow(int index) {  
    assert(index >= 0);
    if (index >= xx.length) return null;
    final Words word = xx[index];
    return DataRow.byIndex(
        index: index,
        selected: word.selected,
        onSelectChanged: (bool value) {
          if (word.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            word.selected = value;
            notifyListeners();
          }
        },
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

  
  
}
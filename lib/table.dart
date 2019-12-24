import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart


class TableVocab extends StatefulWidget {
  @override
  _TableVocabState createState() => _TableVocabState();
}

class _TableVocabState extends State<TableVocab> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vocabulary")),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('words').snapshots(),
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
  WordDataSource dts = WordDataSource(worditems, wordcount);


  return SingleChildScrollView(
        child: PaginatedDataTable(
        header: Text('Vocabulaire'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: <int>[10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
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
  WordDataSource(this.xx, this.wordcount);
  int _selectedCount = 0;
  List<Words> xx;
  int wordcount;

  
  @override
  
  DataRow getRow(int index) {  
    assert(index >= 0);
    if (index >= wordcount) return null;
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
          DataCell(Text('${word.francais}')),
          DataCell(Text('${word.portugais}')),
          
        ]);
  }

  @override
  int get rowCount => wordcount;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  
  
}
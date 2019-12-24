import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 't.dart';
// import 'table.dart';
import 'modiftable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: TableVocab(),
    );
  }
}

class HomePage extends StatelessWidget {

  var controller = PageController(viewportFraction: 1/500);

  Widget _buildList(
      BuildContext context, DocumentSnapshot document, String langue) {
   
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(document[langue])]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vocabulary")),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('words').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          return ListView.builder(
            itemExtent: 80.0,
            // itemCount: 2,
          
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _buildList(
                          context, snapshot.data.documents[index], 'francais'),
                      _buildList(
                          context, snapshot.data.documents[index], 'portugais'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// return ListView(children: createChildren(snapshot));
//     },
//   );
// }

//     Scaffold(
//       appBar: AppBar(
//         title: Text('vocabulary'),
//         elevation: 0.0,
//       ),
//       body:  null,
//     );

//   }
// }

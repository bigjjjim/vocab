import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Pages/VerbPage.dart';
import 'home4.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'Recherche';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // var result = Firestore.instance.collection('words').where("francais", isEqualTo: "${SearchDelegate.query}").getDocuments();
    var result = query.toLowerCase();
    int i,j;
    List resultList = [];
    List<List> resultListVerbs= [];
    for (j = 0; j < listVerbs.length; j++) {
                      if (listVerbs[j][0].contains(result) || listVerbs[j][1].contains(result)) {
                        resultListVerbs.add(listVerbs[j]);
                        // print(resultListVerbs);
                        
                      }
                    }
    
    if (query.length < 3) {
      return Scaffold(
        backgroundColor: kcolorbackground,
              body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "La recherche doit être au minimum 3 lettres.",
              ),
            )
          ],
        ),
      );
    }
     

    return Scaffold(
      backgroundColor: kcolorbackground,
          body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          // Container(child: Text("Vocabulaire: ")),

          Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                ),
                color: krow2,
              ),
              child: ListTile(
                  title:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Vocabulaire: ",
                          style: stylegrammaireheader,
                        )))
              ]))),

          FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('data.json'),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  default:
                    // Completed with error
                    if (snapshot.hasError)
                      return Container(child: Text(snapshot.error.toString()));

                    // Completed with data

                    var new_data = json.decode(snapshot.data);
                    for (i = 1; i <= 1000; i++) {
                      if (new_data[i.toString()]['francais'].contains(result) ||
                          new_data[i.toString()]['portugais'].contains(result)) {
                        resultList.add(i.toString());
                        print(resultList);
                      }
                    }

                     

                    return //need a itembuilder

                        resultList.isEmpty
                            ? Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                ),
                color: krow1,
              ),
              child: ListTile(
                  title:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "-",
                          style: stylegrammaireheader,
                        )))
              ])))
                            : Expanded(
                                child: ListView.builder(
                                    itemCount: resultList.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey[300]),
                                            ),
                                            color: index.isEven ? krow1 : krow2,
                                          ),
                                          child: ListTile(
                                              title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                Expanded(
                                                  
                                                        child: MaterialButton(
                                                          onPressed: () => speakingFrench(new_data[
                                                                    resultList[index]]
                                                                ['francais']),
                                                            child: Container(
                                                          padding: EdgeInsets.only(
                                                              left: 0),
                                                          child: Text(
                                                            new_data[
                                                                    resultList[index]]
                                                                ['francais'],
                                                            style: styleMainTable,
                                                          ),
                                                          width: MediaQuery.of(context).size.width*0.45),
                                                        ),
                                                  
                                                ),
                                                // SizedBox(width: 5),
                                                Text('|',
                                                    style: TextStyle(
                                                        color: Colors.orange)),
                                                SizedBox(width: 5),
                                                Expanded(
                                                  child: MaterialButton(
                                                      onPressed: () => speakingPortugais(new_data[
                                                                  resultList[index]]
                                                              ['portugais']),
                                                       child: Container(
                                                        child: Text(
                                                          new_data[
                                                                  resultList[index]]
                                                              ['portugais'],
                                                          style: styleMainTable,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        width: MediaQuery.of(context).size.width*0.45),
                                                  ),
                                                ),
                                              ])));
                                      // Row(
                                      //   children: <Widget>[
                                      //     Text(new_data[resultList[index]]['francais']),
                                      //     Text(new_data[resultList[index]]['portugais'])
                                      //   ],
                                      // )
                                    }),
                              );
                }
              }),


//insert verbs search here
Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                ),
                color: krow2,
              ),
              child: ListTile(
                  title:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Verbes: ",
                          style: stylegrammaireheader,
                        )))
              ]))),
resultListVerbs.isEmpty
                            ? Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                ),
                color: krow1,
              ),
              child: ListTile(
                  title:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "-",
                          style: stylegrammaireheader,
                        )))
              ])))
                            : 
Expanded(
                                child: ListView.builder(
                                    itemCount: resultListVerbs.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey[300]),
                                            ),
                                            color: index.isEven ? krow1 : krow2,
                                          ),
                                          child: ListTile(
                                              title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                Expanded(
                                                  child: MaterialButton(
                                                    onPressed: () => speakingFrench(resultListVerbs[index][0]),
                                                          child: Container(
                                                        padding: EdgeInsets.only(
                                                            left: 10),
                                                        child: Text(
                                                          resultListVerbs[index][0],
                                                          style: styleMainTable,
                                                        ),
                                                        width: 110),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text('|',
                                                    style: TextStyle(
                                                        color: Colors.orange)),
                                                SizedBox(width: 5),
                                                Expanded(
                                                  child: MaterialButton(
                                                    onPressed: () => speakingPortugais(resultListVerbs[index][1]),
                                                     child: Container(
                                                        child: Text(
                                                          resultListVerbs[index][1],
                                                          style: styleMainTable,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        width: 110),
                                                  ),
                                                ),
                                              ])));
                                      // Row(
                                      //   children: <Widget>[
                                      //     Text(new_data[resultList[index]]['francais']),
                                      //     Text(new_data[resultList[index]]['portugais'])
                                      //   ],
                                      // )
                                    }),
                              )






        ]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Column());
  }
}

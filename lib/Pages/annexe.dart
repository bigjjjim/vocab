import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:vocab/authentification/sign_in.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Components/buttonQuiz.dart';
// import 'package:vocab/authentification/sign_in.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
// import 'package:vocab/Components/datasource.dart' as tabsource;
import 'package:vocab/Components/GrammaireConst.dart';

class Annexe extends StatefulWidget {
  // Annexe();

  @override
  _AnnexeState createState() => _AnnexeState();
}

class _AnnexeState extends State<Annexe> {
  Color color1 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcolorbackground,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("grammairePage");
              },
              word: "Grammaire",
              color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(onPressed:  () {
                Navigator.of(context).pushNamed("nombresPage");
              }, word: "Nombres", color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("joursPage");
              }, word: "Jours et Mois", color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(
              onPressed:   () {
                Navigator.of(context).pushNamed("expressionsPage");
              },  word: "Expressions", color: Colors.white),
          SizedBox(height: 70),
          Container(
            child: Image.asset(
              'images/elephant.png',
              scale: 2.3,
              color: kbackgroundAppbar,
            ),
          )
        ],
      ),
    );
  }
}

class GrammairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.orange,
        ),
        child:
            // DefaultTextStyle(

            // style: TextStyle(color: kcolorblacktext, fontWeight: FontWeight.bold, fontSize: 25),
            // child:

            SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 30),

              ExpansionTile(
                title: Text("Pronoms", style: stylegrammaireheader),
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                      // key: _tableKey,
                      columns: kTablePronColumns,
                      // sortColumnIndex: widget.sortColumnIndex,
                      // sortAscending: widget.sortAscending,
                      // onSelectAll: widget.onSelectAll,
                      // dataRowHeight: widget.dataRowHeight,
                      // headingRowHeight: widget.headingRowHeight,
                      // horizontalMargin: widget.horizontalMargin,
                      // columnSpacing: widget.columnSpacing,
                      rows:
                          listpronoms(MediaQuery.of(context).size.width * 0.3),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),

              // SizedBox(height: 30),
              Divider(),
              ExpansionTile(
                title: Text("Pronoms Possessifs Singulier",
                    style: stylegrammaireheader),
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTablePossColumns,
                        rows: listRowPos(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                ],
              ),

              Divider(),
              ExpansionTile(
                title: Text("Pronoms Possessifs Pluriel",
                    style: stylegrammaireheader),
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.center,
                      child: tab.DataTable(
                        columns: kTablePossColumnsPlu,
                        rows: listRowPossplus(
                            MediaQuery.of(context).size.width * 0.3),
                      )),
                ],
              ),

              Divider(),
              ExpansionTile(
                  title: Text("Article", style: stylegrammaireheader),
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                        child: Row(children: [
                      Icon(Icons.arrow_right),
                      Expanded(
                          child: Text(
                              "On accorde l’article en fonction de genre masculin ou féminin, comme en français."))
                    ])),
                    SizedBox(height: 10),
                    Container(
                        child: Row(children: [
                      Icon(Icons.arrow_right),
                      Expanded(
                          child: Text(
                              "On décline l’article en fonction du nombre, singulier ou pluriel, comme en français."))
                    ])),
                    SizedBox(height: 10),
                    Container(
                        child: Row(children: [
                      Icon(Icons.arrow_right),
                      Expanded(
                          child:
                              Text("Les formes contractées sont nombreuses!"))
                    ])),
                  ]),
              Divider(),

              ExpansionTile(
                title: Text("Article Indéfinis", style: stylegrammaireheader),
                children: <Widget>[
                  Container(
                    child: Text(
                      'Définis:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      "On adopte un article indéfini lorsque le substantif se réfère à une chose quelconque dans un ensemble.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTableArtInDef,
                        rows: listRowartInd(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                                      SizedBox(height: 20),

                  Container(
                    child: Text(
                      'Contractions:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTablecontraction1,
                        rows: listrowcontrac1(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                ],
              ),

              Divider(),
              ExpansionTile(
                title: Text("Article Indéfinis", style: stylegrammaireheader),
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                      child: Text(
                          "On emploi un article défini lorsque le substantif qu’il précède se réfère à quelque chose de spécifique.", textAlign: TextAlign.center,)),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTableArtDef,
                        rows: listRowartdef(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Row(children: [
                    Icon(Icons.arrow_right),
                    Expanded(
                        child: Text(
                            "Attention: Du, de, de la, des ne se traduisent généralement pas, ils se caractérisent par l'absence d'article."))
                  ])),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Contractions:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTablecontraction2,
                        rows: listrowcontract2(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: tab.DataTable(
                        columns: kTablecontraction3,
                        rows: listrowcontract3(
                            MediaQuery.of(context).size.width * 0.3)),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

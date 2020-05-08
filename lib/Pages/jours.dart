import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/joursConst.dart';
import 'package:vocab/Components/constant.dart';

class JoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.orange,
        ),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            ExpansionTile(
              title: Text("Les Jours", style: stylegrammaireheader),
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  child: tab.DataTable(
                      columns: kTableJours,
                      rows: listJours(MediaQuery.of(context).size.width * 0.3)),
                ),
                SizedBox(height: 20),
                Container(
                    child: Row(children: [
                  Icon(Icons.arrow_right),
                  Expanded(
                      child: Text(
                          "Dans une phrase le jours de la semaine est précédé par l'article no (=em+o) ou na (=em+a)."))
                ])),
                SizedBox(height: 20),
                Container(
                    child: Row(children: [
                  Icon(Icons.arrow_right),
                  Expanded(child: Text("Feira n’est pas utilisé en general"))
                ])),
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("Les Mois", style: stylegrammaireheader),
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  child: tab.DataTable(
                      columns: kTableMois,
                      rows: listMois(MediaQuery.of(context).size.width * 0.3)),
                ),
             
               SizedBox(height: 20),
                Container(
                    child: Row(children: [
                  Icon(Icons.arrow_right),
                  Expanded(
                      child: Text(
                          "Dans une phrase un mois est précédé du mot 'em'"))
                ])),
                
             
              ],
            ),
            Divider(),
          ]),
        ),
      ),
    );
  }
}

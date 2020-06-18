import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/joursConst.dart';
import 'package:vocab/Components/constant.dart';
import 'dart:math' as math;

import 'package:vocab/Pages/home4.dart';

class JoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.orange,
        ),
        child: Column(
          children: <Widget>[
            Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.rotate(angle: 180 * math.pi / 180,
                        child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.black38,), onPressed: Navigator.of(context).pop)),
                      ],
                    ),
            Expanded(
                      child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  ExpansionTile(
                    title: Text("Les Jours", style: stylegrammaireheader),
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        child: tab.DataTable(
                            columns: kTableJours,
                            rows: 
                            // listJours(MediaQuery.of(context).size.width * 0.3)
                            
          listJoursFlat // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => tab.DataRow(
                      cells: <tab.DataCell>[
                        tab.DataCell(MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => speakingFrench("${element[0]}"),
                          child: Text(element[0], style: styleRowTable))),
                          
                           //Extracting from Map element the value
                        tab.DataCell(
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                          onPressed: () => speakingPortugais("${element[1]}"),
                            child: Text(element[1], style: styleRowTable))
                          ),
                        
                      ],
                    )),
              )
              .toList(),

                            ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                        Icon(Icons.arrow_right, color:  Colors.orange,),
                        Expanded(
                              child: Text(
                                  "Dans une phrase le jours de la semaine est précédé par l'article no (=em+o) ou na (=em+a).", style: styletempsverb,))
                      ]),
                          )),
                      SizedBox(height: 20),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                        Icon(Icons.arrow_right, color: Colors.orange),
                        Expanded(child: Text("Feira n’est pas utilisé en général", style: styletempsverb))
                      ]),
                          )),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text("Les Mois", style: stylegrammaireheader),
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        child: tab.DataTable(
                            columns: kTableMois,
                            rows: 
                            // listMois(MediaQuery.of(context).size.width * 0.3)
                            listMoisFlat // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => tab.DataRow(
                      cells: <tab.DataCell>[
                        tab.DataCell(MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => speakingFrench("${element[0]}"),
                          child: Text(element[0], style: styleRowTable))),
                          
                           //Extracting from Map element the value
                        tab.DataCell(
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                          onPressed: () => speakingPortugais("${element[1]}"),
                            child: Text(element[1], style: styleRowTable))
                          ),
                        
                      ],
                    )),
              )
              .toList(),
                            ),
                            
                      ),
                   
                     SizedBox(height: 20),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                        Icon(Icons.arrow_right, color: Colors.orange),
                        Expanded(
                              child: Text(
                                  "Dans une phrase un mois est précédé du mot 'em'", style: styletempsverb))
                      ]),
                          )),
                      
                   
                    ],
                  ),
                  Divider(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

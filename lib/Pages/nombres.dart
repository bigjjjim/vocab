import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Components/tabledata.dart'  as tab;
import 'package:vocab/Components/nombreConst.dart';
import 'dart:math' as math;
import 'package:vocab/Pages/home4.dart';



class NombresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: krow2,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.rotate(angle: 180 * math.pi / 180,
                        child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.black38,), onPressed: Navigator.of(context).pop)),
                      ],
                    ),
                DefaultTextStyle(
                  style: stylemodeverb,
                                  child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                alignment: Alignment.center,
                                child: tab.DataTable(
                                  columns: kTableNombres,
                                  
                                  rows: 
                                  // listNombres(
                                  //     MediaQuery.of(context).size.width * 0.1) ,
                                  listNombresFlat.map((element) => 
                                  tab.DataRow(
                      cells: <tab.DataCell>[
                        tab.DataCell(
                          
                         Container(
                           width: MediaQuery.of(context).size.width * 0.1,
                           child: Text(element[0], style: styleRowTable))),
                          
                           //Extracting from Map element the value
                        tab.DataCell(
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                          onPressed: () => speakingFrench("${element[1]}"),
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text(element[1], style: styleRowTable)))
                          ),
                          tab.DataCell(
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                          onPressed: () => speakingPortugais("${element[2]}"),
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.25,
                              padding: EdgeInsets.only(right: 8),
                              child: Text(element[2], style: styleRowTable)))
                          ),
                        
                      ],
                    ))
                                  .toList()
                                )),
                ),
              ],
            ),
      ),
    );
  }
}
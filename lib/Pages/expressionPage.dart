import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/expressionConst.dart';
import 'package:vocab/Components/constant.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'home4.dart';
class ExpressionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black38,
                      ),
                      onPressed: Navigator.of(context).pop)),
            ],
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
  BoxShadow()
],
                                // borderRadius: BorderRadius.circular(10) ,
                                border:
                                    Border.all(width: 1.5, color: kcolorblacktext),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              alignment: Alignment.center,
                              child: tab.DataTable(
                                  columns: kTableexpressions,
                                  headingRowHeight: 0,
                                  rows: [
                                    tab.DataRow(
                                      cells: <tab.DataCell>[
                                        tab.DataCell(
                                          MaterialButton(
                                            padding: EdgeInsets.all(0),

                                      onPressed: () => speakingPortugais("${litems[index][0]}"),
                                                                                      child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Text(
                                                litems[index][0],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    tab.DataRow(
                                      cells: <tab.DataCell>[
                                        tab.DataCell(
                                          MaterialButton(
                                            padding: EdgeInsets.all(0),

                                      onPressed: () => speakingFrench("${litems[index][1]}"),
                                                                                      child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                Text('Literal:',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.orange,
                                                      fontWeight: FontWeight.w500
                                                    )),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    litems[index][1],
                                                    style: styletempsverb, 
                                                    // textAlign: TextAlign.right,
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    tab.DataRow(
                                      cells: <tab.DataCell>[
                                        tab.DataCell(
                                          MaterialButton(
                                            padding: EdgeInsets.all(0),

                                      onPressed: () => speakingFrench("${litems[index][2]}"),
                                                                                      child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Row(children: [
                                                Icon(
                                                  Icons.arrow_right,
                                                  color: Colors.orange,
                                                ),
                                                Expanded(
                                                    child: Text(litems[index][2],
                                                        style: styletempsverb,
                                                        textAlign:
                                                            TextAlign.left)),
                                              ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                      ]),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

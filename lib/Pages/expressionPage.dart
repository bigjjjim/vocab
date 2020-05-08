import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/expressionConst.dart';
import 'package:vocab/Components/constant.dart';

class ExpressionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: 


              ListView.builder(
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
                                      border:
                                          Border.all(width: 1, color: Colors.orange),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    alignment: Alignment.center,
                                    child: tab.DataTable(
                                        columns: kTableexpressions,
                                        headingRowHeight: 0,
                                        rows: [
                                          // const <tab.DataRow>[
                                          tab.DataRow(
                                            cells: <tab.DataCell>[
                                              tab.DataCell(
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Text(
                                                    litems[index][0],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          tab.DataRow(
                                            cells: <tab.DataCell>[
                                              tab.DataCell(
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Row(children: <Widget>[
                                                    Text('Literal:',
                                                        style: TextStyle(
                                                          color: Colors.orange,
                                                        )),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                                                                          child: Text(
                                                        litems[index][1],
                                                        textAlign: TextAlign.right,
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              )
                                            ],
                                          ),
                                          tab.DataRow(
                                            cells: <tab.DataCell>[
                                              tab.DataCell(
                                                Container(
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
                                                        child: Text(
                                                            litems[index][2],
                                                            textAlign:
                                                                TextAlign.left)),
                                                  ]),
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
                  
                
                              
    );
  }
}


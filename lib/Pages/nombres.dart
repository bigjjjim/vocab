import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart'  as tab;
import 'package:vocab/Components/nombreConst.dart';


class NombresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                            width: MediaQuery.of(context).size.width * 1,
                            alignment: Alignment.center,
                            child: tab.DataTable(
                              columns: kTableNombres,
                              rows: listNombres(
                                  MediaQuery.of(context).size.width * 0.1),
                            )),
            ],
          ),
    );
  }
}
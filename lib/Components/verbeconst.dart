import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'tabledata.dart' as tab;
import 'package:vocab/Pages/home4.dart';

const kTableVerbs = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('Francais'),
  ),
  tab.DataColumn(
    label: const Text('Portugais'),
  ),
];



List<List<String>> detail1 = [
  ['je', 'tu', 'il', 'nous', 'vous', 'ils'],
  ['suis', 'es', 'est', 'sommes', 'etes', 'sont'],
  ['sou', 'es', 'e', 'samos', 'sao', 'sao']
];

tableDetailVerbsFr(name) {
  return [
   
    tab.DataColumn(
      label: Expanded(
              child: MaterialButton(
                onPressed: ()=> speakingFrench(name),
                              child: Text(
          '$name',
          style: styleheadertable,
        ),
              ),
      ),
    ),
     tab.DataColumn(
      label: const Text(''),
    ),
   
  ];
}

tableDetailVerbsPt(name) {
  return [
   
    tab.DataColumn(
      label: Expanded(
              child: MaterialButton(
                onPressed: ()=> speakingPortugais(name),
                              child: Text(
          '$name',
          style: styleheadertable,
        ),
              ),
      ),
    ),
     tab.DataColumn(
      label: const Text(''),
    ),
   
  ];
}



Widget tableconjugImperaPor(size, size2, size3, data, column) {
  return Container(
    margin: EdgeInsets.all(16),
    width: size,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child: tab.DataTable(
      headingRowHeight: 0,
      columns: tableDetailVerbsPt(column),
      rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell( MaterialButton(
                onPressed:() => speakingPortugais('Tu') ,
                child: Container(width: size2, child: Text('Tu', style: styleRowTable))),),
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(data[0]) ,
                child:
              Container(width: size3, child: Text(data[0], style: styleRowTable)),),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
                onPressed:() => speakingPortugais('Ele/ ela') ,
                child:Container(width: size2, child: Text('Ele, ela', style: styleRowTable))),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(data[1]) ,
                child:
              Container(width: size3, child: Text(data[1], style: styleRowTable)),),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
                onPressed:() => speakingPortugais('Nós') ,
                child:Container(width: size2, child: Text('Nós', style: styleRowTable))),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(data[2]) ,
                child:
              Container(width: size3, child: Text(data[2], style: styleRowTable)),),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
                onPressed:() => speakingPortugais('Eles/elas') ,
                child:Container(width: size2, child: Text('Eles, elas', style: styleRowTable))),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(data[3]) ,
                child:
              Container(width: size3, child: Text(data[3], style: styleRowTable)),),
            ),
          ],
        ),
      ],
    ),
  );
}





Widget tableconjugImpera(size, size2, size3, data, column) {
  return Container(
    margin: EdgeInsets.all(16),
    width: size,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child: tab.DataTable(
      headingRowHeight: 0,
      columns: tableDetailVerbsFr(column),
      rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench('Tu') ,
                child: Container(width: size2, child: Text('Tu', style: styleRowTable))),),
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(data[0]) ,
                child: 
              Container(width: size3, child: Text(data[0], style: styleRowTable)),)
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench('Nous') ,
                child: Container(width: size2, child: Text('Nous', style: styleRowTable))),),
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(data[1]) ,
                child: 
              Container(width: size3, child: Text(data[1], style: styleRowTable)),)
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell( MaterialButton(
                onPressed:() => speakingFrench("Vous") ,
                child: Container(width: size2, child: Text('Vous', style: styleRowTable))),),
            tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(data[2]) ,
                child: 
              Container(width: size3, child: Text(data[2], style: styleRowTable)),),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget tableconjug(size, size2, size3, data, column) {
  return Container(
      margin: EdgeInsets.all(16),
      width: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
      ),
      alignment: Alignment.center,
      child: tab.DataTable(columns: tableDetailVerbsFr(column), rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Je'),
              child: 
              Container(width: size2, child: 
              Text('Je', style: styleRowTable))),),
            tab.DataCell(
              MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(data[0]) ,
                child: 
                Container(
                  width: size3, child:
                 Text(data[0], style: styleRowTable)))
                 ,
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Tu'),
              child: Container(
                  width: size2, child:Text('Tu', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () => speakingFrench(data[1]),
              child: Container(
                  width: size3, child:Text(data[1], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Il/Elle'),
              child:Container(
                  width: size2, child:Text('Il, elle', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () => speakingFrench(data[2]),
              child:Container(
                  width: size3, child:Text(data[2], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Nous'),
              child:Container(
                  width: size2, child:Text('Nous', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () => speakingFrench(data[3]),
              child:Container(
                  width: size3, child:Text(data[3], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Vous'),
              child:Container(
                  width: size2, child:Text('Vous', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () => speakingFrench(data[4]),
              child:Container(
                  width: size3, child:Text(data[4], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingFrench('Ils/Elles'),
              child:Container(
                  width: size2, child:Text('Ils, elles', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () => speakingFrench(data[5]),
              child:Container(
                  width: size3, child:Text(data[5], style: styleRowTable)),)),
          ],
        ),
      ]));
}


Widget tableconjugPor(size, size2, size3, data, column) {
  return Container(
      margin: EdgeInsets.all(16),
      width: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
      ),
      alignment: Alignment.center,
      child: tab.DataTable(columns: tableDetailVerbsPt(column), rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Eu'),
              child:Container(
                width: size2,
               child: Text('Eu', style: styleRowTable))),),
            tab.DataCell(
              MaterialButton(
                              padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[0]),
              child:Container(
                width: size3, 
                child: Text(data[0], textAlign: TextAlign.left, style: styleRowTable))),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Tu'),
              child:Container(
                width: size2, 
                child:Text('Tu', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
                            padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[1]),
              child:Container(
                width: size3, 
                child:Text(data[1], style: styleRowTable)),),)
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Ele/ela'),
              child:Container(
                width: size2, 
                child:Text('Ele, ela', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
                            padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[2]),
              child:Container(
                width: size3, 
                child:Text(data[2], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Nós'),
              child:Container(
                width: size2, 
                child:Text('Nós', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
                            padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[3]),
              child:Container(
                width: size3, 
                child:Text(data[3], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Vós'),
              child:Container(
                width: size2, 
                child:Text('Vós', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
                            padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[4]),
              child:Container(
                width: size3, 
                child:Text(data[4], style: styleRowTable)),),),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(MaterialButton(
              onPressed: () => speakingPortugais('Eles/ elas'),
              child:Container(
                width: size2, 
                child:Text('Eles, elas', style: styleRowTable)),),),
            tab.DataCell(MaterialButton(
                            padding: EdgeInsets.all(0),

              onPressed: () => speakingPortugais(data[5]),
              child:Container(
                width: size3, 
                child:Text(data[5], style: styleRowTable)),),),
          ],
        ),
      ]));
}

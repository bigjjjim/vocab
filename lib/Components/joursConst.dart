import 'package:flutter/material.dart';
import 'tabledata.dart' as tab;
import 'constant.dart';
import 'package:vocab/Pages/home4.dart';

 var kTableJours = <tab.DataColumn>[
       tab.DataColumn(
    label:  MaterialButton(
      padding: EdgeInsets.all(0),
       onPressed: () => speakingFrench("Les Jours"),
      child: Text('Les jours', style: styleheadertable,)),
  ),
   tab.DataColumn(
    label: MaterialButton(
      padding: EdgeInsets.all(0),
       onPressed: () => speakingPortugais("Os dias"),
      child: Text('Os dias', style: styleheadertable)),
  ),
  
  ];



var listJoursFlat = [["Lundi", "A segunda-feira"],["Mardi", "A terça-feira"],["Mercredi", "A quarta-feira"],["Jeudi", "A quinta-feira"],
["Vendredi", "A sexta-feira"],["Samedi", "O sábado"],["Dimanche", "O domingo"]];




//   listJours(size) {

// return
//    [ 
//       tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Container(width: size,child: Text('Lundi', style: styleRowTable,))),
//           tab.DataCell( Container(width: size,child: Text('A segunda-feira',style: styleRowTable ), ),),
//         ],),
// tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Mardi',style: styleRowTable),),
//           tab.DataCell( Text('A terça-feira' ,style: styleRowTable), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Mercredi',style: styleRowTable),),
//           tab.DataCell( Text('A quarta-feira',style: styleRowTable ), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Jeudi',style: styleRowTable),),
//           tab.DataCell( Text('A quinta-feira',style: styleRowTable ), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Vendredi',style: styleRowTable),),
//           tab.DataCell( Text('A sexta-feira',style: styleRowTable ), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Samedi',style: styleRowTable),),
//           tab.DataCell( Text('O sábado',style: styleRowTable ), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Dimanche',style: styleRowTable),),
//           tab.DataCell( Text('O domingo',style: styleRowTable ), ),
//         ],),


//    ];
//   }

var kTableMois = <tab.DataColumn>[
       tab.DataColumn(
    label:  MaterialButton(
      padding: EdgeInsets.all(0),
       onPressed: () => speakingFrench("Les mois"),
      child: Text('Les mois', style: styleheadertable)),
  ),
   tab.DataColumn(
    label:  MaterialButton(
      padding: EdgeInsets.all(0),
       onPressed: () => speakingPortugais("Os meses"),
      child: Text('Os meses', style: styleheadertable)),
  ),
  
  ];



  List listMoisFlat = [["Janvier", "Janeiro"],["Février", "Fevereiro"],["Mars", "Março"],["Avril", "Abril"],
  ["Mais", "Maio"],["Juin", "Junho"],["Juillet", "Julho"],["Août", "Agosto"],["Septembre", "Setembro"],["Octobre", "Outubro"],["Novembre", "Novembro"],
  ["Décembre", "Dezembro"]];

//   listMois(size) {

// return
//    [ 
//       tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Container(width: size,child: Text('Janvier',style: styleRowTable))),
//           tab.DataCell( Container(width: size,child: Text('Janeiro',style: styleRowTable ), ),),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Février',style: styleRowTable)),
//           tab.DataCell(  Text('Fevereiro',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Mars',style: styleRowTable)),
//           tab.DataCell(  Text('Março',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Avril',style: styleRowTable)),
//           tab.DataCell(  Text('Abril',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Mais',style: styleRowTable)),
//           tab.DataCell(  Text('Maio',style: styleRowTable), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Juin',style: styleRowTable)),
//           tab.DataCell(  Text('Junho',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Août',style: styleRowTable)),
//           tab.DataCell(  Text('Agosto',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Septembre',style: styleRowTable)),
//           tab.DataCell(  Text('Setembro',style: styleRowTable ), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Octobre',style: styleRowTable)),
//           tab.DataCell(  Text('Outubro',style: styleRowTable), ),
//         ],),
//          tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Novembre',style: styleRowTable)),
//           tab.DataCell(  Text('Novembro',style: styleRowTable ), ),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Text('Decembre',style: styleRowTable)),
//           tab.DataCell(  Text('Dezembro',style: styleRowTable ), ),
//         ],),
        
//    ];
//   }
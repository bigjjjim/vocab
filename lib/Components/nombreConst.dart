import 'package:flutter/material.dart';
// import 'package:vocab/Components/constant.dart';
import 'tabledata.dart' as tab;
import 'constant.dart';
import 'package:vocab/Pages/home4.dart';



var kTableNombres = <tab.DataColumn>[
       tab.DataColumn(
    label:  Text('#', style: styleheadertable),
  ),
   tab.DataColumn(
    label: MaterialButton(
      padding: EdgeInsets.all(0),
       onPressed: () => speakingFrench("Nombres"),
      child: Text('Nombres',style: styleheadertable)),
  ),
   tab.DataColumn(
    label: MaterialButton(
       onPressed: () => speakingPortugais("Números"),
      child: Text('Números', style: styleheadertable, )),
  ),
  ];

List listNombresFlat = [['1','Un', 'Um'],['2', 'Deux', 'Dois'],['3', 'Trois', 'Três'],
['4', 'Quatre', 'Quatro'],['5', 'Cinq', 'Cinco'],['6', 'Six', "Seis"],
['7', 'Sept', 'Sete'],['8', 'Huit', 'Oito'],['9', 'Neuf', 'Nove'],
['10', 'Dix', 'Dez'],['11', 'Onze', 'Onze'],['12', 'Douze', 'Doze'],
['13', 'Treize', 'Treze'],['14', 'Quatorze', 'Catorze'],['15', 'Quinze', 'Quinze'],
['16', 'Seize', 'Dezasseis'],['17', 'Dix-sept', 'Dezassete'],['18', 'Dix-huit', 'Dezoito'],
['19', 'Dix-neuf', 'Dezanove'],['20', 'Vingt', 'Vinte'],['21', 'Vingt-et-un', 'Vinte-e-um'],
['22', 'Vingt-deux', 'Vinte-e-dois'],['30', 'Trente', 'Trinta'],['40', 'Quarante', 'Quarenta'],
['50', 'Cinquante', 'Cinquenta'], ['60', 'Soixante', 'Sessenta'],['70', 'Soixante-dix', 'Setenta'],
['80', 'Quatre-vingt', 'Oitenta'], ['90', 'Quatre-vingt-dix', 'Noventa'],['100', 'Cent', 'Cem'],
['1000', 'Milles', 'Mil'], ['1000000', 'Un million', 'Um milhão'],['1000000000', 'Un milliard', 'Um bilhão'],

]; 
   
// listNombres(size) {

// return
//    [ 
//       tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell( Container(width: size,child: Row(
//             children: <Widget>[
//               Text('1',style: styleRowTable),
//             ],
//           ))),
//           tab.DataCell( Container(width: size,child: Text('Un',style: styleRowTable ), ),),
//           tab.DataCell( Container(width: size,child: Text('Um', style: styleRowTable))),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('2', style: styleRowTable)),
//           tab.DataCell(Text('Deux',style: styleRowTable)),
//           tab.DataCell(Text('Dois',style: styleRowTable )),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('3',style: styleRowTable)),
//           tab.DataCell(Text('Trois',style: styleRowTable)),
//           tab.DataCell(Text('Três',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('4',style: styleRowTable)),
//           tab.DataCell(Text('Quatre',style: styleRowTable)),
//           tab.DataCell(Text('Quatro',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('5',style: styleRowTable)),
//           tab.DataCell(Text('Cinq',style: styleRowTable)),
//           tab.DataCell(Text('Cinco',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('6',style: styleRowTable)),
//           tab.DataCell(Text('Six',style: styleRowTable)),
//           tab.DataCell(Text('Seis',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('7',style: styleRowTable)),
//           tab.DataCell(Text('Sept',style: styleRowTable)),
//           tab.DataCell(Text('Sete',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('8',style: styleRowTable)),
//           tab.DataCell(Text('Huit',style: styleRowTable)),
//           tab.DataCell(Text('Oito',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('9',style: styleRowTable)),
//           tab.DataCell(Text('Neuf',style: styleRowTable)),
//           tab.DataCell(Text('Nove',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('10',style: styleRowTable)),
//           tab.DataCell(Text('Dix',style: styleRowTable)),
//           tab.DataCell(Text('Dez',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('11',style: styleRowTable)),
//           tab.DataCell(Text('Onze',style: styleRowTable)),
//           tab.DataCell(Text('Onze',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('12',style: styleRowTable)),
//           tab.DataCell(Text('Douze',style: styleRowTable)),
//           tab.DataCell(Text('Doze',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('13',style: styleRowTable)),
//           tab.DataCell(Text('Treize',style: styleRowTable)),
//           tab.DataCell(Text('Treze',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('14',style: styleRowTable)),
//           tab.DataCell(Text('Quatorze',style: styleRowTable)),
//           tab.DataCell(Text('Catorze',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('15',style: styleRowTable)),
//           tab.DataCell(Text('Quinze',style: styleRowTable)),
//           tab.DataCell(Text('Quinze',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('16',style: styleRowTable)),
//           tab.DataCell(Text('Seize',style: styleRowTable)),
//           tab.DataCell(Text('Dezasseis',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('17',style: styleRowTable)),
//           tab.DataCell(Text('Dix-sept',style: styleRowTable)),
//           tab.DataCell(Text('Dezassete',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('18',style: styleRowTable)),
//           tab.DataCell(Text('Dix-huit',style: styleRowTable)),
//           tab.DataCell(Text('Dezoito',style: styleRowTable)),
//         ],),
       
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('19',style: styleRowTable)),
//           tab.DataCell(Text('Dix-Neuf',style: styleRowTable)),
//           tab.DataCell(Text('Dezanove',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('20',style: styleRowTable)),
//           tab.DataCell(Text('Vingt',style: styleRowTable)),
//           tab.DataCell(Text('Vinte',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('21',style: styleRowTable)),
//           tab.DataCell(Text('Vingt-et-un',style: styleRowTable)),
//           tab.DataCell(Text('Vinte-e-um',style: styleRowTable)),
          
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('21',style: styleRowTable)),
//           tab.DataCell(Text('Vingt-deux',style: styleRowTable)),
//           tab.DataCell(Text('Vinte-e-dois',style: styleRowTable)),
          
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('30',style: styleRowTable)),
//           tab.DataCell(Text('Trente',style: styleRowTable)),
//           tab.DataCell(Text('Trinta',style: styleRowTable)),
          
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('40',style: styleRowTable)),
//           tab.DataCell(Text('Quarante',style: styleRowTable)),
//           tab.DataCell(Text('Quarenta',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('50',style: styleRowTable)),
//           tab.DataCell(Text('Cinquante',style: styleRowTable)),
//           tab.DataCell(Text('Cinquenta',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('60',style: styleRowTable)),
//           tab.DataCell(Text('Soixante',style: styleRowTable)),
//           tab.DataCell(Text('Sessenta',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('70',style: styleRowTable)),
//           tab.DataCell(Text('Soixante-dix',style: styleRowTable)),
//           tab.DataCell(Text('Setenta',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('80',style: styleRowTable)),
//           tab.DataCell(Text('Quatre-vingt',style: styleRowTable)),
//           tab.DataCell(Text('Oitenta',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('90',style: styleRowTable)),
//           tab.DataCell(Text('Quatre-vingt-dix',style: styleRowTable)),
//           tab.DataCell(Text('Noventa',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('100',style: styleRowTable)),
//           tab.DataCell(Text('Cent',style: styleRowTable)),
//           tab.DataCell(Text('Cem',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('1000',style: styleRowTable)),
//           tab.DataCell(Text('Milles',style: styleRowTable)),
//           tab.DataCell(Text('Mil',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('1000 000',style: styleRowTable)),
//           tab.DataCell(Text('Un million',style: styleRowTable)),
//           tab.DataCell(Text('Um milhão',style: styleRowTable)),
//         ],),
//         tab.DataRow(
//         cells: <tab.DataCell>[
//           tab.DataCell(Text('1000 000 000',style: styleRowTable)),
//           tab.DataCell(Text('Un milliard',style: styleRowTable)),
//           tab.DataCell(Text('Um bilhão',style: styleRowTable)),
//         ],),
        


//    ];
// }
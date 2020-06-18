import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'tabledata.dart' as tab;
import 'package:vocab/Pages/home4.dart';
 
  var kTablePronColumns = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonF('Pronoms')
    //  Text('Pronoms', style: styleheadertable),
  ),
  tab.DataColumn(
    label:  speakButtonP('Pronomes')
    // Text('Pronomes', style: styleheadertable),
  ),
];
 
 speakButtonF(String mot) {
return MaterialButton(onPressed:()=> speakingFrench(mot),
child: Text(mot, style: styleRowTable),);
 }
 speakButtonP(String mot) {
return MaterialButton(onPressed:()=> speakingPortugais(mot),
child: Text(mot, style: styleRowTable),);
 }

listpronoms() {

return
   [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Je')),
          tab.DataCell(speakButtonP('Eu')),          
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Tu')),
          tab.DataCell(speakButtonP('Tu')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Il, elle')),
          tab.DataCell(speakButtonP('Ele, ela')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Nous')),
          tab.DataCell(speakButtonP('Nós')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Vous')),
          tab.DataCell(speakButtonP('Vós')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Ils, elles')),
          tab.DataCell(speakButtonP('Eles, elas')),
        ],
              ),];
}

  var kTablePossColumns = <tab.DataColumn>[
  tab.DataColumn(
    label:  speakButtonF('''Pronoms
Possessifs
Singulier'''),
  ),
  tab.DataColumn(
    label:  speakButtonP('''Pronomes
Possessivos
Singular'''),
  ),
];



listRowPos() {
return
[ 
      tab.DataRow(
        cells: <tab.DataCell>[ 
          tab.DataCell(speakButtonF('Mon, ma')),
          tab.DataCell(speakButtonP('Meu, minha')),
        ],),
        
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Ton, ta')),
          tab.DataCell(speakButtonP('Teu, tua')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Son, sa')),
          tab.DataCell(speakButtonP('Seu, sua')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Notre')),
          tab.DataCell(speakButtonP('Nosso')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Votre')),
          tab.DataCell(speakButtonP('Vosso')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(speakButtonF('Leur')),
          tab.DataCell(speakButtonP('Seu, sua')),
        ],),
        
        
        ];

}




        var kTablePossColumnsPlu = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonF('''Pronoms
Possessifs
Pluriel'''),
  ),
  tab.DataColumn(
    label: speakButtonP('''Pronomes
Possessivos
Plural'''),
  ),
];


listRowPossplus() {
return [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Mes')),
          tab.DataCell(speakButtonP('Meus, minhas')),
        ],),
        
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Tes')),
          tab.DataCell(speakButtonP('Teus, tuas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Ses')),
          tab.DataCell(speakButtonP('Seus, suas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Nos')),
          tab.DataCell(speakButtonP('Nossos, nossas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Vos')),
          tab.DataCell(speakButtonP('Vossos, vossas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Leurs')),
          tab.DataCell(speakButtonP('Seus, suas')),
        ],),
        
        
        ];

}
 

 var kTableArtInDef = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonF('''Articles
Indéfinis'''),
  ),
  tab.DataColumn(
    label: speakButtonP('''Artigos
Indefinidos''', ),
  ),
];

listRowartInd() {
return [ tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(speakButtonF('Un, une')),
          tab.DataCell(speakButtonP('Um, uma')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(speakButtonF('Des')),
          tab.DataCell(speakButtonP('Uns, umas')),
        ],) ];
        }

 

      var kTableArtDef = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonF('''Articles
Définis'''),
  ),
  tab.DataColumn(
    label: speakButtonP('''Artigos
Definidos'''),
  ),
];


listRowartdef() {
return [
  tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('Le, la')),
          tab.DataCell(speakButtonP('O, a')),
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(speakButtonF('Les')),
          tab.DataCell(speakButtonP('Os, as')),
        ],)

];
}



      var kTablecontraction1 = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonP('''De'''),
  ),
  tab.DataColumn(
    label: speakButtonP('''Em'''),
  ),
];

listrowcontrac1(size) {
return [
 tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size,child: speakButtonP('De um = dum')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Em um = num')),)
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('De uns = duns')),
          tab.DataCell(speakButtonP('Em uns = nuns')),
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(speakButtonF('De uma = duma')),
          tab.DataCell(speakButtonP('Em uma = numa')),
        
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(speakButtonF('De umas = dumas')),
          tab.DataCell(speakButtonP('Em umas = numas')),
        ],),

];

}
 var kTablecontraction3 = <tab.DataColumn>[
       tab.DataColumn(
    label: speakButtonP('''A'''),
  ),
   tab.DataColumn(
    label: speakButtonP('''Por'''),
  ),];

         var kTablecontraction2 = <tab.DataColumn>[
  tab.DataColumn(
    label: speakButtonP('''De'''),
  ),
  tab.DataColumn(
    label: speakButtonP('''Em'''),
  ),
  
];

listrowcontract3(size) {
  return [
tab.DataRow(
        cells: <tab.DataCell>[
        tab.DataCell(Container(width: size,child: speakButtonP('A o = ao')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Por o = pelo')),)
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
 tab.DataCell(Container(width: size,child: speakButtonF('A a = à')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Por a = pela')),)
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
           tab.DataCell(Container(width: size,child: speakButtonF('A os = aos')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Por os = pelos')),)

        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
 tab.DataCell(Container(width: size,child: speakButtonF('A as = às')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Por as = pelas')),)
        ],),
  ];
}

listrowcontract2(size) {
  return [
  tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size,child: speakButtonP('De o = do')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Em o = no')),)
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size,child: speakButtonF('De a = da')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Em a = na')),)
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size,child: speakButtonF('De os = dos')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Em os = nos')),)
        
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size,child: speakButtonF('De as = das')),),
          tab.DataCell(Container(width: size,child: speakButtonP('Em as = nas')),)
        
        ],),

  ];
}

     
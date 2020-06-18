import 'package:flutter/material.dart';
import 'package:vocab/Components/verbeconst.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'dart:convert';
import 'package:vocab/Components/constant.dart';
import 'dart:math' as math;
import 'home4.dart';


class Verbdetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final List<String> verb = ModalRoute.of(context).settings.arguments;
print(verb[0]);
    return Scaffold(
      
      backgroundColor: kcolorbackground,
      body: 
      Theme(
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
                    ],),
            Expanded(
                          child: Container(
              child: Center(
                child: FutureBuilder(
                    future:
                        DefaultAssetBundle.of(context).loadString('assets/data.json'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var new_data = json.decode(snapshot.data);
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    title:
                                        Text("Francais", style: stylegrammaireheader),
                                    children: <Widget>[
                                      ExpansionTile(
                                        title: Text("   Nominal", style: stylemodeverb),
                                        children: <Widget>[
                                          Container(
    margin: EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width * 0.8,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child:
                                          tab.DataTable(
                                              headingRowHeight: 0,
                                              columns: tableDetailVerbsFr(""),
                                              rows: [
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench("Infinitif") ,
                child: Container(child: Text('Infinitif', style: styleRowTable, ),
                 width:  MediaQuery.of(context).size.width*0.3,
                 )),),
                                                    tab.DataCell( MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(new_data['${verb[0]}']
                                                            ['francais']['nominal'][0]) ,
                child: 
                                                      Container(
                                                        child: Text(new_data['${verb[0]}']
                                                            ['francais']['nominal'][0],style: styleRowTable), 
                                                            width: MediaQuery.of(context).size.width*0.25
                                                      ),),
                                                    ),
                                                  ],
                                                ),
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench('Participe présent') ,
                child: 
                                                      Container(width: MediaQuery.of(context).size.width*0.3,
                                                      child:
                                                        Text('Participe présent',style: styleRowTable )),),),
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(new_data['${verb[0]}']
                                                          ['francais']['nominal'][1]) ,
                child: 
                                                      Container(width: MediaQuery.of(context).size.width*0.25,
                                                      child:
                                                      Text(new_data['${verb[0]}']
                                                          ['francais']['nominal'][1], style: styleRowTable),),),
                                                    ),
                                                  ],
                                                ),
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench('Participe passé') ,
                child: 
                                                      Container(width: MediaQuery.of(context).size.width*0.3,
                                                      child:
                                                        Text('Participe passé',style: styleRowTable)),),),
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingFrench(new_data['${verb[0]}']
                                                          ['francais']['nominal'][2]) ,
                child: 
                                                      Container(width: MediaQuery.of(context).size.width*0.25,
                                                      child:
                                                      Text(new_data['${verb[0]}']
                                                          ['francais']['nominal'][2], style: styleRowTable),
                                                    ),),),
                                                  ],
                                                ),
                                              ]),)



                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text("   Indicatif", style: stylemodeverb),
                                        children: <Widget>[
                                          ExpansionTile(title: Text('       Présent', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjug(
                                             MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['francais']
                                                  ['indicatif'][0],
                                              'Présent'),
                                          ],
                                          ),
                                          ExpansionTile(title: Text('       Passé composé', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                          MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [1],
                                          'Passé composé'),

                                          ],
                                          ),

                                          ExpansionTile(title: Text('       Imparfait', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [2],
                                          'Imparfait')
                                          ],
                                          ),

                                     ExpansionTile(title: Text('       Plus-que-parfait', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [3],
                                          'Plus - que - parfait')]),

                                           ExpansionTile(title: Text('       Future simple', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                        MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [4],
                                          'Future simple')]),

                                           ExpansionTile(title: Text('       Future antérieur', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [5],
                                          'Future antérieur')]),

                                          ExpansionTile(title: Text('       Passé simple', style: styletempsverb),
                                          children: <Widget>[
                                            Text("Très peu utilisé", style: TextStyle(color: Colors.red),),

                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [6],
                                          'Passé simple')]),

                                          ExpansionTile(title: Text('       Passé antérieur', style: styletempsverb),
                                          children: <Widget>[
                                            Text("Pas utilisé", style: TextStyle(color: Colors.red),),

                                             tableconjug(
                                        MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['indicatif']
                                              [5],
                                          'Passé antérieur')]),

                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text("   Subjonctif", style: stylemodeverb),
                                        children: <Widget>[
                                           ExpansionTile(title: Text('       Présent', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['subjonctif']
                                              [0],
                                          'Présent')]),

                                        
                                           ExpansionTile(title: Text('       Passé composé', style: styletempsverb,),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['subjonctif']
                                              [1],
                                          'Passé composé')]),

                                          ExpansionTile(title: Text('       Imparfait', style: styletempsverb),
                                          children: <Widget>[
                                            Text("Pas utilisé", style: TextStyle(color: Colors.red),),
                                             tableconjug(
                                        MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['subjonctif']
                                              [2],
                                          'Imparfait')]),

                                           ExpansionTile(title: Text('       Plus-que-parfait', style: styletempsverb),
                                          children: <Widget>[
                                            Text("Pas utilisé", style: TextStyle(color: Colors.red),),
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['subjonctif']
                                              [3],
                                          'Plus - que - parfait')]),],

                                     
                                      ),
                                      ExpansionTile(
                                        title: Text("   Conditionnel", style: stylemodeverb),
                                        children: <Widget>[
                                           ExpansionTile(title: Text('       Présent', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['conditionnel']
                                              [0],
                                          'Présent')]),

                                          ExpansionTile(title: Text('       Passé', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjug(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['francais']['conditionnel']
                                              [1],
                                          'Passé')]),
                                          
                                          
                                          ],),
                                          ExpansionTile(
                                        title: Text("   Imperatif", style: stylemodeverb),
                                        
                                          children: <Widget>[
                                           tableconjugImpera(
                                            MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.4,
                                          new_data['${verb[0]}']['francais']['imperatif']
                                              ,
                                          '')]

                                           ), 
                                         
                                        ]),



                                  ExpansionTile(
                                    title:
                                        Text("Português", style: stylegrammaireheader),
                                    children: <Widget>[
                                      ExpansionTile(title: Text("   Nominal",style: stylemodeverb),
                                      children: <Widget>[
                                         Container(
    margin: EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width * 0.8,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child:
                                          tab.DataTable(
                                              headingRowHeight: 0,
                                              columns: tableDetailVerbsFr(""),
                                              rows: [
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais('Infinitivo') ,
                child: Container(width: MediaQuery.of(context).size.width * 0.3, 
                child: Text('Infinitivo', style: styleRowTable)),),),
                                                    tab.DataCell(
                                                      MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][0]) ,
                child: Container(width: MediaQuery.of(context).size.width * 0.25, child:
                                                      Text(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][0], style: styleRowTable),),
                                                    ),),
                                                  ],
                                                ),
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais('Participio') ,
                child: Container(width: MediaQuery.of(context).size.width * 0.3, child:
                                                        Text('Participio', style: styleRowTable)),),),
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][1]) ,
                child: Container(width: MediaQuery.of(context).size.width * 0.25, child:
                                                      Text(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][1], style: styleRowTable),),),
                                                    ),
                                                  ],
                                                ),
                                                tab.DataRow(
                                                  cells: <tab.DataCell>[
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais('Gerundio') ,
                child: Container(width: MediaQuery.of(context).size.width * 0.3, child:
                                                        Text('Gerundio', style: styleRowTable)),),),
                                                    tab.DataCell(MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed:() => speakingPortugais(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][2]) ,
                child: Container(width: MediaQuery.of(context).size.width * 0.25, child:
                                                      Text(new_data['${verb[0]}']
                                                          ['portugais']['nominal'][2], style: styleRowTable),
                                                    ),),),
                                                  ],
                                                ),
                                              ]),)

                                      ],),



                                    ExpansionTile(
                                        title: Text("   Indicative", style: stylemodeverb),
                                        children: <Widget>[
                                          ExpansionTile(title: Text('       Present', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                             MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['indicative'][0],
                                              'Present'),
                                          ],
                                          ),
                                          ExpansionTile(title: Text('       Perfeito', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjugPor(
                                          MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [1],
                                          'Perfeito'),

                                          ],
                                          ),

                                          ExpansionTile(title: Text('       Imperfeito', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjugPor(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [2],
                                          'Imper -feito')
                                          ],
                                          ),

                                     ExpansionTile(title: Text('       Mais-que-perfeito', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjugPor(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              // 30.0,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [3],
                                          'Mais - que - perfeito')]),

                                           ExpansionTile(title: Text('       Futuro', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjugPor(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [4],
                                          'Futuro')]),

                                           ExpansionTile(title: Text('       Futuro anterior', style: styletempsverb),
                                          children: <Widget>[
                                             tableconjugPor(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [5],
                                          'Futuro anterior')]),

                                          ExpansionTile(title: Text('       Pretérito', style: styletempsverb),
                                          children: <Widget>[

                                             tableconjugPor(
                                         MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['indicative']
                                              [6],
                                          'Pretérito')]),

                                         

                                        ],
                                      ),


                                          ExpansionTile(
                                        title: Text("   Subjuntivo", style: stylemodeverb),
                                        children: <Widget>[
                                          ExpansionTile(title: Text('       Present', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][0],
                                              'Present'),
                                          ],
                                          ),

                                          ExpansionTile(title: Text('       Perfeito', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][1],
                                              'Perfeito'),
                                        ]),

                                         ExpansionTile(title: Text('       Imperfeito', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][2],
                                              'Imper -feito'),
                                        ]),

                                         ExpansionTile(title: Text('       Mais-que-perfeito', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][3],
                                              'Mais - que - perfeito'),
                                        ]),
                                        ExpansionTile(title: Text('       Futuro', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][4],
                                              'Futuro'),
                                        ]),
                                        ExpansionTile(title: Text('       Futuro anterior', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['subjuntivo'][5],
                                              'Futuro anterior'),
                                        ]),

                                      ]),

  ExpansionTile(
                                        title: Text("   Condicional", style: stylemodeverb),
                                        children: <Widget>[
                                          ExpansionTile(title: Text('       Condicional', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['conditional'][0],
                                              'Cond.'),
                                          ],
                                          ),
                                          ExpansionTile(title: Text('       Condicional perfeito', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['conditional'][1],
                                              'Cond. Perfeito'),
                                          ],
                                          ),

                                        ]),


 ExpansionTile(
                                        title: Text("   Imperativo", style: stylemodeverb),
                                        
                                          children: <Widget>[
                                           tableconjugImperaPor(
                                            MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                          new_data['${verb[0]}']['portugais']['imperativo']
                                              ,
                                          '')]

                                           ),

ExpansionTile(
                                        title: Text("   Infinitivo Pessoal", style: stylemodeverb),
                                        children: <Widget>[
                                          ExpansionTile(title: Text('       Presente', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['infinitivo pessoal'][0],
                                              'Presente'),
                                          ],
                                          ),
                                          ExpansionTile(title: Text('       Perfeito', style: styletempsverb),
                                          children: <Widget>[
                                            tableconjugPor(
                                              MediaQuery.of(context).size.width * 0.8,
                                              MediaQuery.of(context).size.width * 0.15,
                                              MediaQuery.of(context).size.width * 0.3,
                                              new_data['${verb[0]}']['portugais']
                                                  ['infinitivo pessoal'][1],
                                              'Perfeito'),
                                          ], 
                                          ),

                                        ]),


                                    ]),
                                ]),
                          ));
                        
                      } else {
                        return SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        );
                      }
                    }),
              ),
      ),
            ),
          ],
        ),
    ));
  }
}

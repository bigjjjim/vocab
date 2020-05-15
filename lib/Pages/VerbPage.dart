import 'package:flutter/material.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/verbeconst.dart';
import 'package:vocab/Components/constant.dart';
import 'VerbDetail.dart';

List<List<String>> listVerbs = [
 
  ["accepter",	"aceitar",],
["acheter",	"comprar",],
["aider",	"ajudar",],
["aimer",	"amar",],
["ajouter",	"adicionar",],
["aller",	"ir",],
["allumer",	"acender",],
["appeler",	"chamar",],
["apporter",	"trazer",],
["apprendre",	"aprender",],

["arrêter",	"deter",],
["arriver",	"acontecer",],
["attendre",	"esperar",],
["avoir",	"ter",],
["avoir besoin",	"precisar",],
["casser",	"partir",],
["changer",	"mudar",],
["chanter",	"cantar",],
["chercher",	"buscar",],
["choisir",	"escolher",],

["commencer",	"começar",],
["comprendre",	"compreender",],
["compter",	"contar",],
["conduire",	"conduzir",],
["connaître",	"conhecer",],
["continuer",	"continuar",],
["couper",	"cortar",],
["courir",	"correr",],
["croire",	"acreditar",],
["décider",	"decidir",],

["demander",	"pedir",],
["descendre",	"descer",],
["devenir",	"tornar-se",],
["devoir",	"dever",],
["dire",	"dizer",],
["donner",	"dar",],
["dormir",	"dormir",],
["écouter",	"escutar",],
["écrire",	"escrever",],
["empêcher",	"impedir",],

["entendre",	"ouvir",],
["entrer",	"entrar",],
["envoyer",	"enviar",],
["essayer",	"tentar",],
["éteindre",	"desligar",],
["être",	"ser",],
["exister",	"existir",],
["expliquer",	"explicar",],
["faire",	"fazer",],
["cuisiner",	"cozinhar",],

["fermer",	"fechar",],
["terminer",	"terminar",],
["gagner",	"ganhar",],
["garder",	"manter",],
["goûter",	"lanchar",],
["jeter",	"atirar",],
["jouer",	"jogar",],
["laisser",	"deixar",],
["nettoyer", "limpar",],
["lire",	"ler",],
["manger",	"comer",],

["marcher",	"andar",],
["mettre",	"pôr",],

["montrer",	"mostrar",],
["oublier",	"esquecer",],

["ouvrir",	"abrir",],
["parler",	"falar",],

["partir",	"partir",],

["payer",	"pagar",],
["penser",	"pensar",],

["perdre",	"perder",],

["permettre",	"permitir",],
["pleurer",	"chorar",],

["porter",	"incidir",],
["poser",	"colocar",],
["pouvoir",	"poder",],

["prendre",	"pegar",],
["préparer",	"preparar",],
["rappeler",	"lembrar",],
["recevoir",	"receber",],

["reconnaître",	"reconhecer",],
["refuser",	"recusar",],
["regarder", "ver",],
["voir", "ver"],
["rencontrer",	"conhecer",],
["rendre",	"tornar",],

["rentrer", 	"voltar", ],
["répéter",	"repetir",],
["répondre",	"responder",],
["ressembler",	"parecer",],

["rester",	"ficar",],
["trouver",	"encontrar",],
["trouver (penser)", "achar"],

["réussir",	"ter sucesso",],

["rire",	"rir",],

["s'asseoir",	"sentar-se",],
["s'endormir",	"adormecer",],

["savoir",	"saber",],

["se laver",	"lavar-se",],



["se reposer",	"descansar",],
["se réveiller",	"acordar",],
["se souvenir", "recordar",],

["sortir",	"sair",],
["suivre",	"seguir",],
["tenir",	"segurar",],

["tirer",	"puxar",],
["tomber",	"cair",],
["toucher",	"tocar",],
["tourner",	"girar",],

["travailler",	"trabalhar",],
["utiliser",	"usar",],
["vendre",	"vender",],
["venir",	"vir",],

["vivre",	"viver",],
["voler",	"roubar",],
["vouloir",	"querer",]
];




class VerbPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body:  Scrollbar(
              child: ListView.builder(
                    itemCount: listVerbs.length,
                    itemBuilder: (BuildContext context, int index) {
                        return   Container(
                          height: 55,
                          decoration: BoxDecoration(
                                        border:
                                            Border(bottom: BorderSide(width: 1,color: Colors.grey[300]),),
                                            color: index.isEven? krow1: krow2,
                                      ),
                          
                            child: Row(
                                  children: <Widget>[
                                    
                                    Expanded(
                                              child: ListTile(
                                                onTap: (){
          Navigator.of(context).pushNamed("VerbDetailPage", arguments: listVerbs[index]);
          },
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                          Container(child: Text(listVerbs[index][0], style: stylemodeverb,),width: 110 ), 
                                          SizedBox(width: 5),
                                          Text('|', style: TextStyle(color: Colors.orange)),
                                          SizedBox(width: 5),
                                          Container(child: Text(listVerbs[index][1], style: stylemodeverb, textAlign: TextAlign.end,), width: 110),
                                          // Icon(Icons.arrow_right)

                                        ]) 
                                      ),
                                    ),
                                    // Expanded(
                                    //                                     child: ListTile(
                                        
                                    //     title: 
                                    //   ),
                                    // ),
                                  ],
                                
                              
                            ),
                          
                        );
                    }),
      ),
                    
            
          
    );
      
    
  }
}

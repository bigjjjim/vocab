import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'home4.dart';


List<List<String>> listVerbs = [
  [
    "accepter",
    "aceitar",
  ],
  [
    "acheter",
    "comprar",
  ],
  [
    "aider",
    "ajudar",
  ],
  [
    "aimer",
    "amar",
  ],
  [
    "ajouter",
    "adicionar",
  ],
  [
    "aller",
    "ir",
  ],
  [
    "allumer",
    "acender",
  ],
  [
    "appeler",
    "chamar",
  ],
  [
    "apporter",
    "trazer",
  ],
  [
    "apprendre",
    "aprender",
  ],
  [
    "arrêter (police)",
    "deter",
  ],
  ["arrêter (stop)", "parar"],
  [
    "arriver",
    "acontecer",
  ],
  [
    "attendre",
    "esperar",
  ],
  [
    "avoir",
    "ter",
  ],
  [
    "avoir besoin",
    "precisar",
  ],
  [
    "casser",
    "partir",
  ],
  [
    "changer",
    "mudar",
  ],
  [
    "chanter",
    "cantar",
  ],
  [
    "chercher",
    "buscar",
  ],
  [
    "choisir",
    "escolher",
  ],
  [
    "commencer",
    "começar",
  ],
  [
    "comprendre",
    "compreender",
  ],
  [
    "compter",
    "contar",
  ],
  [
    "conduire",
    "conduzir",
  ],
  [
    "connaître",
    "conhecer",
  ],
  [
    "continuer",
    "continuar",
  ],
  [
    "couper",
    "cortar",
  ],
  [
    "courir",
    "correr",
  ],
  [
    "croire",
    "acreditar",
  ],
  [
    "décider",
    "decidir",
  ],
  [
    "demander",
    "pedir",
  ],
  [
    "descendre",
    "descer",
  ],
  [
    "devenir",
    "tornar-se",
  ],
  [
    "devoir",
    "dever",
  ],
  [
    "dire",
    "dizer",
  ],
  [
    "donner",
    "dar",
  ],
  [
    "dormir",
    "dormir",
  ],
  [
    "écouter",
    "escutar",
  ],
  [
    "écrire",
    "escrever",
  ],
  [
    "empêcher",
    "impedir",
  ],
  [
    "entendre",
    "ouvir",
  ],
  [
    "entrer",
    "entrar",
  ],
  [
    "envoyer",
    "enviar",
  ],
  [
    "essayer",
    "tentar",
  ],
  [
    "éteindre",
    "desligar",
  ],
  [
    "être",
    "ser",
  ],
  [
    "exister",
    "existir",
  ],
  [
    "expliquer",
    "explicar",
  ],
  [
    "faire",
    "fazer",
  ],
  [
    "cuisiner",
    "cozinhar",
  ],
  [
    "fermer",
    "fechar",
  ],
  [
    "terminer",
    "terminar",
  ],
  [
    "gagner",
    "ganhar",
  ],
  [
    "garder",
    "manter",
  ],
  [
    "goûter",
    "lanchar",
  ],
  [
    "jeter",
    "atirar",
  ],
  [
    "jouer",
    "jogar",
  ],
  [
    "laisser",
    "deixar",
  ],
  [
    "nettoyer",
    "limpar",
  ],
  [
    "lire",
    "ler",
  ],
  [
    "manger",
    "comer",
  ],
  [
    "marcher",
    "andar",
  ],
  [
    "mettre",
    "pôr",
  ],
  [
    "montrer",
    "mostrar",
  ],
  [
    "oublier",
    "esquecer",
  ],
  [
    "ouvrir",
    "abrir",
  ],
  [
    "parler",
    "falar",
  ],
  [
    "partir",
    "partir",
  ],
  [
    "payer",
    "pagar",
  ],
  [
    "penser",
    "pensar",
  ],
  [
    "perdre",
    "perder",
  ],
  [
    "permettre",
    "permitir",
  ],
  [
    "pleurer",
    "chorar",
  ],
  [
    "porter",
    "incidir",
  ],
  [
    "poser",
    "colocar",
  ],
  [
    "pouvoir",
    "poder",
  ],
  [
    "prendre",
    "pegar",
  ],
  [
    "préparer",
    "preparar",
  ],
  [
    "rappeler",
    "lembrar",
  ],
  [
    "recevoir",
    "receber",
  ],
  [
    "reconnaître",
    "reconhecer",
  ],
  [
    "refuser",
    "recusar",
  ],
  [
    "regarder",
    "ver",
  ],
  ["voir", "ver"],
  [
    "rencontrer",
    "conhecer",
  ],
  [
    "rendre",
    "tornar",
  ],
  [
    "rentrer",
    "voltar",
  ],
  [
    "répéter",
    "repetir",
  ],
  [
    "répondre",
    "responder",
  ],
  [
    "ressembler",
    "parecer",
  ],
  [
    "rester",
    "ficar",
  ],
  [
    "trouver",
    "encontrar",
  ],
  ["trouver (penser)", "achar"],
  [
    "réussir",
    "ter sucesso",
  ],
  [
    "rire",
    "rir",
  ],
  [
    "s'asseoir",
    "sentar-se",
  ],
  [
    "s'endormir",
    "adormecer",
  ],
  [
    "savoir",
    "saber",
  ],
  [
    "se laver",
    "lavar-se",
  ],
  [
    "se reposer",
    "descansar",
  ],
  [
    "se réveiller",
    "acordar",
  ],
  [
    "se souvenir",
    "recordar",
  ],
  [
    "sortir",
    "sair",
  ],
  [
    "suivre",
    "seguir",
  ],
  [
    "tenir",
    "segurar",
  ],
  [
    "tirer",
    "puxar",
  ],
  [
    "tomber",
    "cair",
  ],
  [
    "toucher",
    "tocar",
  ],
  [
    "tourner",
    "girar",
  ],
  [
    "travailler",
    "trabalhar",
  ],
  [
    "utiliser",
    "usar",
  ],
  [
    "vendre",
    "vender",
  ],
  [
    "venir",
    "vir",
  ],
  [
    "vivre",
    "viver",
  ],
  [
    "voler",
    "roubar",
  ],
  [
    "vouloir",
    "querer",
  ]
];

class VerbPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: CupertinoScrollbar(
        child: ListView.builder(
            itemCount: listVerbs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[300]),
                  ),
                  color: index.isEven ? krow1 : krow2,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("VerbDetailPage",
                                arguments: listVerbs[index]);
                          },
                          // contentPadding: EdgeInsets.only(left:40),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                     padding: EdgeInsets.all(0),

                                      onPressed: () => speakingFrench("${listVerbs[index][0]}"),
                                                                      child: Container(
                                          child: Text(
                                            listVerbs[index][0],
                                            style: styleMainTable,
                                          ),
                                          width: 110),
                                    ),
                                    SizedBox(width: 5),
                                    Text('|',
                                        style: TextStyle(color: Colors.orange)),
                              //       IconButton(icon: Icon(Icons.search, color: Colors.orange), 
                              //       onPressed:() {
                              //   Navigator.of(context).pushNamed("VerbDetailPage",
                              //       arguments: listVerbs[index]);
                              // }, ),
                                    SizedBox(width: 5),
                                    MaterialButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () => speakingPortugais("${listVerbs[index][1]}"),
                                                                      child: Container(
                                          child: Text(
                                            listVerbs[index][1],
                                            style: styleMainTable,
                                            textAlign: TextAlign.end,
                                          ),
                                          width: 110),
                                    ),
                                    //  SizedBox(width: 40),
                        ]),
                             Container(
                              //  width: 20,
                               alignment: Alignment.centerRight,
                               child: 
                              //  IconButton(
                                //  alignment: Alignment.centerRight,
                                //  icon:
                                  Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 15.0,), 
                                //       onPressed:() {
                                //   Navigator.of(context).pushNamed("VerbDetailPage",
                                //       arguments: listVerbs[index]);
                                // }, ),
                             ),],
                            
                          ),
                              ),
                    ),

                  ],
                ),
              );
            }),
      ),
    );
  }
}

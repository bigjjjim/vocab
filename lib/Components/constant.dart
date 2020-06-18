import 'package:flutter/material.dart';
import 'package:vocab/authentification/sign_in.dart';
import 'package:vocab/Pages/searching.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

const TextStyle tableTextStyle = TextStyle(fontSize: 17, color: Colors.black);

const kwidgetTitleStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
);
const kdialogueDescripStyle = TextStyle(
  fontSize: 16.0,
);
const kbackgroundAppbar = Color(0xFF2e7d32);

const kcolorbackground = Color(0xFFf6fff6);
const kcolorgrise = Color(0xFFfffcf8);
const krow2 = Color(0xFFfffcf8);
const krow1 = Color(0xFFe6ffe7);
const kerror = Color(0xFFfe9b94);
const kcorrect = Color(0xFFb7e9af);
const kcolorblacktext = Color(0xFF808080);

const stylegrammaireheader = TextStyle(
    fontSize: 20, color: kcolorblacktext, fontWeight: FontWeight.w500);
const stylemodeverb = TextStyle(
    fontSize: 18, color: kcolorblacktext, fontWeight: FontWeight.w500);
const styletempsverb = TextStyle(
    fontSize: 16, color: kcolorblacktext, fontWeight: FontWeight.w500);
const styleheadertable= TextStyle(
    fontSize: 16, color: kcolorblacktext, fontWeight: FontWeight.w600);
const styleRowTable= TextStyle(
    fontSize: 14, color: kcolorblacktext, fontWeight: FontWeight.w500);
  const styleMainTable = TextStyle(
    fontSize: 17, color: kcolorblacktext, fontWeight: FontWeight.w500);

TextField textFieldDialogue(
  FocusNode focus,
  TextEditingController controller,
  String hint,
  Function onchanged,
) {
  return TextField(
    focusNode: focus,
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: onchanged,
    textAlign: TextAlign.center,
    decoration:
        InputDecoration.collapsed(hintText: hint, border: OutlineInputBorder()),
  );
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

AppBar headerNavNoInfo({BuildContext context}) {
  return AppBar(
      title: Image.asset(
        "images/miniloblanc.png",
        scale: 15,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFF2e7d32),
  );}


AppBar headerNav({BuildContext context}) {
  return AppBar(
      title: Image.asset(
        "images/miniloblanc.png",
        scale: 15,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFF2e7d32),
      actions: [
        IconButton(
           icon: Icon(
            Icons.search,
            color: Colors.orange,
          ),
          onPressed: () {
           showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
  //          Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Searching()),
  // );
        },),
        IconButton(
          // child: Container(
          //   width: 70,
          //   height: 30,
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //       color: Color(0xFF123214),
          //       shape: BoxShape.rectangle,
          //       borderRadius: BorderRadius.all(Radius.circular(10))),
          //   child: Text(
          //     'Log out',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          
          icon: Icon(
            Icons.info_outline,
            color: Colors.orange,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogcontext) => new AlertDialog(
                backgroundColor: kcolorbackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Center(
                    child: new Text(
                  "Information",
                  style: stylegrammaireheader,
                )),
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                                      child: Column(
                      children: <Widget>[
                        Container(
                          // width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.height * 0.4,

                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                new Text(
                                    "Minilo vous propose d'apprendre les mots, les expressions et les verbes les plus important de la langue portugaise.", style: styletempsverb,),
                                Text(
                                    "Gràce a des techniques statistiques et informatiques, le contenu de cette application représente les termes qui se répètent le plus en analysant des centaines de milliers de textes portugais.", style: styletempsverb,),
                                Text(
                                    "Vous y trouverez également les bases de la grammaire et autres en annexe ainsi qu'une option de quiz pour vous tester!", style: styletempsverb,),
                               
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        RawMaterialButton(
                            // fillColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: kcolorblacktext,
                                ),
                                borderRadius: BorderRadius.circular(40)),
                            onPressed: () {
                              Navigator.pop(dialogcontext);
                              handleSignOut();
                              Navigator.of(context).pushNamed('/');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  width: 150,
                                  child: Text("Deconnexion",
                                      style: stylemodeverb,
                                      textAlign: TextAlign.center)),
                            )),
                        SizedBox(height: 10),
                        RawMaterialButton(
                            fillColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            onPressed: () {
                              Navigator.pop(dialogcontext);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 150,
                                child: Text(
                                  "Retour",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ]);
}


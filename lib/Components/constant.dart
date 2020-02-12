import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

const kwidgetTitleStyle = TextStyle(fontSize: 24.0,
                    fontWeight: FontWeight.w700,);
const kdialogueDescripStyle = TextStyle(
                    fontSize: 16.0,
                  );



TextField textFieldDialogue(FocusNode focus, TextEditingController controller, String hint, Function onchanged) {
    
    return TextField(
                          focusNode: focus,
                          controller: controller,
                          keyboardType: TextInputType.number,
                          onChanged: onchanged,
                          decoration: InputDecoration.collapsed(
                            hintText: hint,
                            // errorText: _validate ? 'Le premiere index doit etre plus petit que le deuxieme' : null,
                          )
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
                // hintStyle: TextStyle(color: Colors.grey),
                
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
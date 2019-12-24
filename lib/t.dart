import 'package:flutter/material.dart';

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


// (String newValue) {
//                             setState(() {
//                               hint = newValue;
//                             });
//                           },
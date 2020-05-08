import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';

class QuizButton extends StatelessWidget {
  QuizButton({@required this.onPressed, @required this.word, @required this.color});
  // final IconData icon;
  final Function onPressed;
  final String word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: MaterialButton(
        // minWidth: 120.0,
        
                padding: EdgeInsets.all(0),

       
        onPressed: onPressed,
        child:  Container(
                          width: MediaQuery.of(context).size.width*0.6,

           decoration:  BoxDecoration(
             boxShadow: [BoxShadow(color: Colors.grey[300], offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0, )],
                color: color,
                  // color: Colors.orange,
                  borderRadius:  BorderRadius.all(
                            Radius.circular(7),
                            ),
              ),
          child: AnimatedContainer(
           
              
              duration: Duration(milliseconds: 100),
              child: Container(
                // width: MediaQuery.of(context).size.width*0.6,
                height: 50,
                alignment: Alignment.center,
               
              child:
          
          Text(
            word,
            style: TextStyle(fontSize: 20.0, color: kcolorblacktext),
          ),),
      ),
        ),),
    );
  }
}




class AnnexeButton extends StatelessWidget {
  AnnexeButton({@required this.onPressed, @required this.word, @required this.color});
  // final IconData icon;
  final Function onPressed;
  final String word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return 
     
      // MaterialButton(

      //    focusColor: Colors.orange,
      //     onPressed: onPressed,
      //     child:  
      //     Container(
      //        width: MediaQuery.of(context).size.width*0.8,

      //        decoration:  BoxDecoration(
      //          boxShadow: [BoxShadow(color: Colors.grey[300], offset: Offset(0.0, 1.0), //(x,y)
      //                   blurRadius: 2.0, )],
      //             color: color,
      //               // color: Colors.orange,
      //               borderRadius:  BorderRadius.all(
      //                         Radius.circular(7),
      //                         ),
      //           ),
      //       child:  Container(
      //             // width: MediaQuery.of(context).size.width*0.6,
      //             height: 50,
      //             alignment: Alignment.center,
                 
      //           child:
            
      //       Text(
      //         word,
      //         style: TextStyle(fontSize: 20.0, color: Colors.black),
      //       ),),
      // ),
      
      //         ),


      Container(
        height: 50,
        width:  MediaQuery.of(context).size.width*0.8,
        decoration:  BoxDecoration(
               boxShadow: [BoxShadow(color: Colors.grey[300], offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0, )],
                  color: color,
                    // color: Colors.orange,
                    borderRadius:  BorderRadius.all(
                              Radius.circular(7),
                              ),
                ),
        child: MaterialButton(
          onPressed: onPressed,
          highlightColor: Colors.orange,
          // disabledColor: Colors.white,
          splashColor: Colors.transparent,
          // hoverColor: Colors.orange ,
           child:
            
            Text(
              word,
              style: TextStyle(fontSize: 20.0, color: kcolorblacktext),
            ),
        
        
        ),
      
    );
  }
}


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
    runApp(MyApp());
}

//Stateless widgets (For stuff that doesn't change)
//Stateful widgets (For stuff that does change)
class MyApp extends StatelessWidget {

  final String text = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(26.0),
      margin: EdgeInsets.only(top:30),
      alignment: Alignment.topCenter,
      child: Column(
        //Flexbox Styled widget positioning
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(color: Colors.red, child: Text(this.text, textDirection: TextDirection.ltr,),) ,
          Container(color: Colors.blue, child: Text("Brief Text", textDirection: TextDirection.ltr,),),
          Container(color: Colors.green, child: Text("Very very crazy long text", textDirection: TextDirection.ltr,),),
        ],
      ),
    );
  }

}
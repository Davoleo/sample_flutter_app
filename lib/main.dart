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
    return Center(
      child: Text(this.text, textDirection: TextDirection.ltr,),
    );
  }

}
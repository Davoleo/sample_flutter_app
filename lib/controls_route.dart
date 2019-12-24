import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlsRoute extends StatefulWidget {

  final String title = "UI Components";

  @override
  State createState() {
    return _ControlsDemo();
  }
}

enum Options {
  op1,
  op2,
  op3
}

class _ControlsDemo extends State<ControlsRoute> {
  bool cbState = false;

  Options chosenOption = Options.op1;

  void onRadioClick(newValue) {
    setState(() {
      chosenOption = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Checkbox Demo"),
              Checkbox(
                  tristate: true,
                  activeColor: Colors.black45,
                  checkColor: Colors.greenAccent,
                  value: cbState,
                  onChanged: (v) {setState(() {
                    cbState = v;
                  });}),
              Checkbox(
                  tristate: true,
                  activeColor: Colors.indigo,
                  checkColor: Colors.lightBlueAccent,
                  value: cbState,
                  onChanged: (v) {setState(() {
                    cbState = v;
                  });})
            ],
          ),),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(value: Options.op1, groupValue: chosenOption, onChanged: onRadioClick),
              Radio(value: Options.op2, groupValue: chosenOption, onChanged: onRadioClick),
              Radio(value: Options.op3, groupValue: chosenOption, onChanged: onRadioClick),
            ],
          ),),
        ],
      ),
    );
  }
}
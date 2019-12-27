import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  bool switchState = false;
  int sliderValue = 0;

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
          Text("Radio Buttons Demo"),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(value: Options.op1, groupValue: chosenOption, onChanged: onRadioClick),
              Radio(value: Options.op2, groupValue: chosenOption, onChanged: onRadioClick),
              Radio(value: Options.op3, groupValue: chosenOption, onChanged: onRadioClick),
            ],
          ),),
          Text("Switch Demo"),
          Switch(value: switchState,
              //customize colors/images in the switch
              activeColor: Colors.blue,
              activeTrackColor: Colors.brown,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,

              //Widget Size
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //Drag Behaviour Smoothness
              dragStartBehavior: DragStartBehavior.start,

              onChanged: (newVal) { setState(() {switchState = newVal;});}
              ),
          Text("Slider Demo"),
          Slider(
            value: sliderValue.toDouble(),
            onChanged: (newVal) {setState(() {sliderValue = newVal.round();});},
            min: 0,
            max: 100,
            //Slider Steps
            divisions: 100,
            label: "Drag Me! Slider Value is $sliderValue",
          ),
          Text("Il Valore è $sliderValue")
        ],
      ),
    );
  }
}
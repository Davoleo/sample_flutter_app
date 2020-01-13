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
      
      body: ListView(
        children: <Widget>[
          Column(
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
            Text("Il Valore è $sliderValue"),
            RaisedButton(
              elevation: 6,
              highlightElevation: 1,
              textColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.update, color: Colors.green,),
                  Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text("Update"),)
                ],
              ),
              onPressed: () => {},
            ),
            //Specific Icon RaisedButton Constructor
            RaisedButton.icon(onPressed: () => {}, icon: Icon(Icons.arrow_downward), label: Text("icon constructor")),
            FlatButton(
              onPressed: () => {},

              child: Text("Flat Button", style: TextStyle(fontSize: 20),),
              color: Colors.red,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              splashColor: Colors.deepOrangeAccent,
              //Teme Presets, shortcut to set all the materials properties
              //textTheme: ButtonTextTheme.primary,

              padding: EdgeInsets.all(8),
            ),
            IconButton(icon: Icon(Icons.videocam), onPressed: () => {},),
          ],)
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar),
        label: Text("OOF!"),
      ),

    );
  }
}
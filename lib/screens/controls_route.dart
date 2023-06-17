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
  bool? cbState = false;
  bool switchState = false;
  int sliderValue = 0;

  Options chosenOption = Options.op1;

  final List<LanguageColor> langs = <LanguageColor> [
    LanguageColor(1, "Java", Color(0xFFDC8F1F)),
    LanguageColor(2, "Kotlin", Color(0xFFFFB240)),
    LanguageColor(3, "Dart", Color(0xFF00E1D6)),
    LanguageColor(4, "Typescript", Color(0xFF3691AB)),
    LanguageColor(5, "C#", Color(0xFF1DA800)),
    LanguageColor(6, "Objective C", Color(0xFF54B2FF)),
    LanguageColor(6, "C++", Color(0xFFFF5E9C)),
  ];

  LanguageColor? dropValue;

  EnumPage? popupValue;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ? 1 : 6),
                textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.orange)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
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
            ElevatedButton.icon(onPressed: () => {}, icon: Icon(Icons.arrow_downward), label: Text("icon constructor")),
            TextButton(
              onPressed: () => {},

              child: Text("Elevated Button", style: TextStyle(fontSize: 20),),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled))
                        return Colors.grey;
                      else
                        return Colors.red;
                    }
                ),
                textStyle: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) =>
                      TextStyle(
                          color: states.contains(MaterialState.disabled) ? Colors.black : Colors.white
                      )
                ),
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
                padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
              ),

              //Theme Presets, shortcut to set all the materials properties
              //textTheme: ButtonTextTheme.primary,
            ),
              IconButton(icon: Icon(Icons.videocam), onPressed: () => {},),
              DropdownButton<LanguageColor>(
                disabledHint: Text("Disabled"),
                hint: Text("Select a Language"),
                icon: Icon(Icons.all_inclusive),
                isExpanded: false,
                
                value: dropValue,
                items: langs.map<DropdownMenuItem<LanguageColor>>(
                    (LanguageColor color) {
                      return DropdownMenuItem(
                        child: Text(
                          color.langName,
                          style: TextStyle(color: color.color),),
                        value: color,
                      );
                    }
                ).toList(),
                onChanged: (LanguageColor? value) {setState(() {
                  dropValue = value;
                });},
              ),
              //Popup Menu
              PopupMenuButton<EnumPage>(
                child: Text("Navigate to..."),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<EnumPage>>[
                  const PopupMenuItem<EnumPage>(
                    value: EnumPage.home,
                    child: Text("Home Page"),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<EnumPage>(
                    value: EnumPage.page1,
                    child: Text("First Page"),
                  ),
                  const PopupMenuItem<EnumPage>(
                    value: EnumPage.page2,
                    child: Text("Second Page"),
                  )
                ],
                onSelected: (value) {
                  setState(() {
                    popupValue = value;
                  });
                  },
              )
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

class LanguageColor {
  int id;
  String langName;
  Color color;

  LanguageColor(this.id, this.langName, this.color);
}

enum EnumPage {
  home,
  page1,
  page2
}
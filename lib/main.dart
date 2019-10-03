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
    return MaterialApp(
      title: "SampleFlutterApp",
      theme: ThemeData(primarySwatch: Colors.green),
      home: BoxDemo(),
    );
  }

}

class BoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout Demo"),),
      body: Center(
        child: Container(
         decoration: ShapeDecoration(
            color: Colors.green,
            shape:
            Border.all(color: Colors.green[600], width: 2) +
                Border.all(color: Colors.green[700], width: 2) +
                Border.all(color: Colors.green[800], width: 2) +
                Border.all(color: Colors.green[900], width: 2)
         ),
          padding: EdgeInsets.all(32),
          child: Text("DEMO"),
        ),
      ),
    );
  }
}

//Sameple Login Page
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // The structure of the content of the app
    return Scaffold(
      appBar: AppBar(title: Text("Positioning"),),   //Colored App bar at the top
      body: Container(                               //Body: Contains all the content
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title Box
            Container(margin: EdgeInsets.only(bottom: 16), child: Text("LOGIN"),),
            //Username Box
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(child: Text("USERNAME"), margin: EdgeInsets.only(right: 8),),
                  Flexible(child: TextField(),)
                ],),
            ),
            // Password Box
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(child: Text("PASSWORD"), margin: EdgeInsets.only(right: 8),),
                  Flexible(child: TextField(obscureText: true,),)
                ],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[RaisedButton(child: Text("Login"), onPressed: () => {},)],
            )
          ],),
      ),
    );
  }
}

//Legacy Home

//return Container(
//color: Colors.grey,
//padding: const EdgeInsets.all(26.0),
//margin: EdgeInsets.only(top:30),
//alignment: Alignment.topCenter,
//child: Column(
////Flexbox Styled widget positioning
//mainAxisAlignment: MainAxisAlignment.start,
//mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//textDirection: TextDirection.ltr,
//children: <Widget>[
//Container(color: Colors.red, child: Text(this.text, textDirection: TextDirection.ltr,),) ,
//Container(color: Colors.blue, child: Text("Brief Text", textDirection: TextDirection.ltr,),),
//Container(color: Colors.green, child: Text("Very very crazy long text", textDirection: TextDirection.ltr,),),
//],
//),
//);
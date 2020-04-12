import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/error_screen.dart';
import 'package:sample_flutter_app/screens/home_page.dart';
import 'package:sample_flutter_app/utils/router.dart';

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
      home: TestHomePage(),
      //Third Navigation Method - Generator Function
      onGenerateRoute: (settings) => Router.generateRoute(context, settings),
      //Just Like a 404 Page
      onUnknownRoute: (context) => MaterialPageRoute(builder: (context) => ErrorScreen()),
//  Using named routes (like web back-end services)
//      routes: <String, WidgetBuilder> {
//        '/' : (BuildContext context) => ToDoList(title: "TO-DO List",),
//        '/tododetail' : (BuildContext context) => ToDoDetails(),
//        '/addtodo' : (BuildContext context) => AddToDoItem(),
//      },
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
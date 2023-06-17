import 'package:flutter/material.dart' hide Router;
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
      home: TestHomePage(title: "HomePage",),
      //Third Navigation Method - Generator Function
      onGenerateRoute: (settings) => Router.generateRoute(settings),
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
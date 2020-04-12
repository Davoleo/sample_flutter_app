import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/navigation/first_page.dart';

class NavigationRoute extends StatefulWidget {
  @override
  _NavigationRouteState createState() => _NavigationRouteState();
}

class _NavigationRouteState extends State<NavigationRoute> {
  String returnedValue = "Navigation Home Page";

  //Launch a route for a result
  void getScreenParams(context) async {
    String value = await Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => NavigationFirstPage(),
          settings: RouteSettings(arguments: "TestParam")
        ));

    setState(() {
      //if value is null it assigns "No DATA" otherwise it assigns value
      returnedValue = value ?? "No DATA";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Demo"),
        ),

        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.looks_one),
              onPressed: () {
                this.getScreenParams(context);
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.looks_two),
              onPressed: () {
              },
            ),
          ],
        ),

        body: Container(
          color: Colors.amberAccent,
          child: Center(child: Text(returnedValue),),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NavigationFirstPage extends StatefulWidget {
  @override
  _NavigationFirstPageState createState() => _NavigationFirstPageState();
}

class _NavigationFirstPageState extends State<NavigationFirstPage> {
  @override
  Widget build(BuildContext context) {
    var params = ModalRoute.of(context)?.settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(params.toString()),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context, "DATA PASSED BACK FROM THE FIRST PAGE"),
            )
          ],
        ),

        body: Container(
          color: Colors.lightGreen,
          child: Center(child: Text("1st Page"),),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OrientationRoute extends StatefulWidget {
  @override
  _OrientationRouteState createState() => _OrientationRouteState();
}

class _OrientationRouteState extends State<OrientationRoute> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Orientation Manager"),),
        body: Column(children: <Widget>[
          Icon(Icons.delete_forever),
          Icon(Icons.delete_forever),
          Icon(Icons.delete_forever),
          Icon(Icons.delete_forever),

          Expanded(child:
          OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 4 : 8,
              children: <Widget>[
                Icon(Icons.access_time),
                Icon(Icons.access_time),
                Icon(Icons.access_time),
                Icon(Icons.access_time),
                Icon(Icons.access_time),
                Icon(Icons.access_time),
                Icon(Icons.access_time),
              ],
            );
          },
          )),
        ],),
    );
  }
}

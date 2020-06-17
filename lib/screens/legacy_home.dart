import 'package:flutter/material.dart';

//Legacy Home Screen
class LegacyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(26.0),
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      child: Column(
//Flexbox Styled widget positioning
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text(
              "Legacy Home",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text(
              "Brief Text",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.green,
            child: Text(
              "Very very crazy long text",
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}

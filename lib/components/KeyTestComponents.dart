import 'dart:math';

import 'package:flutter/material.dart';

class StatelessColorWidget extends StatelessWidget {

  StatelessColorWidget(this.color, {required Key key}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: this.color,
      child: null,
    );
  }
}

class StatefulColorWidget extends StatefulWidget {

  StatefulColorWidget(this.color, {required Key key}) : super(key: key);

  final Color color;

  @override
  _StatefulColorWidgetState createState() => _StatefulColorWidgetState(color);
}

class _StatefulColorWidgetState extends State<StatefulColorWidget> {

  final Color color;

  _StatefulColorWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: 80,
      height: 80,
      color: this.color,
      child: Text(Random().nextInt(100000).toString()),
    );
  }
}



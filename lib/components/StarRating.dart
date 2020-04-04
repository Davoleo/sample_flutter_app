import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int value;
  final void Function(int value) onPressed;


  StarRating({@required this.value, @required this.onPressed, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          child: _getStar(index),
          onTap: () => onPressed(index),
        );
      })
    );
  }

  Icon _getStar(int pos) {
    if (pos <= value)
      return Icon(Icons.star, color: Colors.orange,);
    else
      return Icon(Icons.star_border, color: Colors.grey,);
  }
}
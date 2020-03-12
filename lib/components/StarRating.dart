import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final void Function(int value) onPressed;
  final int value;


  StarRating({@required this.onPressed, this.value = 0, Key key}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          child: getStar(index),
          onTap: () => widget.onPressed(index),
        );
      }),
    );
  }

  Icon getStar(int pos) {
    if (pos <= widget.value)
      return Icon(Icons.star, color: Colors.orange,);
    else
      return Icon(Icons.star_border, color: Colors.grey,);
  }
}

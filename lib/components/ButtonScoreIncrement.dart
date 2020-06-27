import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/models/Player.dart';

class ButtonScoreIncrement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Provider.of<Player>(context).incrementScore(10),
      tooltip: "Increment Score",
      child: const Icon(Icons.add),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/models/Player.dart';

class PlayerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Player>(
      builder: (context, player, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Player: ${player.name}"),
            Text("Score: ${player.score}"),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/components/ButtonScoreIncrement.dart';
import 'package:sample_flutter_app/components/PlayerWidget.dart';
import 'package:sample_flutter_app/models/Player.dart';

class ProviderTest extends StatelessWidget {
  final Player player = Player("Davoleo");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Player>(
      create: (context) => player,
      child: Scaffold(
        appBar: AppBar(title: Text("Provider Test"),),

        floatingActionButton: ButtonScoreIncrement(),

        body: Center(
          child: PlayerWidget(),
        ),
      ),
    );
  }
}

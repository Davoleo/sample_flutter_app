import 'package:flutter/foundation.dart';

class Player extends ChangeNotifier {
  String _name;
  int _score;

  Player(this._name, {int score = 0}) {
    _score = score;
  }

  String get name => _name;

  int get score => _score;

  void incrementScore(int value) {
    if(value != 0) {
      _score += value;
      notifyListeners();
    }
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
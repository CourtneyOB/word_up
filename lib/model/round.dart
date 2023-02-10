import 'package:word_up/model/dice_value.dart';

class Round {
  List<DiceValue> diceRoll;
  String? entry;
  int score;

  Round(this.diceRoll) : score = 0;
}

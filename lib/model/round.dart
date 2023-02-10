import 'package:word_up/model/dice_value.dart';

class Round {
  List<DiceValue> diceRoll;
  String entry;
  int score;

  Round(this.diceRoll)
      : score = 0,
        entry = '';
  Round.fromRound(this.diceRoll, this.entry, this.score);

  Round copyWith({List<DiceValue>? diceRoll, String? entry, int? score}) {
    return Round.fromRound(
      diceRoll ?? this.diceRoll,
      entry ?? this.entry,
      score ?? this.score,
    );
  }
}

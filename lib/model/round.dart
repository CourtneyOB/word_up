import 'package:word_up/model/dice_value.dart';
import 'package:word_up/model/vowel_filter.dart';

class Round {
  List<DiceValue> diceRoll;
  String entry;
  VowelType? vowelType;
  int score;

  Round(this.diceRoll)
      : score = 0,
        entry = '';
  Round.fromRound(this.diceRoll, this.entry, this.vowelType, this.score);

  Round copyWith(
      {List<DiceValue>? diceRoll,
      String? entry,
      VowelType? vowelType,
      int? score}) {
    return Round.fromRound(
      diceRoll ?? this.diceRoll,
      entry ?? this.entry,
      vowelType ?? this.vowelType,
      score ?? this.score,
    );
  }
}

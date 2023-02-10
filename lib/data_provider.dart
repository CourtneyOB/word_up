import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/dice_value.dart';
import 'package:word_up/model/dice.dart';
import 'package:word_up/model/round.dart';
import 'dart:math';

class DataProvider extends StateNotifier<List<Round>> {
  DataProvider() : super([]);

  List<Dice> dice = [
    Dice(['N', 'R', 'C', 'D', 'M', 'N'], 1),
    Dice(['T', 'R', 'K', 'L', 'G', 'B'], 1),
    Dice(['S', 'M', 'T', 'D', 'F', 'H'], 1),
    Dice(['L', 'S', 'R', 'K', 'N', 'B'], 1),
    Dice(['J', 'W', 'P', 'V', 'M', 'N'], 2),
    Dice(['Z', 'X', 'Q', 'V', 'K', 'W'], 3),
  ];
  final random = Random();

  void newRound() {
    if (state.length < 11) {
      List<DiceValue> diceRoll = [];
      for (Dice d in dice) {
        int r = random.nextInt(d.sides.length);
        diceRoll.add(DiceValue(d.value, d.sides[r]));
      }
      state = [...state, Round(diceRoll)];
    }
  }

  void submitWord(String word) {
    //TODO: calculate score
    state = [
      for (Round round in state)
        if (round == state.last) round.copyWith(entry: word) else round,
    ];
  }

  void restart() {
    state = [];
  }

  void printRounds() {
    for (Round round in state) {
      print(
          'Dice: ${round.diceRoll}, Entry: ${round.entry}, Score: ${round.score}');
    }
  }
}

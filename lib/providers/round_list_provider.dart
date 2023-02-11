import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/game_data.dart';
import 'package:word_up/model/dice_value.dart';
import 'package:word_up/model/dice.dart';
import 'package:word_up/model/round.dart';
import 'dart:math';

class RoundListProvider extends StateNotifier<List<Round>> {
  RoundListProvider() : super([]) {
    if (state.isEmpty) {
      newRound();
    }
  }

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

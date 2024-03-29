import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/game_data.dart';
import 'package:word_up/model/dice_value.dart';
import 'package:word_up/model/dice.dart';
import 'package:word_up/model/round.dart';
import 'dart:math';

import 'package:word_up/model/vowel_filter.dart';

class RoundListProvider extends StateNotifier<List<Round>> {
  RoundListProvider() : super([]) {
    if (state.isEmpty) {
      newRound();
    }
  }

  final random = Random();

  void newRound() {
    if (state.length < 12) {
      List<DiceValue> diceRoll = [];
      for (Dice d in dice) {
        int r = random.nextInt(d.sides.length);
        diceRoll.add(DiceValue(d.value, d.sides[r]));
      }
      state = [...state, Round(diceRoll)];
    }
  }

  void submitWord(String word, VowelCategory vowelType) {
    int score = 0;

    List<DiceValue> diceValues = [...state.last.diceRoll];
    for (int i = 0; i < word.length; i++) {
      if (!vowels.contains(word[i])) {
        DiceValue dice =
            diceValues.firstWhere((value) => value.letter == word[i]);
        score = score + dice.score;
        diceValues.remove(dice);
      }
    }
    if (word.length > 4) {
      String subString = word.substring(4);
      score = score + subString.length;
    }
    state = [
      for (Round round in state)
        if (round == state.last)
          round.copyWith(entry: word, vowelType: vowelType, score: score)
        else
          round,
    ];
  }

  List<String> getDiceValues() {
    List<String> value = [];
    for (DiceValue dice in state.last.diceRoll) {
      value.add(dice.letter);
    }
    return value;
  }

  void restart() {
    state = [];
    newRound();
  }

  void printRounds() {
    for (Round round in state) {
      print(
          'Dice: ${round.diceRoll}, Entry: ${round.entry}, Score: ${round.score}');
    }
  }
}

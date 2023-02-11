import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:word_up/providers/round_list_provider.dart';
import 'package:word_up/screens/main_screen.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word up',
      theme: ThemeData(
        fontFamily: 'PassionOne',
      ),
      home: const MainScreen(),
    );
  }
}

//Global variables

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

enum BoxDecor { negative, multiLetter, bonus, total }

//Providers

final roundListProvider = StateNotifierProvider<RoundListProvider, List<Round>>(
    (ref) => RoundListProvider());
final vowelFilterDisplayProvider = Provider<List<VowelFilter>>((ref) {
  String word = ref.watch(wordEntryProvider);
  //TODO: add filter depending on whether used already in previous round
  List<Round> rounds = ref.watch(roundListProvider);
  return filterVowels(word, rounds);
});
final wordEntryProvider = StateProvider<String>((ref) => '');
final selectedVowelProvider = StateProvider<VowelType?>((ref) => null);

List<VowelFilter> filterVowels(String word, List<Round> rounds) {
  List<VowelFilter> list = [];
  List<String> vowels = ['A', 'E', 'I', 'O', 'U'];

  for (var value in VowelType.values) {
    bool inactive = false;
    //filter according to entered word
    if (value.isPositive() && value != VowelType.wildcard) {
      List<String> otherVowels = List.from(vowels);
      otherVowels.remove(value.stringValue());
      for (String vowel in otherVowels) {
        if (word.contains(vowel)) {
          inactive = true;
        }
      }
    } else if (!value.isPositive()) {
      if (word.contains(value.stringValue())) {
        inactive = true;
      }
    }
    if (rounds.firstWhereOrNull((element) => element.vowelType == value) !=
        null) {
      inactive = true;
    }
    //filter according to if a vowel type has already been used
    list.add(VowelFilter(type: value, inactive: inactive));
  }
  return list;
}

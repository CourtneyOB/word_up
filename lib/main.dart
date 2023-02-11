import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:word_up/providers/round_list_provider.dart';
import 'package:word_up/screens/main_screen.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

enum BoxDecor { negative, multiLetter, bonus, total }

final roundListProvider = StateNotifierProvider<RoundListProvider, List<Round>>(
    (ref) => RoundListProvider());
final vowelFilterDisplayProvider = Provider<List<VowelFilter>>((ref) {
  String word = ref.watch(wordEntryProvider);
  //TODO: add filter depending on whether used already
  //Round currentRound = ref.watch(roundListProvider).last;
  List<VowelFilter> list = [];
  List<String> vowels = ['A', 'E', 'I', 'O', 'U'];
  for (int i = 0; i < 5; i++) {
    bool inactive = false;
    List<String> otherVowels = List.from(vowels);
    otherVowels.removeAt(i);
    for (String vowel in otherVowels) {
      if (word.contains(vowel)) {
        inactive = true;
      }
    }
    list.add(VowelFilter(vowels[i], true, false, inactive));
  }
  for (int i = 0; i < 5; i++) {
    bool inactive = false;
    if (word.contains(vowels[i])) {
      inactive = true;
    }
    list.add(VowelFilter(vowels[i], false, false, inactive));
  }
  list.add(VowelFilter(' ', true, true, false));
  return list;
});
final wordEntryProvider = StateProvider<String>((ref) => '');

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

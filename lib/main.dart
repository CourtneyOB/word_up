import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:word_up/providers/round_list_provider.dart';
import 'package:word_up/screens/main_screen.dart';
import 'package:word_up/extension_methods.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

enum BoxDecor { negative, multiLetter, bonus, total }

enum VowelType { a, e, i, o, u, notA, notE, notI, notO, notU, wildcard }

final roundListProvider = StateNotifierProvider<RoundListProvider, List<Round>>(
    (ref) => RoundListProvider());
final vowelFilterDisplayProvider = Provider<List<VowelFilter>>((ref) {
  String word = ref.watch(wordEntryProvider);
  Round currentRound = ref.watch(roundListProvider).last;
  List<VowelFilter> list = [];
  for (var value in VowelType.values) {
    list.add(VowelFilter(
        value, value.toStringValue(), word.contains(value.toStringValue())));
  }
  return [];
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

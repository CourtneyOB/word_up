import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:word_up/providers/round_list_provider.dart';
import 'package:word_up/screens/create_room_screen.dart';
import 'package:word_up/screens/join_room_screen.dart';
import 'package:word_up/screens/lobby_screen.dart';
import 'package:word_up/screens/main_screen.dart';
import 'package:collection/collection.dart';
import 'package:word_up/game_data.dart';
import 'package:flutter/services.dart';
import 'package:word_up/screens/round_summary_screen.dart';
import 'package:word_up/screens/title_screen.dart';

//TODO: make custom keyboard
//TODO: reformat scorecard - +1 and total headings
//TODO: reformat scorecard - total score
//TODO: reformat scorecard - dice point values
//TODO: add dictionary

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Word up',
      theme: ThemeData(
        fontFamily: 'PassionOne',
        textSelectionTheme:
            const TextSelectionThemeData(selectionHandleColor: kBorderColour),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TitleScreen(),
        '/game': (context) => const MainScreen(),
        '/create_room': (context) => const CreateRoomScreen(),
        '/join_room': (context) => const JoinRoomScreen(),
        '/lobby': (context) => const LobbyScreen(),
        '/round_summary': (context) => const RoundSummaryScreen(),
      },
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
  List<Round> rounds = ref.watch(roundListProvider);
  return filterVowels(word, rounds);
});
final wordEntryProvider = StateProvider<String>((ref) => '');
final selectedVowelProvider = StateProvider<VowelCategory?>((ref) => null);
final nicknameProvider = StateProvider<String>((ref) => '');

List<VowelFilter> filterVowels(String word, List<Round> rounds) {
  List<VowelFilter> list = [];

  for (var value in VowelCategory.values) {
    bool inactive = false;
    //filter according to entered word
    if (value.isPositive() && value != VowelCategory.wildcard) {
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
    //filter according to if a vowel type has already been used
    if (rounds.firstWhereOrNull((element) => element.vowelType == value) !=
        null) {
      inactive = true;
    }
    list.add(VowelFilter(type: value, inactive: inactive));
  }
  return list;
}

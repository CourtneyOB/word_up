import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/data_provider.dart';
import 'package:word_up/screens/main_screen.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

enum BoxDecor { negative, multiLetter, bonus, total }

final dataProvider =
    StateNotifierProvider<DataProvider, List<Round>>((ref) => DataProvider());

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

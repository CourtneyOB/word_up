import 'package:flutter/material.dart';
import 'package:word_up/model/current_game.dart';
import 'package:word_up/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/data_provider.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

final dataProvider = StateNotifierProvider<DataProvider, CurrentGame>(
    (ref) => DataProvider(CurrentGame()));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Word up',
      home: HomeScreen(),
    );
  }
}

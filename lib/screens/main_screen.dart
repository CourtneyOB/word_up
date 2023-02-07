import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/bottom_bar.dart';
import 'package:word_up/widgets/dice_display.dart';
import 'package:word_up/widgets/letter_box_row.dart';
import 'package:word_up/widgets/top_bar.dart';
import 'package:word_up/widgets/vowel_display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBorderColour,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: kBackgroundColour),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TopBar(),
                  DiceDisplay(),
                  VowelDisplay(),
                  LetterBoxRow(),
                  BottomBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

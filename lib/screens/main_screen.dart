import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/bottom_bar.dart';
import 'package:word_up/widgets/dice_display.dart';
import 'package:word_up/widgets/custom_text_field/single_character_text_field.dart';
import 'package:word_up/widgets/top_bar.dart';
import 'package:word_up/widgets/vowel_display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBorderColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: kBackgroundColour),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TopBar(),
                  Column(
                    children: const [
                      DiceDisplay(),
                      VowelDisplay(),
                      SingleCharacterTextField(),
                      BottomBar(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

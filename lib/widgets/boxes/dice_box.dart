import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:word_up/main.dart';

class DiceBox extends StatelessWidget {
  const DiceBox({
    Key? key,
    this.foreground = Colors.white,
    this.letter = '',
  }) : super(key: key);

  final Color foreground;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: foreground,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: AutoSizeText(
                letter,
                style: kTitleFont,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

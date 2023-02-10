import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/letter_box.dart';

class ScoreCardRow extends StatelessWidget {
  const ScoreCardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        if (index > 3) {
          if (index == 6) {
            return const LetterBox(
              width: kScoreCardBoxWidth,
              decor: BoxDecor.total,
            );
          }
          return const LetterBox(
            width: kScoreCardBoxWidth,
            decor: BoxDecor.bonus,
          );
        }
        return const LetterBox(
          width: kScoreCardBoxWidth,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/letter_box.dart';

class ScoreCardRow extends StatelessWidget {
  const ScoreCardRow({Key? key, this.word = '', this.score = ' '})
      : super(key: key);

  final String word;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        String content = ' ';
        if (word.length > index) {
          content = word[index];
        }
        if (index > 3) {
          if (index == 6) {
            return LetterBox(
              width: kScoreCardBoxWidth,
              decor: BoxDecor.total,
              letter: score,
            );
          }
          return LetterBox(
            width: kScoreCardBoxWidth,
            decor: BoxDecor.bonus,
            letter: content,
          );
        }
        return LetterBox(
          width: kScoreCardBoxWidth,
          letter: content,
        );
      }),
    );
  }
}

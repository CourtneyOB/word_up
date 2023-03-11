import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';

class ScoreCardRow extends StatelessWidget {
  const ScoreCardRow(
      {Key? key,
      this.word = '',
      this.score = ' ',
      this.boxSize = kScoreCardBoxWidth})
      : super(key: key);

  final String word;
  final String score;
  final double boxSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        String content = ' ';
        if (word.length > index) {
          content = word[index];
        }
        if (index == 6) {
          content = score;
        }
        return LetterBox(
          width: boxSize,
          letter: content,
        );
      }),
    );
  }
}

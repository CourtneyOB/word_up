import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/letter_box.dart';

class ScoreCardRow extends StatelessWidget {
  const ScoreCardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        return LetterBox(
          width: kScoreCardBoxWidth,
          letter: ' ',
        );
      }),
    );
  }
}

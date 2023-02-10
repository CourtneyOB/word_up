import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/letter_box.dart';
import 'package:word_up/main.dart';

class VowelDisplay extends StatelessWidget {
  const VowelDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: const [
            LetterBox(
              width: kVowelBoxWidth,
              letter: 'A',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              letter: 'E',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              letter: 'I',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              letter: 'O',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              letter: 'U',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.negative,
              letter: 'A',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.negative,
              letter: 'E',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.negative,
              letter: 'I',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.negative,
              letter: 'O',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.negative,
              letter: 'U',
            ),
            LetterBox(
              width: kVowelBoxWidth,
              decor: BoxDecor.multiLetter,
            ),
          ],
        ));
  }
}

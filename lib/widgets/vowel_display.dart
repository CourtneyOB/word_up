import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/vowel_box.dart';

class VowelDisplay extends StatelessWidget {
  const VowelDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: const [
            VowelBox(
              width: kVowelBoxWidth,
              letter: 'A',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              letter: 'E',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              letter: 'I',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              letter: 'O',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              letter: 'U',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              negative: true,
              letter: 'A',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              negative: true,
              letter: 'E',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              negative: true,
              letter: 'I',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              negative: true,
              letter: 'O',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              negative: true,
              letter: 'U',
            ),
            VowelBox(
              width: kVowelBoxWidth,
              multi: true,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
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
              letter: 'A',
            ),
            VowelBox(
              letter: 'E',
            ),
            VowelBox(
              letter: 'I',
            ),
            VowelBox(
              letter: 'O',
            ),
            VowelBox(
              letter: 'U',
            ),
            VowelBox(
              negative: true,
              letter: 'A',
            ),
            VowelBox(
              negative: true,
              letter: 'E',
            ),
            VowelBox(
              negative: true,
              letter: 'I',
            ),
            VowelBox(
              negative: true,
              letter: 'O',
            ),
            VowelBox(
              negative: true,
              letter: 'U',
            ),
            VowelBox(
              multi: true,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/constants.dart';

class PointsKey extends StatelessWidget {
  const PointsKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Points'),
        Row(
          children: const [
            LetterBox(
              width: 35.0,
              letter: '1',
            ),
            LetterBox(
              width: 35.0,
              colour: kYellowDiceColour,
              letter: '2',
            ),
            LetterBox(
              width: 35.0,
              colour: kOrangeDiceColour,
              letter: '3',
            ),
          ],
        )
      ],
    );
  }
}

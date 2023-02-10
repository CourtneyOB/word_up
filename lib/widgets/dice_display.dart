import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/stateless_boxes/letter_box.dart';

class DiceDisplay extends StatelessWidget {
  const DiceDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: BackingContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: const [
                LetterBox(
                  width: kDiceBoxWidth,
                  letter: 'N',
                ),
                LetterBox(
                  width: kDiceBoxWidth,
                  letter: 'T',
                ),
                LetterBox(
                  width: kDiceBoxWidth,
                  letter: 'D',
                ),
                LetterBox(
                  width: kDiceBoxWidth,
                  letter: 'P',
                ),
                LetterBox(
                  width: kDiceBoxWidth,
                  colour: kYellowDiceColour,
                  letter: 'F',
                ),
                LetterBox(
                  width: kDiceBoxWidth,
                  colour: kOrangeDiceColour,
                  letter: 'Z',
                ),
              ],
            ),
          ),
        ));
  }
}

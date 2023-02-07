import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/dice_box.dart';

class DiceDisplay extends StatelessWidget {
  const DiceDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
            color: kBorderColour,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: const [
                DiceBox(
                  letter: 'N',
                ),
                DiceBox(
                  letter: 'T',
                ),
                DiceBox(
                  letter: 'D',
                ),
                DiceBox(
                  letter: 'P',
                ),
                DiceBox(
                  foreground: Colors.yellow,
                  letter: 'F',
                ),
                DiceBox(
                  foreground: Colors.orange,
                  letter: 'Z',
                ),
              ],
            ),
          ),
        ));
  }
}

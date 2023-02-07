import 'package:flutter/material.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/boxes/dice_box.dart';

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
                  color: Colors.yellow,
                  letter: 'F',
                ),
                DiceBox(
                  color: Colors.orange,
                  letter: 'Z',
                ),
              ],
            ),
          ),
        ));
  }
}

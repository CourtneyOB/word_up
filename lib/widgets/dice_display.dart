import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/letter_box.dart';

class DiceDisplay extends ConsumerWidget {
  const DiceDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: BackingContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(6, (index) {
                if (ref.watch(dataProvider).isNotEmpty) {
                  int score =
                      ref.watch(dataProvider).last.diceRoll[index].score;
                  return LetterBox(
                    width: kDiceBoxWidth,
                    letter: ref.watch(dataProvider).last.diceRoll[index].letter,
                    colour: score == 1
                        ? Colors.white
                        : score == 2
                            ? kYellowDiceColour
                            : kOrangeDiceColour,
                  );
                }
                return LetterBox(
                  width: kDiceBoxWidth,
                  letter: ' ',
                  colour: index < 4
                      ? Colors.white
                      : index < 5
                          ? kYellowDiceColour
                          : kOrangeDiceColour,
                );
              }),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/main.dart';

class VowelDisplay extends StatefulWidget {
  const VowelDisplay({Key? key}) : super(key: key);

  @override
  State<VowelDisplay> createState() => _VowelDisplayState();
}

class _VowelDisplayState extends State<VowelDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(11, (index) {
            BoxDecor? decor;
            List<String> letters = [
              'A',
              'E',
              'I',
              'O',
              'U',
              'A',
              'E',
              'I',
              'O',
              'U',
              ''
            ];
            if (index > 4) {
              if (index == 10) {
                decor = BoxDecor.multiLetter;
              } else {
                decor = BoxDecor.negative;
              }
            }
            return LetterBox(
              width: kVowelBoxWidth,
              letter: letters[index],
              decor: decor,
              validate: true,
            );
          }),
        ));
  }
}

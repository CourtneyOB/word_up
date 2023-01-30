import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';

class LetterBoxRow extends StatelessWidget {
  const LetterBoxRow({Key? key, this.sideBarLetter}) : super(key: key);

  final String? sideBarLetter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          LetterBox(
            foreground: kBackgroundColour,
            letter: sideBarLetter != null ? sideBarLetter! : '',
            multiLetter: sideBarLetter == null ? true : false,
          ),
          const LetterBox(),
          const LetterBox(),
          const LetterBox(),
          const LetterBox(),
          const LetterBox(
            bonus: true,
          ),
          const LetterBox(
            total: true,
          ),
        ],
      ),
    );
  }
}

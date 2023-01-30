import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';

class LetterBoxRow extends StatelessWidget {
  const LetterBoxRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          LetterBox(
            background: kSidebarColour,
            foreground: kBackgroundColour,
          ),
          LetterBox(),
          LetterBox(),
          LetterBox(),
          LetterBox(),
          LetterBox(),
          LetterBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/boxes/letter_box.dart';

class LetterBoxRow extends StatelessWidget {
  const LetterBoxRow({Key? key, this.sideBarLetter}) : super(key: key);

  final String? sideBarLetter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BackingContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LetterBox(),
                LetterBox(),
                LetterBox(),
                LetterBox(),
                LetterBox(
                  bonus: true,
                ),
                LetterBox(
                  bonus: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

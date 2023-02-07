import 'package:flutter/material.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/boxes/letter_box.dart';

class LetterBoxRow extends StatelessWidget {
  const LetterBoxRow({Key? key, this.sideBarLetter}) : super(key: key);

  final String? sideBarLetter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackingContainer(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
        ],
      ),
    );
  }
}

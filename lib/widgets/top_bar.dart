import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          const Expanded(
            flex: 6,
            child: AutoSizeText(
              'WORD UP',
              style: kTitleFont,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

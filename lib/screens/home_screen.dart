import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/letter_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            width: screenWidth(context) * 0.2,
            color: kSidebarColour,
            child: Column(
              children: [],
            ),
          ),
          Expanded(
            child: Container(
              color: kBackgroundColour,
              child: Column(
                children: [
                  const Text(
                    'Word up',
                    style: kTitleFont,
                  ),
                  Row(
                    children: const [
                      LetterBox(),
                    ],
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

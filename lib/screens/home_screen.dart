import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/bottom_bar.dart';
import 'package:word_up/widgets/letter_box_row.dart';
import 'package:word_up/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: screenWidth(context) * (1 / 7),
                  color: kSidebarColour,
                ),
                Expanded(
                  child: Container(
                    color: kBackgroundColour,
                  ),
                )
              ],
            ),
            Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Column(
                    children: const [
                      LetterBoxRow(
                        sideBarLetter: 'A',
                      ),
                      LetterBoxRow(
                        sideBarLetter: 'E',
                      ),
                      LetterBoxRow(
                        sideBarLetter: 'I',
                      ),
                      LetterBoxRow(
                        sideBarLetter: 'O',
                      ),
                      LetterBoxRow(
                        sideBarLetter: 'U',
                      ),
                      LetterBoxRow(),
                      LetterBoxRow(),
                      LetterBoxRow(),
                    ],
                  ),
                ),
                const BottomBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

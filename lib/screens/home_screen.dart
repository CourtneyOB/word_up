import 'package:flutter/material.dart';
import 'package:word_up/widgets/bottom_bar.dart';
import 'package:word_up/widgets/letter_box_row.dart';
import 'package:word_up/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopBar(),
            Expanded(
              child: Column(
                children: const [
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                  LetterBoxRow(),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}

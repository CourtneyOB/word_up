import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/custom_alert_dialog.dart';
import 'package:word_up/widgets/how_to_play/custom_pageview_page.dart';
import 'package:word_up/widgets/how_to_play/pageview_title.dart';

class HowToPlayAlertDialog extends StatefulWidget {
  const HowToPlayAlertDialog({Key? key}) : super(key: key);

  @override
  _HowToPlayAlertDialogState createState() => _HowToPlayAlertDialogState();
}

class _HowToPlayAlertDialogState extends State<HowToPlayAlertDialog> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
        title: 'How to play',
        actionButton: false,
        content: SizedBox(
          height: screenHeight(context) * 0.5,
          width: screenWidth(context) * 0.7,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomPageViewPage(
                  controller: _pageController,
                  content: Column(
                    children: const [
                      PageViewTitle(text: 'Objective'),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'To create words using the rolled consonants and score the most points.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      PageViewTitle(text: 'Gameplay'),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Each turn, a player rolls all 6 dice. Using the rolled consonants, all players try to make up a word by adding as many vowels as they wish, using 1 or more of the dice. Each player adds their word to one of 11 unique word rows, each with its own vowel restriction.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        '1. Can’t use the A vowel\n'
                        '2. Can’t use the E vowel',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  hasNext: true,
                  hasPrevious: false),
              CustomPageViewPage(
                  controller: _pageController,
                  content: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '3. Can’t use the I vowel\n'
                          '4. Can’t use the O vowel\n'
                          '5. Can’t use the U vowel\n'
                          '6. Can only use the A vowel\n'
                          '7. Can only use the E vowel\n'
                          '8. Can only use the I vowel\n'
                          '9. Can only use the O vowel\n'
                          '10. Can only use the U vowel\n'
                          '11. Can use any vowels they want\n',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Players do not have to use the rows in order and can place any word in a free/unused matching row. The game is played for 11 turns.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  hasNext: true,
                  hasPrevious: true),
              CustomPageViewPage(
                  controller: _pageController,
                  content: Column(
                    children: const [
                      PageViewTitle(text: 'Scoring'),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'At the end of the game, players add up their points:',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '1 point for each white consonant dice used\n'
                          '2 points for each yellow consonant dice used\n'
                          '3 points for each orange consonant dice used\n'
                          '1 bonus point for each letter longer than a 5 letter word.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'The player with the most points at the end of the game wins.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  hasNext: false,
                  hasPrevious: true),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

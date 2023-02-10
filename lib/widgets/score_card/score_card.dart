import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';
import 'package:word_up/widgets/letter_box.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.85,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'SCORECARD',
                style: TextStyle(fontSize: 40.0),
              ),
              IntrinsicHeight(
                //Vertical divider won't show unless wrapped in intrinsic height
                child: Row(
                  children: [
                    Column(children: const [
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: 'A',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: 'E',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: 'I',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: 'O',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: 'U',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.negative,
                        letter: 'A',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.negative,
                        letter: 'E',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.negative,
                        letter: 'I',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.negative,
                        letter: 'O',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.negative,
                        letter: 'U',
                      ),
                      LetterBox(
                        width: kScoreCardBoxWidth,
                        decor: BoxDecor.multiLetter,
                      ),
                    ]),
                    const VerticalDivider(
                      color: kBorderColour,
                      thickness: 2.0,
                      indent: 5.0,
                    ),
                    Column(
                      children: List.generate(11, (index) {
                        return const ScoreCardRow();
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

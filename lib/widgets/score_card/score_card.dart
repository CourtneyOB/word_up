import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';
import 'package:word_up/widgets/stateless_boxes/vowel_box.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.85,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('SCORECARD'),
              IntrinsicHeight(
                //Vertical divider won't show unless wrapped in intrinsic height
                child: Row(
                  children: [
                    Column(children: const [
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        letter: 'A',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        letter: 'E',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        letter: 'I',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        letter: 'O',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        letter: 'U',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        negative: true,
                        letter: 'A',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        negative: true,
                        letter: 'E',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        negative: true,
                        letter: 'I',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        negative: true,
                        letter: 'O',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        negative: true,
                        letter: 'U',
                      ),
                      VowelBox(
                        width: kScoreCardBoxWidth,
                        multi: true,
                      ),
                    ]),
                    const VerticalDivider(
                      color: kBorderColour,
                      thickness: 2.0,
                      indent: 5.0,
                    ),
                    Column(
                      children: List.generate(11, (index) {
                        return ScoreCardRow();
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

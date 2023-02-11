import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:collection/collection.dart';

class ScoreCard extends ConsumerWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    Column(
                        children: ref
                            .watch(vowelFilterDisplayProvider)
                            .map((vowelFilter) {
                      BoxDecor? decor;
                      if (!vowelFilter.type.isPositive()) {
                        decor = BoxDecor.negative;
                      }
                      if (vowelFilter.type == VowelType.wildcard) {
                        decor = BoxDecor.multiLetter;
                      }
                      return LetterBox(
                        width: kScoreCardBoxWidth,
                        letter: vowelFilter.type.stringValue(),
                        decor: decor,
                      );
                    }).toList()),
                    const VerticalDivider(
                      color: kBorderColour,
                      thickness: 2.0,
                      indent: 5.0,
                    ),
                    Column(
                      children: List.generate(11, (index) {
                        //if there has been a word submitted for that vowel type, find it in round list
                        Round? round = ref
                            .read(roundListProvider)
                            .firstWhereOrNull((element) =>
                                element.vowelType ==
                                ref
                                    .read(vowelFilterDisplayProvider)[index]
                                    .type);
                        return ScoreCardRow(
                          word: round == null ? '' : round.entry,
                        );
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

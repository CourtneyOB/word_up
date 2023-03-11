import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:word_up/widgets/score_card/score_card_headers.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';

class RoundScoresList extends ConsumerWidget {
  const RoundScoresList({Key? key, required this.roundNumber})
      : super(key: key);

  final int roundNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            'Round $roundNumber',
            style: kTitleFont,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(ref.read(nicknameProvider)),
              const ScoreCardHeaders(boxWidth: kSummaryScoreCardBoxWidth),
              IntrinsicHeight(
                child: Row(
                  children: [
                    LetterBox(
                      width: kSummaryScoreCardBoxWidth,
                      letter: ref
                          .read(roundListProvider)[roundNumber - 1]
                          .vowelType!
                          .stringValue(),
                      decor: ref
                                  .read(roundListProvider)[roundNumber - 1]
                                  .vowelType! ==
                              VowelCategory.wildcard
                          ? BoxDecor.multiLetter
                          : ref
                                  .read(roundListProvider)[roundNumber - 1]
                                  .vowelType!
                                  .isPositive()
                              ? null
                              : BoxDecor.negative,
                    ),
                    const VerticalDivider(
                      color: kBorderColour,
                      thickness: 2.0,
                      indent: 5.0,
                    ),
                    Expanded(
                      child: ScoreCardRow(
                        word:
                            ref.read(roundListProvider)[roundNumber - 1].entry,
                        boxSize: kSummaryScoreCardBoxWidth,
                        score:
                            '${ref.read(roundListProvider)[roundNumber - 1].score}',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

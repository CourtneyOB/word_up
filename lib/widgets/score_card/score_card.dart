import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/model/round.dart';
import 'package:word_up/widgets/points_key.dart';
import 'package:word_up/widgets/score_card/score_card_headers.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/model/vowel_filter.dart';
import 'package:collection/collection.dart';

class ScoreCard extends ConsumerWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ScoreCardRow> _rows = List.generate(11, (index) {
      //if there has been a word submitted for that vowel type, find it in round list
      Round? round = ref.read(roundListProvider).firstWhereOrNull((element) =>
          element.vowelType ==
          ref.read(vowelFilterDisplayProvider)[index].type);
      return ScoreCardRow(
        word: round == null ? '' : round.entry,
        score: round == null ? ' ' : round.score.toString(),
      );
    });
    List<LetterBox> _vowelBoxes =
        ref.watch(vowelFilterDisplayProvider).map((vowelFilter) {
      BoxDecor? decor;
      if (!vowelFilter.type.isPositive()) {
        decor = BoxDecor.negative;
      }
      if (vowelFilter.type == VowelCategory.wildcard) {
        decor = BoxDecor.multiLetter;
      }
      return LetterBox(
        width: kScoreCardBoxWidth,
        letter: vowelFilter.type.stringValue(),
        decor: decor,
      );
    }).toList();

    return SizedBox(
      height: screenHeight(context) * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: PointsKey(),
                ),
                Text(
                  'SCORECARD',
                  style: TextStyle(fontSize: 40.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const ScoreCardHeaders(
              boxWidth: kScoreCardBoxWidth,
            ),
            Row(
              children: [
                Column(children: [..._vowelBoxes]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 1,
                    height: screenHeight(context) * 0.7,
                    color: kBorderColour,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [..._rows],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

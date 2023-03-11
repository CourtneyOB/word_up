import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/round_summary/final_scores_list.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/widgets/round_summary/round_scores_list.dart';
import 'package:word_up/widgets/score_card/score_card_row.dart';
import 'package:word_up/widgets/styled_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/model/vowel_filter.dart';

class RoundSummaryScreen extends ConsumerWidget {
  const RoundSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int roundNumber = ref.watch(roundListProvider).length - 1;
    return Scaffold(
      backgroundColor: kBorderColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: kBackgroundColour),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (roundNumber < 11)
                    Expanded(child: RoundScoresList(roundNumber: roundNumber)),
                  if (roundNumber == 11)
                    const Expanded(child: FinalScoresList()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StyledButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          text: 'Leave'),
                      if (roundNumber < 11)
                        StyledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: 'Next round'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

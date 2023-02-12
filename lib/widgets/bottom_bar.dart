import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/score_card/score_card.dart';
import 'package:word_up/widgets/styled_button.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: StyledButton(
            text: 'SCORECARD',
            onPressed: () {
              showScorecard(context);
            },
          ),
        ),
      ],
    );
  }

  showScorecard(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        backgroundColor: kBackgroundColour,
        builder: (context) {
          return const ScoreCard();
        });
  }
}

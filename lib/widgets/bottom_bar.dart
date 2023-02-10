import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/score_card/score_card.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kBorderColour),
            onPressed: () => _showScorecard(context),
            child: const Text(
              'SCORECARD',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kBorderColour),
            onPressed: () {
              ref.read(dataProvider.notifier).newRound();
            },
            child: const Text(
              'ROLL',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  _showScorecard(context) {
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

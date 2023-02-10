import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/score_card/score_card.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: kBorderColour),
          onPressed: () => _showScorecard(context),
          child: const Text(
            'SCORECARD',
            style: TextStyle(color: Colors.white),
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

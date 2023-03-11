import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/letter_box.dart';

class FinalScoresList extends ConsumerWidget {
  const FinalScoresList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int score = 0;

    ref.read(roundListProvider).forEach((element) {
      score = score + element.score;
    });

    return Column(
      children: [
        const FittedBox(
          child: Text(
            'Final Scores',
            style: kTitleFont,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(ref.read(nicknameProvider)),
              Text('Score: $score'),
            ],
          ),
        ),
      ],
    );
  }
}

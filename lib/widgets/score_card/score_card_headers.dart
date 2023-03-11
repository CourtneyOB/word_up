import 'package:flutter/material.dart';

class ScoreCardHeaders extends StatelessWidget {
  const ScoreCardHeaders({Key? key, required this.boxWidth}) : super(key: key);

  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: boxWidth,
          child: const Text(
            '+1',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: boxWidth,
          child: const Text(
            '+1',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: boxWidth,
          child: const Text(
            'SCORE',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

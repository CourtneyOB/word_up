import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:word_up/widgets/boxes/box_backing.dart';

class DiceBox extends StatelessWidget {
  const DiceBox({
    Key? key,
    this.color = Colors.white,
    this.letter = '',
  }) : super(key: key);

  final Color color;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: 70,
      color: color,
      child: Center(
        child: AutoSizeText(
          letter,
          style: kTitleFont,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/box_backing.dart';

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
      width: kDiceBoxWidth,
      color: color,
      child: Center(
        child: FittedBox(
          child: Text(
            letter,
            style: kTitleFont,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/box_backing.dart';

class VowelBox extends StatelessWidget {
  const VowelBox({
    Key? key,
    this.letter = '',
    this.negative = false,
    this.multi = false,
  }) : super(key: key);

  final String letter;
  final bool negative;
  final bool multi;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: kVowelBoxWidth,
      child: multi
          ? Stack(
              children: const [
                Align(
                  alignment: Alignment(0, -0.8),
                  child: Text('A'),
                ),
                Align(
                  alignment: Alignment(0.65, -0.25),
                  child: Text('E'),
                ),
                Align(
                  alignment: Alignment(0.4, 0.65),
                  child: Text('I'),
                ),
                Align(
                  alignment: Alignment(-0.4, 0.65),
                  child: Text('O'),
                ),
                Align(
                  alignment: Alignment(-0.65, -0.25),
                  child: Text('U'),
                ),
              ],
            )
          : Stack(children: [
              Center(
                child: FittedBox(
                  child: Text(
                    letter,
                    style: kTitleFont,
                  ),
                ),
              ),
              if (negative) const Image(image: AssetImage(kCrossImage)),
            ]),
    );
  }
}

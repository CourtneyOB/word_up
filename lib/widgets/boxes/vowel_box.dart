import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:word_up/widgets/boxes/box_backing.dart';

class VowelBox extends StatelessWidget {
  const VowelBox({
    Key? key,
    this.letter = '',
    this.negative = false,
    this.multi = false,
  }) : super(key: key);

  final String letter;
  //TODO: make mutually exclusive
  final bool negative;
  final bool multi;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: 80,
      child: Stack(children: [
        multi
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
            : Center(
                child: AutoSizeText(
                  letter,
                  style: kTitleFont,
                ),
              ),
        if (negative) const Image(image: AssetImage(kCrossImage)),
      ]),
    );
  }
}

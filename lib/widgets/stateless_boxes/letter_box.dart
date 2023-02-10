import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/stateless_boxes/box_backing.dart';
import 'package:word_up/main.dart';

class LetterBox extends StatelessWidget {
  const LetterBox({
    Key? key,
    required this.width,
    this.letter = ' ',
    this.colour = Colors.white,
    this.decor,
  }) : super(key: key);

  final double width;
  final String letter;
  final Color colour;
  final BoxDecor? decor;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: width,
      color: colour,
      child: decor == BoxDecor.multiLetter
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
              if (decor == BoxDecor.negative)
                const Image(image: AssetImage(kCrossImage)),
              //TODO: paddings need to be responsive to box size
              if (decor == BoxDecor.bonus)
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 8.0),
                  child: FittedBox(
                    child: Text(
                      '+1',
                      textAlign: TextAlign.right,
                      style: kTitleFont,
                      maxLines: 1,
                    ),
                  ),
                ),
              if (decor == BoxDecor.total)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: FittedBox(
                    child: Text(
                      'TOTAL',
                      textAlign: TextAlign.right,
                      style: kTitleFont,
                      maxLines: 1,
                    ),
                  ),
                ),
            ]),
    );
  }
}

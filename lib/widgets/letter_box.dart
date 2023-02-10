import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/box_backing.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/vowel_wheel.dart';

class LetterBox extends StatefulWidget {
  const LetterBox({
    Key? key,
    required this.width,
    this.letter = ' ',
    this.colour = Colors.white,
    this.decor,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final String letter;
  final Color colour;
  final BoxDecor? decor;
  final VoidCallback? onPressed;

  @override
  State<LetterBox> createState() => _LetterBoxState();
}

class _LetterBoxState extends State<LetterBox> {
  bool inactive = false;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: widget.width,
      color: widget.colour,
      child: Stack(
        children: [
          if (inactive)
            Container(
              //overlay for greying out
              decoration: const BoxDecoration(
                color: kGreyedOutColour,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          Container(
            child: widget.decor == BoxDecor.multiLetter
                ? const VowelWheel()
                : Stack(children: [
                    Center(
                      child: FittedBox(
                        child: Text(
                          widget.letter,
                          style: kTitleFont,
                        ),
                      ),
                    ),
                    if (widget.decor == BoxDecor.negative)
                      const Image(image: AssetImage(kCrossImage)),
                    //TODO: paddings need to be responsive to box size
                    if (widget.decor == BoxDecor.bonus)
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
                    if (widget.decor == BoxDecor.total)
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
          )
        ],
      ),
    );
  }
}

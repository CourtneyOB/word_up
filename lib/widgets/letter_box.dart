import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/box_backing.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/vowel_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LetterBox extends ConsumerStatefulWidget {
  const LetterBox(
      {Key? key,
      required this.width,
      this.letter = ' ',
      this.colour = Colors.white,
      this.decor,
      this.onPressed,
      this.validate = false})
      : super(key: key);

  final double width;
  final String letter;
  final Color colour;
  final BoxDecor? decor;
  final bool validate;
  final VoidCallback? onPressed;

  @override
  ConsumerState<LetterBox> createState() => _LetterBoxState();
}

class _LetterBoxState extends ConsumerState<LetterBox> {
  @override
  Widget build(BuildContext context) {
    bool inactive = false;
    if (widget.validate) {
      if (ref.watch(dataProvider).isNotEmpty) {
        inactive = ref.watch(dataProvider).last.entry.contains(widget.letter);
      }
    }
    return BoxBacking(
      width: widget.width,
      color: widget.colour,
      child: Stack(
        children: [
          if (inactive && widget.decor != BoxDecor.multiLetter)
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

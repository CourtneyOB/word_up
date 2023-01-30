import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';

class LetterBox extends StatelessWidget {
  const LetterBox(
      {Key? key,
      this.background = kBackgroundColour,
      this.foreground = Colors.white})
      : super(key: key);

  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: foreground,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

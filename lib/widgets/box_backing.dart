import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';

class BoxBacking extends StatelessWidget {
  const BoxBacking(
      {Key? key,
      required this.width,
      this.padding = 3.0,
      this.colour = Colors.white,
      this.border = false,
      this.child})
      : super(key: key);

  final double width;
  final double padding;
  final Color colour;
  final bool border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: colour,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: border
                    ? Border.all(color: kHighlightColour, width: 2.0)
                    : null),
            child: child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BoxBacking extends StatelessWidget {
  const BoxBacking(
      {Key? key,
      required this.width,
      this.padding = 3.0,
      this.color = Colors.white,
      this.child})
      : super(key: key);

  final double width;
  final double padding;
  final Color color;
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
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: child,
          ),
        ),
      ),
    );
  }
}

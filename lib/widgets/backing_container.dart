import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';

class BackingContainer extends StatelessWidget {
  const BackingContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: kBorderColour),
      child: child,
    );
  }
}

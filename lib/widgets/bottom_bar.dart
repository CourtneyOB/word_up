import 'package:flutter/material.dart';
import 'package:word_up/main.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.05,
    );
  }
}

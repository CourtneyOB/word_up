import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/styled_button.dart';

class CustomPageViewPage extends StatelessWidget {
  const CustomPageViewPage(
      {Key? key,
      required this.controller,
      required this.content,
      required this.hasNext,
      required this.hasPrevious})
      : super(key: key);

  final PageController controller;
  final bool hasNext;
  final bool hasPrevious;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: content,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (hasPrevious)
              StyledButton(
                  onPressed: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                  text: 'Previous'),
            if (hasNext)
              StyledButton(
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                  text: 'Next'),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';

class PageViewTitle extends StatelessWidget {
  const PageViewTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: kBoldTextFont,
      ),
    );
  }
}

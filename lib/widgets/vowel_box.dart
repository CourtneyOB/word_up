import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:word_up/main.dart';

class VowelBox extends StatelessWidget {
  const VowelBox({
    Key? key,
    this.foreground = Colors.white,
    this.letter = '',
    this.negative = false,
    this.multi = false,
  }) : super(key: key);

  final Color foreground;
  final String letter;
  final bool negative;
  final bool multi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.16,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: foreground,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: multi
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
                  : Center(
                      child: AutoSizeText(
                        letter,
                        style: kTitleFont,
                      ),
                    ),
            ),
          ),
          if (negative) const Image(image: AssetImage(kCrossImage)),
        ]),
      ),
    );
  }
}

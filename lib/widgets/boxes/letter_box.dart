import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LetterBox extends StatelessWidget {
  const LetterBox(
      {Key? key,
      this.foreground = Colors.white,
      this.letter = '',
      this.multiLetter = false,
      this.total = false,
      this.bonus = false})
      : super(key: key);

  final Color foreground;
  final String letter;
  final bool multiLetter;
  final bool total;
  final bool bonus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: foreground,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: total
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: AutoSizeText(
                        'TOTAL',
                        textAlign: TextAlign.center,
                        style: kTitleFont,
                        maxLines: 1,
                      ),
                    )
                  : bonus
                      ? const Padding(
                          padding: EdgeInsets.only(left: 24.0, right: 8.0),
                          child: AutoSizeText(
                            '+1',
                            textAlign: TextAlign.right,
                            style: kTitleFont,
                            maxLines: 1,
                          ),
                        )
                      : multiLetter
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
        ),
      ),
    );
  }
}

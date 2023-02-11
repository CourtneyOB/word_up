import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/main.dart';

class VowelDisplay extends ConsumerStatefulWidget {
  const VowelDisplay({Key? key}) : super(key: key);

  @override
  ConsumerState<VowelDisplay> createState() => _VowelDisplayState();
}

class _VowelDisplayState extends ConsumerState<VowelDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: ref.watch(vowelFilterDisplayProvider).map((vowelFilter) {
            BoxDecor? decor;
            if (!vowelFilter.isPositive) {
              decor = BoxDecor.negative;
            }
            if (vowelFilter.isWildcard) {
              decor = BoxDecor.multiLetter;
            }
            return LetterBox(
              width: kVowelBoxWidth,
              letter: vowelFilter.value,
              decor: decor,
              inactive: vowelFilter.inactive,
            );
          }).toList(),
        ));
  }
}

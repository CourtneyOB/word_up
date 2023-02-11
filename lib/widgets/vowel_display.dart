import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/extension_methods.dart';
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
            return LetterBox(
              width: kVowelBoxWidth,
              letter: vowelFilter.vowelType.toStringValue(),
              decor: vowelFilter.vowelType.toBoxDecor(),
              inactive: vowelFilter.inactive,
            );
          }).toList(),
        ));
  }
}

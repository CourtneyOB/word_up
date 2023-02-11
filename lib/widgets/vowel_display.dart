import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/main.dart';
import 'package:word_up/model/vowel_filter.dart';

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
            bool inactive = false;
            bool isSelected = false;
            if (!vowelFilter.type.isPositive()) {
              decor = BoxDecor.negative;
            }
            if (vowelFilter.type == VowelType.wildcard) {
              decor = BoxDecor.multiLetter;
            }
            if (vowelFilter.roundNumberUsed > 0 || vowelFilter.inactive) {
              inactive = true;
            }
            if (ref.watch(selectedVowelProvider) == vowelFilter.type) {
              isSelected = true;
            }
            return LetterBox(
              width: kVowelBoxWidth,
              letter: vowelFilter.type.stringValue(),
              decor: decor,
              inactive: inactive,
              isSelected: isSelected,
              onPressed: () {
                ref.read(selectedVowelProvider.notifier).state =
                    vowelFilter.type;
              },
            );
          }).toList(),
        ));
  }
}

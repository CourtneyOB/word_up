import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';

class TopBar extends ConsumerWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight(context) * 0.1,
            child: const FittedBox(
              child: Text(
                'WORD UP',
                style: kTitleFont,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.04,
            child: FittedBox(
              child: Text(
                'Round ${ref.watch(roundListProvider).length}',
                style: kTitleFont,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_up/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:word_up/widgets/boxes/box_backing.dart';

class LetterBox extends StatelessWidget {
  const LetterBox(
      {Key? key,
      this.letter = '',
      this.bonus = false,
      required this.controller,
      required this.focusNode,
      required this.onChanged})
      : super(key: key);

  final String letter;
  final bool bonus;

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: 55,
      padding: 2.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              maxLength: 1,
              textAlign: TextAlign.center,
              inputFormatters: [UppercaseInputFormatter()],
              style: const TextStyle(fontSize: 40),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                labelText: '',
                contentPadding: EdgeInsets.all(5.0),
              ),
              onChanged: onChanged,
            ),
          ),
          if (bonus)
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 8.0),
              child: AutoSizeText(
                '+1',
                textAlign: TextAlign.right,
                style: kTitleFont,
                maxLines: 1,
              ),
            ),
        ],
      ),
    );
  }
}

class UppercaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

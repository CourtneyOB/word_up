import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/box_backing.dart';

class TextFieldCharacterBox extends StatefulWidget {
  const TextFieldCharacterBox({
    Key? key,
    this.letter = '',
    this.bonus = false,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  final String letter;
  final bool bonus;

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  @override
  State<TextFieldCharacterBox> createState() => _TextFieldCharacterBoxState();
}

class _TextFieldCharacterBoxState extends State<TextFieldCharacterBox> {
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    //ensures cursor always at end when focused
    widget.controller.addListener(() {
      widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length));
    });
    //updates the colour when focus is on that textfield
    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BoxBacking(
      width: kTextFieldBoxWidth,
      padding: 2.0,
      colour: widget.focusNode.hasFocus ? kHighlightColour : Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              textAlign: TextAlign.center,
              showCursor: false,
              inputFormatters: [
                UppercaseInputFormatter(),
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
              ],
              style: const TextStyle(fontSize: 40),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                labelText: '',
                contentPadding: EdgeInsets.all(5.0),
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if (widget.bonus)
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 8.0),
              child: FittedBox(
                child: Text(
                  '+1',
                  textAlign: TextAlign.right,
                  style: kTitleFont,
                  maxLines: 1,
                ),
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

import 'package:flutter/material.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/boxes/letter_box.dart';

class LetterBoxRow extends StatefulWidget {
  const LetterBoxRow({Key? key, this.sideBarLetter}) : super(key: key);

  final String? sideBarLetter;

  @override
  State<LetterBoxRow> createState() => _LetterBoxRowState();
}

class _LetterBoxRowState extends State<LetterBoxRow> {
  /// zero-width space character
  ///
  /// this character can be added to a string to detect backspace.
  /// The value, from its name, has a zero-width so it's not rendered
  /// in the screen but it'll be present in the String.
  ///
  /// The main reason this value is used because in Flutter mobile,
  /// backspace is not detected when there's nothing to delete.
  /// the selection is at offset 1 so any character is inserted after it.
  final _zwspEditingValue = const TextEditingValue(
      text: '\u200b', selection: TextSelection(baseOffset: 1, extentOffset: 1));

  List<String> entry = ['', '', '', '', '', ''];
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(6, (index) => FocusNode());
    controllers = List.generate(6, (index) {
      final ctrl = TextEditingController();
      ctrl.value = _zwspEditingValue;
      return ctrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackingContainer(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  bool bonus = false;
                  if (index > 3) {
                    bonus = true;
                  }
                  return LetterBox(
                    bonus: bonus,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    onChanged: (value) {
                      if (value.length > 1) {
                        // this is a new character event
                        if (index + 1 == focusNodes.length) {
                          // do something after the last character was inserted
                          FocusScope.of(context).unfocus();
                        } else {
                          // move to the next field
                          focusNodes[index + 1].requestFocus();
                        }
                      } else {
                        // this is backspace event
                        // reset the controller
                        controllers[index].value = _zwspEditingValue;
                        if (index == 0) {
                          // do something if backspace was pressed at the first field
                          FocusScope.of(context).unfocus();
                        } else {
                          // go back to previous field
                          controllers[index - 1].value = _zwspEditingValue;
                          focusNodes[index - 1].requestFocus();
                        }
                      }
                      // make sure to remove the zwsp character
                      entry[index] = value.replaceAll('\u200b', '');
                      print('current code = $entry');
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (FocusNode focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

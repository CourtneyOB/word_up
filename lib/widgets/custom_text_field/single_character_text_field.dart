import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/custom_text_field/character_box.dart';
import 'package:word_up/widgets/letter_box.dart';
import 'package:word_up/constants.dart';

class SingleCharacterTextField extends ConsumerStatefulWidget {
  const SingleCharacterTextField({Key? key, this.sideBarLetter})
      : super(key: key);

  final String? sideBarLetter;

  @override
  ConsumerState<SingleCharacterTextField> createState() =>
      _SingleCharacterTextFieldState();
}

class _SingleCharacterTextFieldState
    extends ConsumerState<SingleCharacterTextField> {
  List<String> entry = ['', '', '', '', '', ''];
  String word = '';
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(6, (index) => FocusNode());
    controllers = List.generate(6, (index) {
      final ctrl = TextEditingController();
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
                  return CharacterBox(
                    bonus: bonus,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        // this is a new character event
                        if (value.length > 1) {
                          //overwrite the character if there's already one existing
                          controllers[index].text =
                              controllers[index].text[value.length - 1];
                        }
                        if (index + 1 == focusNodes.length) {
                          // do something after the last character was inserted
                          FocusScope.of(context).unfocus();
                        } else {
                          // move to the next field
                          focusNodes[index + 1].requestFocus();
                        }
                      } else {
                        //TODO: not triggered when backspace empty field
                        // this is backspace event
                        // reset the controller
                        controllers[index].value = TextEditingValue.empty;
                        if (index == 0) {
                          // do something if backspace was pressed at the first field
                          FocusScope.of(context).unfocus();
                        } else {
                          // go back to previous field
                          focusNodes[index - 1].requestFocus();
                        }
                      }
                      entry[index] = controllers[index].text;
                      //convert list of characters into string
                      word = '';
                      for (String character in entry) {
                        word = word + character;
                      }
                      ref.read(dataProvider.notifier).submitWord(word);
                    },
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: BackingContainer(
              child: IconButton(
                onPressed: () {
                  //submit to the game data
                  ref.read(dataProvider.notifier).submitWord(word);
                  //TODO: calculate score
                  //TODO: move this to the next round function
                  for (TextEditingController controller in controllers) {
                    controller.value = TextEditingValue.empty;
                  }
                  entry = ['', '', '', '', '', ''];
                  word = '';
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
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

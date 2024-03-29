import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/game_data.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/backing_container.dart';
import 'package:word_up/widgets/custom_text_field/text_field_character_box.dart';
import 'package:word_up/widgets/custom_alert_dialog.dart';

class SingleCharacterTextField extends ConsumerStatefulWidget {
  const SingleCharacterTextField({Key? key}) : super(key: key);

  @override
  ConsumerState<SingleCharacterTextField> createState() =>
      _SingleCharacterTextFieldState();
}

class _SingleCharacterTextFieldState
    extends ConsumerState<SingleCharacterTextField> {
  List<String> entry = ['', '', '', '', '', ''];
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
                  return TextFieldCharacterBox(
                    bonus: bonus,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    onChanged: (value) {
                      //deselect vowel
                      ref.read(selectedVowelProvider.notifier).state = null;
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
                      convertCharacters();
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
                onPressed: () async {
                  bool success = await submitWord();
                  if (success) {
                    if (mounted) {
                      Navigator.pushNamed(context, '/round_summary');
                    }
                  }
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

  void convertCharacters() {
    String word = '';
    for (String character in entry) {
      word = word + character;
    }
    ref.read(wordEntryProvider.notifier).state = word;
  }

  void unfocusAll() {
    for (FocusNode focus in focusNodes) {
      focus.unfocus();
    }
  }

  Future<bool> submitWord() async {
    //check if field is empty
    String word = ref.read(wordEntryProvider);
    if (word == '') {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomAlertDialog(
              content: Text(
                'Please enter a word',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              title: 'Oops!',
            );
          });
      return false;
    }
    //check a vowel category has been selected
    if (ref.read(selectedVowelProvider) == null) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomAlertDialog(
              content: Text(
                'Please select a vowel category to assign',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              title: 'Oops!',
            );
          });
      return false;
    }
    List<String> diceLetters =
        ref.read(roundListProvider.notifier).getDiceValues();
    List<String> unusedLetters = [...diceLetters];
    for (int i = 0; i < word.length; i++) {
      //if it's not a rolled consonant and not a vowel
      if (!unusedLetters.contains(word[i]) && !vowels.contains(word[i])) {
        //if the letter is rolled but has already been used
        if (diceLetters.contains(word[i])) {
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                    content: Text(
                      '${word[i]} has already been used',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    title: 'Oops!');
              });
          return false;
        }
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                  content: Text(
                    'Dice roll does not contain ${word[i]}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  title: 'Oops!');
            });
        return false;
      } else if (!vowels.contains(word[i])) {
        //else if it's a consonant, remove it from the dice roll list so it cannot be reused
        unusedLetters.remove(word[i]);
      }
    }
    //if passes validation, submit the word
    ref.read(roundListProvider.notifier).submitWord(
        ref.read(wordEntryProvider), ref.read(selectedVowelProvider)!);
    for (TextEditingController controller in controllers) {
      controller.value = TextEditingValue.empty;
    }
    entry = ['', '', '', '', '', ''];
    convertCharacters();
    unfocusAll();
    ref.read(selectedVowelProvider.notifier).state = null;
    ref.read(roundListProvider.notifier).newRound();
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/widgets/styled_button.dart';

class ValidationAlertDialog extends StatelessWidget {
  const ValidationAlertDialog({Key? key, required this.content})
      : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Oops!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40.0),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18.0),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 12.0),
      actions: [
        StyledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'OK',
        )
      ],
    );
  }
}

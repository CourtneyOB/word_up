import 'package:flutter/material.dart';
import 'package:word_up/widgets/styled_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      this.actionButton = true})
      : super(key: key);

  final String title;
  final Widget content;
  final bool actionButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 40.0),
      ),
      content: content,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 12.0),
      actions: [
        if (actionButton)
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

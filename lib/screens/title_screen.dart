import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/widgets/styled_button.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBorderColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: kBackgroundColour),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FittedBox(
                          child: Text(
                            'WORD UP',
                            style: kTitleFont,
                          ),
                        ),
                        StyledButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/create_room');
                            },
                            text: 'Create Room'),
                        StyledButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/join_room');
                            },
                            text: 'Join Room'),
                      ],
                    ),
                  ),
                  StyledButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                content: Text('Placeholder'),
                              );
                            });
                      },
                      text: 'How to play'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

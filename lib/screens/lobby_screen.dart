import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/styled_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LobbyScreen extends ConsumerWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  final bool isHost = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    child: Text(
                      'Room Code: XXXXX',
                      style: kTitleFont,
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Players',
                        style: TextStyle(fontSize: 24),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(ref.read(nicknameProvider)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StyledButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          text: 'Leave'),
                      if (isHost)
                        StyledButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/game');
                            },
                            text: 'Start game'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

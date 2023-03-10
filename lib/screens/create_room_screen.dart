import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/styled_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/widgets/validation_alert_dialog.dart';

class CreateRoomScreen extends ConsumerStatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends ConsumerState<CreateRoomScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBorderColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: kBackgroundColour),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                      child: Text(
                        'Create Room',
                        style: kTitleFont,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth(context) * 0.25,
                          right: screenWidth(context) * 0.25,
                          top: 30),
                      child: const FittedBox(
                        child: Text(
                          'Nickname',
                          style: kTitleFont,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _controller,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StyledButton(
                        onPressed: () async {
                          if (_controller.text.isEmpty) {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ValidationAlertDialog(
                                      content: 'Please enter a nickname');
                                });
                          } else {
                            ref.read(roundListProvider.notifier).restart();
                            ref.read(nicknameProvider.notifier).state =
                                _controller.text;
                            Navigator.pushNamed(context, '/lobby');
                          }
                        },
                        text: 'Create'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:word_up/constants.dart';
import 'package:word_up/main.dart';
import 'package:word_up/widgets/styled_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_up/widgets/custom_alert_dialog.dart';

class JoinRoomScreen extends ConsumerStatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends ConsumerState<JoinRoomScreen> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _roomCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  children: [
                    const FittedBox(
                      child: Text(
                        'Join Room',
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
                          'Room code',
                          style: kTitleFont,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _roomCodeController,
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
                      controller: _nicknameController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StyledButton(
                        onPressed: () async {
                          if (_nicknameController.text.isEmpty) {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomAlertDialog(
                                      content: Text(
                                        'Please enter a nickname',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      title: 'Oops!');
                                });
                          } else {
                            ref.read(roundListProvider.notifier).restart();
                            ref.read(nicknameProvider.notifier).state =
                                _nicknameController.text;
                            Navigator.pushNamed(context, '/lobby');
                          }
                        },
                        text: 'Join'),
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
    _nicknameController.dispose();
    _roomCodeController.dispose();
    super.dispose();
  }
}

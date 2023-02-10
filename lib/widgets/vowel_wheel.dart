import 'package:flutter/material.dart';

class VowelWheel extends StatelessWidget {
  const VowelWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Align(
          alignment: Alignment(0, -0.8),
          child: Text('A'),
        ),
        Align(
          alignment: Alignment(0.65, -0.25),
          child: Text('E'),
        ),
        Align(
          alignment: Alignment(0.4, 0.65),
          child: Text('I'),
        ),
        Align(
          alignment: Alignment(-0.4, 0.65),
          child: Text('O'),
        ),
        Align(
          alignment: Alignment(-0.65, -0.25),
          child: Text('U'),
        ),
      ],
    );
  }
}

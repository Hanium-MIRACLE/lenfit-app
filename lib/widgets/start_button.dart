import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  bool isStarted;

  StartButton({
    super.key,
  }) : isStarted = false;

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: () {});
  }
}

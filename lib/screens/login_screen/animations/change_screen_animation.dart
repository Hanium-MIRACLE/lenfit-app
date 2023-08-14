import 'package:flutter/material.dart';

import '../components/login_content.dart';

class ChangeScreenAnimation {
  static late final AnimationController topTextAnimationController;
  static late final Animation<Offset> topTextAnimaion;

  static var isPlaying = false;
  static var currentScreen = Screens.createAccount;

  static Animation<Offset> _createAnimation({
    required Offset begin,
    required Offset end,
    required AnimationController parent,
  }) {
    return Tween(begin: begin, end: end)
        .animate(CurvedAnimation(parent: parent, curve: Curves.easeInOut));
  }

  static void initialize({
    required TickerProvider vsync,
  }) {
    topTextAnimationController = AnimationController(
      vsync: vsync,
      duration: const Duration(microseconds: 200),
    );

    topTextAnimaion = _createAnimation(
      begin: Offset.zero,
      end: const Offset(-1.2, 0),
      parent: topTextAnimationController,
    );
  }

  static void dispose() {
    topTextAnimationController.dispose();
  }

  static Future<void> forward() async {
    isPlaying = true;

    await topTextAnimationController.forward();
    await topTextAnimationController.reverse();

    isPlaying = false;
  }
}

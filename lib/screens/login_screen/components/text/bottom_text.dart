import 'package:flutter/material.dart';
import 'package:lenfit/screens/login_screen/animations/change_screen_animation.dart';
import 'package:lenfit/utils/colors.dart';

import '../login_content.dart';

class BottomText extends StatelessWidget {
  final Screens screen;
  const BottomText({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!ChangeScreenAnimation.isPlaying) {
          ChangeScreenAnimation.forward();
          ChangeScreenAnimation.currentScreen =
              Screens.values[1 - ChangeScreenAnimation.currentScreen.index];
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: screen == Screens.createAccount
                    ? 'Already have an account?  '
                    : 'Don\'t have an account?  ',
                style: const TextStyle(
                  color: cPrimaryColor,
                ),
              ),
              TextSpan(
                text: screen == Screens.createAccount ? 'Log In' : 'Sign Up',
                style: const TextStyle(
                  color: cPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../login_content.dart';

class BottomText extends StatelessWidget {
  final Screens screen;
  const BottomText({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: screen == Screens.signUp
                ? [
                    const Text(
                      'Already have an account?  ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, "/sign-in");
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]
                : [
                    const Text(
                      'Don\'t have an account?  ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, "/sign-up");
                      },
                      child: const Text('Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ]));
  }
}

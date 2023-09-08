import 'package:flutter/material.dart';
import 'package:lenfit/screens/login_screen/components/login_content.dart';

class LoginScreen extends StatelessWidget {
  final Screens screen;
  const LoginScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LoginContent(
          currentScreen: screen,
        ),
      ),
    );
  }
}

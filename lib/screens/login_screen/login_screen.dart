import 'package:flutter/material.dart';
import 'package:lenfit/screens/login_screen/components/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return const Scaffold(
        body: Stack(
      children: [
        LoginContent(),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:lenfit/pages/home_screen.dart';

void main() => runApp(const LenFitApp());

class LenFitApp extends StatelessWidget {
  const LenFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

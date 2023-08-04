import 'package:flutter/material.dart';
import 'package:lenfit/pages/home_screen.dart';
import 'package:lenfit/pages/login_screen.dart';

void main() => runApp(const LenFitApp());

class LenFitApp extends StatelessWidget {
  const LenFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF232B55),
              fontSize: 32,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w200,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w200,
            )),
        colorScheme: const ColorScheme.light().copyWith(
          background: const Color(0x0011009e),
        ),
        primaryColor: const Color(0xFF11009E),
      ),
      // home: const HomeScreen(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

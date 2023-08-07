import 'package:flutter/material.dart';
import 'package:lenfit/pages/home_screen.dart';
import 'package:lenfit/screens/login_screen/login_screen.dart';
import 'package:lenfit/utils/colors.dart';

void main() => runApp(const LenFitApp());

class LenFitApp extends StatelessWidget {
  const LenFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: cPrimaryColor,
              fontFamily: 'GeneralSans',
            ),
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

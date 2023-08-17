import 'package:flutter/material.dart';
import 'package:lenfit/screens/navigation.dart';
import 'package:lenfit/screens/gallery_screen/gallery_screen.dart';
import 'package:lenfit/screens/lens_screen/lens_screen.dart';
import 'package:lenfit/screens/login_screen/components/login_content.dart';
import 'package:lenfit/screens/login_screen/login_screen.dart';
import 'package:lenfit/screens/record_screen/record_screen.dart';
import 'package:lenfit/screens/setting_screen/setting_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const Navigation(),
        '/gallery': (context) => const GalleryScreen(),
        '/sign-up': (context) => const LoginScreen(screen: Screens.signUp),
        '/sign-in': (context) => const LoginScreen(screen: Screens.signIn),
        '/lens': (context) => const LensScreen(),
        '/records': (context) => const RecordScreen(),
        '/setting': (conetxt) => const SettingScreen(),
      },
    );
  }
}

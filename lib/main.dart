import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lenfit/model/user.dart';
import 'package:lenfit/screens/navigation.dart';
import 'package:lenfit/screens/gallery_screen/gallery_screen.dart';
import 'package:lenfit/screens/lens_screen/lens_screen.dart';
import 'package:lenfit/screens/login_screen/components/login_content.dart';
import 'package:lenfit/screens/login_screen/login_screen.dart';
import 'package:lenfit/screens/record_screen/record_screen.dart';
import 'package:lenfit/screens/setting_screen/setting_screen.dart';
import 'package:lenfit/utils/colors.dart';
import 'package:provider/provider.dart';

import 'model/login.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Login()),
        ChangeNotifierProvider(create: (_) => User()),
      ],
      child: const LenFitApp(),
    ));

class LenFitApp extends StatefulWidget {
  const LenFitApp({super.key});
  static const storage = FlutterSecureStorage();

  @override
  State<LenFitApp> createState() => _LenFitAppState();
}

class _LenFitAppState extends State<LenFitApp> {
  dynamic user;
  dynamic userInfo;
  dynamic token;
  String? initialRoute;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });
  }

  _asyncMethod() {
    LenFitApp.storage.read(key: 'login').then((value) {
      if (value == null) {
        initialRoute = "/sign-in";
        setState(() {});
      } else {
        user = jsonDecode(value!);
        token = user['token'];
        LenFitApp.storage.write(key: 'token', value: token);
        initialRoute = "/";
        setState(() {});
      }
    });
  }

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
          primary: Colors.black,
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

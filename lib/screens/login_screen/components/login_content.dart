import 'package:flutter/material.dart';
import 'package:lenfit/screens/login_screen/animations/change_screen_animation.dart';
import 'package:lenfit/utils/colors.dart';
import 'package:lenfit/screens/login_screen/components/text/bottom_text.dart';
import 'package:lenfit/screens/login_screen/components/text/top_text.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 3,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 135,
        vertical: 16,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: cPrimaryColor,
          shape: const StadiumBorder(),
          elevation: 3,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 130,
        vertical: 20,
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 0.3,
              color: cPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: cPrimaryColor,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 0.3,
              color: cPrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget googleLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 3,
          shadowColor: Colors.black87,
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google.png',
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Login With Google',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          // child: TextField(
          //   textAlignVertical: TextAlignVertical.bottom,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(30),
          //       borderSide: BorderSide.none,
          //     ),
          //     filled: true,
          //     fillColor: Colors.white,
          //     hintText: 'Login with Google',
          //     // prefixIcon: Icon(iconData),
          //   ),
          // ),
        ),
      ),
    );
  }

  @override
  void initState() {
    ChangeScreenAnimation.initialize(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const currentScreen = Screens.createAccount;
    return Stack(
      children: [
        // const Positioned(
        //   top: 136,
        //   left: 24,
        //   child: TopText(screen: currentScreen),
        // ),
        const TopText(title: 'Lenfit'),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: currentScreen == Screens.createAccount
                    ? [
                        inputField('Name', Icons.person_outline),
                        inputField('Email', Icons.mail_outline),
                        inputField('Password', Icons.lock_outline),
                        loginButton('Sign Up'),
                        orDivider(),
                        googleLoginButton(),
                      ]
                    : [
                        inputField('Email', Icons.mail_outline),
                        inputField('Password', Icons.lock_outline),
                        loginButton('Sign In'),
                      ],
              )
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(screen: currentScreen),
          ),
        ),
      ],
    );
  }
}

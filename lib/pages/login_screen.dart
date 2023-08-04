import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lenfit/pages/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

const users = {
  'user@gmail.com': 'user',
  'test@gmail.com': 'test',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 1000);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  Future<String?> _handleGoogleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      // The OAuth client id of your app. This is required.
      clientId:
          '332047886636-mfumc9dropoudkrrs4jromegf6e2qj94.apps.googleusercontent.com',
      // If you need to authenticate to a backend server, specify its OAuth client. This is optional.
      // serverClientId: ...,
      // scopes: [
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
    );
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      print(googleUser);
      return googleUser?.email;
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: const AssetImage('assets/images/lenfit.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        accentColor: Colors.white,
        primaryColor: const Color(0xFF11009E),
        errorColor: Colors.red,
        textFieldStyle: const TextStyle(
          color: Colors.black,
        ),
        bodyStyle: const TextStyle(
          decoration: TextDecoration.underline,
        ),
        buttonStyle: const TextStyle(
          // fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 5,
        ),
        buttonTheme: const LoginButtonTheme(
          splashColor: Colors.white,
          elevation: 1,
          highlightElevation: 6.0,
        ),
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          callback: _handleGoogleSignIn,
          button: Buttons.google,
          label: "Sign with Google",
        ),
      ],
    );
  }
}

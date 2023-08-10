import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lenfit/utils/colors.dart';
import 'package:lenfit/screens/login_screen/components/text/bottom_text.dart';
import 'package:lenfit/screens/login_screen/components/text/top_text.dart';
import 'package:http/http.dart' as http;

enum Screens {
  signUp,
  signIn,
}

class LoginContent extends StatefulWidget {
  final Screens currentScreen;

  const LoginContent({
    super.key,
    required this.currentScreen,
  });

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget inputField({
    required String hint,
    required IconData iconData,
    required TextInputType inputType,
    required TextEditingController controller,
  }) {
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
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (inputType == TextInputType.emailAddress) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter your email correctly';
                }
              } else if (inputType == TextInputType.name) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
              } else if (inputType == TextInputType.text) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 4) {
                  return 'Please enter your password correctly';
                }
              }
              return null;
            },
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
            keyboardType: TextInputType.emailAddress,
            obscureText: inputType == TextInputType.text ? true : false,
          ),
        ),
      ),
    );
  }

  Future<String> loginApiCall(String email, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://api.staging.lenfitapp.com/api/user/token/"),
          body: {
            "email": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        Navigator.pushNamed(context, "/");
        return data['token'];
      } else {
        return 'No user data';
      }
    } catch (error) {
      return error.toString();
    }
  }

  Widget loginButton(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 135,
        vertical: 16,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            loginApiCall(emailController.text, passwordController.text).then(
              (value) => print(value),
            );
          }
        },
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const TopText(title: 'Lenfit'),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.currentScreen == Screens.signUp
                  ? [
                      inputField(
                        hint: 'Name',
                        iconData: Icons.person_outline,
                        inputType: TextInputType.name,
                        controller: nameController,
                      ),
                      inputField(
                          hint: 'Email',
                          iconData: Icons.mail_outline,
                          inputType: TextInputType.emailAddress,
                          controller: emailController),
                      inputField(
                          hint: 'Password',
                          iconData: Icons.lock_outline,
                          inputType: TextInputType.text,
                          controller: passwordController),
                      loginButton('Sign Up', context),
                      orDivider(),
                      googleLoginButton(),
                    ]
                  : [
                      inputField(
                        hint: 'Email',
                        iconData: Icons.mail_outline,
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      inputField(
                        hint: 'Password',
                        iconData: Icons.lock_outline,
                        inputType: TextInputType.text,
                        controller: passwordController,
                      ),
                      loginButton('Sign In', context),
                      orDivider(),
                      googleLoginButton(),
                    ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: BottomText(screen: widget.currentScreen),
          ),
        ),
      ],
    );
  }
}

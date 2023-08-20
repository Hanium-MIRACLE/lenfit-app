import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lenfit/main.dart';
import 'package:lenfit/model/login.dart';
import 'package:lenfit/model/user.dart';
import 'package:lenfit/utils/colors.dart';
import 'package:lenfit/screens/login_screen/components/text/bottom_text.dart';
import 'package:lenfit/screens/login_screen/components/text/top_text.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    if (_formKey.currentState!.validate()) {
      loginApiCall(emailController.text, passwordController.text, context)
          .then((success) {
        if (success == false) {
          setState(() {
            _isLoading = false;
          });
        } else {
          Navigator.pushNamed(context, "/");
        }
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    User userInfo = Provider.of<User>(context, listen: false);
    // userInfo = await LenFitApp.storage.read(key: 'login');

    if (userInfo.email != null) {
      // Login loginInfo = Provider.of<Login>(context, listen: false);
      // loginInfo.email = jsonDecode(userInfo)['email'];
      // loginInfo.password = jsonDecode(userInfo)['password'];
      // loginInfo.token = jsonDecode(userInfo)['token'];
      Navigator.pushNamed(context, '/');
    } else {
      print('로그인이 필요합니다');
    }
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
              color: Colors.grey.shade300,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: inputType == TextInputType.text ? true : false,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black87),
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
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            errorStyle: const TextStyle(height: 0),
            prefixIcon: Icon(iconData),
            filled: false,
          ),
        ),
      ),
    );
  }

  Future<bool> loginApiCall(
      String email, String password, BuildContext context) async {
    Login loginInfo = Provider.of<Login>(context, listen: false);
    User userInfo = Provider.of<User>(context, listen: false);
    try {
      http.Response response = await http.post(
          Uri.parse("https://api.staging.lenfitapp.com/api/user/token/"),
          body: {
            "email": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        dynamic token = json.decode(response.body)['token'];
        // var val = jsonEncode(Login(email, password, token));
        loginInfo.setEmail(email);
        loginInfo.setPassword(password);
        loginInfo.setToken(token);
        http.Response getUser = await http.get(
            Uri.parse("https://api.staging.lenfitapp.com/api/user/me/"),
            headers: {
              "Authorization": "TOKEN " + token!,
            });
        userInfo.fromJson(json.decode(getUser.body));
        // await LenFitApp.storage.write(
        //   key: 'login',
        //   value: val,
        // );
        return true;
      } else {
        Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Widget loginButton(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 16,
      ),
      child: ElevatedButton.icon(
        onPressed: _isLoading ? null : _onSubmit,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: cPrimaryColor,
          shape: const StadiumBorder(),
          elevation: 3,
          shadowColor: Colors.black87,
        ),
        icon: _isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : const Icon(Icons.login),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
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
                      loginButton("Sign Up", context),
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
                      loginButton("Sign In", context),
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

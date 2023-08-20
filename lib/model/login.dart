import 'package:flutter/material.dart';

class Login with ChangeNotifier {
  String? email;
  String? password;
  String? token;

  Login({
    this.email,
    this.password,
    this.token,
  });

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setToken(String token) {
    this.token = token;
    notifyListeners();
  }

  Login.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'token': token,
      };
}

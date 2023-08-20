import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? email;
  String? family_name;
  String? given_name;
  String? profile_image;
  int? height;
  int? weight;
  int? age;
  String? gender;

  User({
    this.email,
    this.family_name,
    this.given_name,
  });

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setFamilyName(String family_name) {
    this.family_name = family_name;
    notifyListeners();
  }

  void setGivenName(String given_name) {
    this.given_name = given_name;
    notifyListeners();
  }

  void setProfileImage(String profile_image) {
    this.profile_image = profile_image;
    notifyListeners();
  }

  void setHeight(int height) {
    this.height = height;
    notifyListeners();
  }

  void setWeight(int weight) {
    this.weight = weight;
    notifyListeners();
  }

  void setAge(int age) {
    this.age = age;
    notifyListeners();
  }

  void setGender(String gender) {
    this.gender = gender;
    notifyListeners();
  }

  void fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.family_name = json['family_name'];
    this.given_name = json['given_name'];
    this.profile_image = json['profile_image'];
    this.height = json['height'];
    this.weight = json['weight'];
    this.age = json['age'];
    this.gender = json['gender'];
    notifyListeners();
  }

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        family_name = json['family_name'],
        given_name = json['given_name'],
        profile_image = json['profile_image'],
        height = json['height'],
        weight = json['weight'],
        age = json['age'],
        gender = json['gender'] {
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'family_name': family_name,
        'given_name': given_name,
        'profile_image': profile_image,
        'height': height,
        'weight': weight,
        'age': age,
        'gender': gender,
      };
}

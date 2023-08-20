import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lenfit/model/login.dart';
import 'package:lenfit/model/user.dart';
import 'package:lenfit/utils/colors.dart';
import 'package:lenfit/utils/constant.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  dynamic token;
  dynamic userInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _asyncMethod();
    });
  }

  _asyncMethod() async {
    LenFitApp.storage.read(key: 'token').then((token) {
      token = token;
      http.get(
        Uri.parse("$LENFIT_API_BASE_URL/api/user/me"),
        headers: {
          "Authorization": "TOKEN " + token!,
        },
      ).then((response) {
        userInfo = jsonDecode(response.body);
        setState(() {});
      });
    });
  }

  _getToken() {
    http.get(
      Uri.parse("$LENFIT_API_BASE_URL/api/user/me"),
      headers: {
        "Authorization": "TOKEN " + token,
      },
    ).then((response) => userInfo = jsonDecode(response.body));
  }

  Widget topText(userName) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Show your work out!'),
          Text(
            "Hello, $userName",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWithDivider({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 32,
      ),
      child: Row(
        children: [
          Text(
            title + "   ",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Flexible(
            child: Container(
              height: 0.5,
              color: cBlack,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Login loginInfo = Provider.of<Login>(context, listen: false);
    User userInfo = Provider.of<User>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo.email != null ? topText(userInfo.given_name) : topText(''),
            titleWithDivider(title: 'Recent Videos'),
          ],
        ),
      ),
    );
  }
}

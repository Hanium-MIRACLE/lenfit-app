import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  Widget uploadButton() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: cBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  Widget buttonRows({bool includeUploadButton = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: includeUploadButton
            ? [
                uploadButton(),
                videoThumbnail(),
                videoThumbnail(),
              ]
            : [
                videoThumbnail(),
                videoThumbnail(),
                videoThumbnail(),
              ],
      ),
    );
  }

  Widget videoThumbnail() {
    return InkWell(
      onTap: () {}, // Handle your callback.
      splashColor: Colors.white.withOpacity(0.5),
      child: Ink(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/thumbnail_ex.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            buttonRows(includeUploadButton: true),
            buttonRows(),
            buttonRows(),
            buttonRows(),
            buttonRows(),
            buttonRows(),
          ],
        ),
      ),
    );
  }
}

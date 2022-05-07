import 'dart:convert';

import 'package:blog_task/main.dart';
import 'package:blog_task/models/user.dart';
import 'package:blog_task/screens/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static User? user;

  static saveUser(email, authId) async {
    final pref = await SharedPreferences.getInstance();
    user = User(email: email, authId: authId);
    authId = authId;
    // if (!pref.containsKey('user')) {
      pref.setString('user', jsonEncode(user!.toJson()));
    // }
  }

  static checkLoginStatus() async {
   await SharedPreferences.getInstance().then((value) {
      if (value.containsKey('user')) {
        user = User.fromJson(jsonDecode((value.getString('user') ?? '')));
      }
    });
    // print(user!.toJson());
  }
}

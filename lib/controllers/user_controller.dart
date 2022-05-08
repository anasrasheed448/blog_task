import 'dart:convert';
import 'dart:io';

import 'package:blog_task/constants/constant.dart';
import 'package:blog_task/models/user.dart';
import 'package:blog_task/widgets/Form.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static User? user;
  static UserInfo? userInfo;
  static saveUser(email, authId) async {
    final pref = await SharedPreferences.getInstance();
    user = User(email: email, authId: authId);
    authId = authId;
    pref.setString('user', jsonEncode(user!.toJson()));
  }

  static checkLoginStatus() async {
    await SharedPreferences.getInstance().then((value) {
      if (value.containsKey('user')) {
        user = User.fromJson(jsonDecode((value.getString('user') ?? '')));
      }
    });
    // print(user!.toJson());
  }

  static getData() async {
    final pref = await SharedPreferences.getInstance();
    try {
      final res = await http
          .get(Uri.parse(userInfoAPI))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        if (pref.containsKey('drinks')) {
          customSnackBar('Internet Error. Data fetched from local storage');
          return http.Response(pref.getString('userInfo') ?? "{}", 200);
        }
        return Future.error('error');
      });
      pref.setString('userInfo', res.body);
      userInfo = userInfoFromJson(res.body);
      return userInfo;
    } on SocketException catch (_) {
      if (pref.containsKey('drinks')) {
        customSnackBar('Internet Error. Data fetched from local storage');
        userInfo = userInfoFromJson((pref.getString('userInfo') ?? "{}"));
        return userInfo;
      }
    }
  }
}

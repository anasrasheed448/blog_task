import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/main.dart';
import 'package:blog_task/screens/login.dart';
import 'package:blog_task/widgets/Form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  register() {}
  Future<bool> login(email, pass) async {
    try {
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (creds.user != null) {
        UserController.saveUser(email, creds.user!.uid);
        Get.offAll(() => const HomePage());
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      customSnackBar(e.message);
    }
    return false;
  }

Future signout() async {
  await FirebaseAuth.instance.signOut();
  final preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  Get.offAll(()=>const LoginScreen());
  return true;
}
}

String? authId = '';

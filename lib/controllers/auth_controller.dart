import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/main.dart';
import 'package:blog_task/widgets/Form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

class AuthController extends ChangeNotifier {
  static checkAuthStatus() {
    // FirebaseAuth.instance.userChanges().listen((User? user) {
    //   if (user == null) {
    //     debugPrint('User is currently signed out!');
    //   } else {
    //     debugPrint('User is currently signed out!');
    //   }
    // });
  }

  register() {}
  Future<bool> login(email, pass) async {
    try {
      // await FirebaseAuth.instance.signOut();
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (creds.user != null) {
        UserController.saveUser(email, creds.user!.uid);
        Get.to(() => const MyHomePage());
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      customSnackBar(e.message);
    }
    return false;
  }
}

String? authId = '';

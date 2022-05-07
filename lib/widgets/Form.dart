import 'dart:io';

import 'package:blog_task/constants/style.dart';
import 'package:blog_task/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';

import 'custom_btn.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Map<String, String> _formData = {
    "email": "",
    "password": "",
  };
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();
  bool _buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    // debugPrint(FirebaseAuth.instance.currentUser!.email);
    // AuthController.checkAuthStatus();
    // _buttonPressed = false;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            Text(
              "Login".toUpperCase(),
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: lightBlack,
              ),
            ),
            customTextField(
              "Email",
              Icons.email,
              onSaved: (val) {
                _formData['email'] = val!;
              },
            ),
            customTextField(
              "Password",
              Icons.lock,
              onSaved: (val) {
                _formData['password'] = val!;
              },
            ),
            const SizedBox(height: 15),
            _buttonPressed
                ? const CircularProgressIndicator()
                : CustomBtn(text: "Login", onPressed: onPressed),
            const SizedBox(height: 15),
            Column(
              children: [
                Text(
                  "Don't have Account",
                  style: TextStyle(color: lightBlack, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container customTextField(
    String label,
    IconData icon, {
    String? value,
    TextEditingController? controller,
    Function(String?)? onSaved,
    Function(String?)? validate,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 300,
        child: TextFormField(
          decoration: InputDecoration(
            focusColor: lightGrey,
            prefixIcon: Icon(icon),
            prefixStyle: TextStyle(
              color: Colors.yellow.shade400,
            ),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: light,
              ),
            ),
          ),
          controller: controller,
          onSaved: onSaved,
        ),
      );

  onPressed() async {
    // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (_formData['email'] == '') return customSnackBar('Email is Empty');
        if (_formData['password'] == '')
          return customSnackBar('Password is Empty');
        setState(() {
          _buttonPressed = !_buttonPressed;
        });
        if (9 == 2) {
        } else {
          // var login =
          final res =
              await Provider.of<AuthController>(context, listen: false).login(
            _formData['email'].toString(),
            _formData['password'].toString(),
          );
          setState(() {
            _buttonPressed = false;
          });
        }
      }
    }
    // on HttpException catch (error) {
    //   var errorMessage = "Authentication Failed";
    //   print(errorMessage);
    //   if (error.message == "error")
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content: Text(error.message),
    //       ),
    //     );
    // }
    on HttpException catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(error.message),
        ),
      );
    }
  }
}

String? validate(String value) {
  if (value == "")
    return "fields are empty";
  else if (value.length < 6)
    return "Email or Password Incorrect";
  else
    return null;
}

customSnackBar(m) => Get.snackbar('', m, backgroundColor: Colors.white38);

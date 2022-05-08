import 'package:blog_task/constants/style.dart';
import 'package:blog_task/responsive/responsiveness.dart';
import 'package:blog_task/widgets/Form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.grey.shade300,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
              Container(
                width: isLargeScreen(context) ? 410 : double.infinity,
                height: isLargeScreen(context) ? 400 : 350,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(200)),
                  color: primary,
                ),
              ),
            
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.17),
              width: 330,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200.withOpacity(0.9),
              ),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

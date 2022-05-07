import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.only(right: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text.toUpperCase()),
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 2,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: Color(0xff112031),
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
      ),
    );
  }
}

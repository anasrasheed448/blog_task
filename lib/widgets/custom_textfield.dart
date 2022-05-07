import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String?) validation;
  final String text;
  final IconData icon;

  CustomTextfield({
   required Key key,
   required this.controller,
   required this.validation,
   required this.text,
   required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validation,
        controller: controller,
        decoration: InputDecoration(
          hintText: '$text',
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomLoaderFullScreen extends StatelessWidget {
  const CustomLoaderFullScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

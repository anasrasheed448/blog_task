import 'package:flutter/material.dart';

class CustomNoDataWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  const CustomNoDataWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: CustomText(text: 'No Data'),
        ),
        GestureDetector(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.replay_outlined),
            )),
        // const Expanded(
        //   child: SizedBox(),
        // ),
      ],
    );
  }
}


class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key, required this.text, this.size, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.backgroundColor = Colors.white,
      this.textColors = Colors.black,
      required this.onPressed,
      required this.text});

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColors;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        text,
        style: TextStyle(color: textColors, fontSize: 21),
      ),
      actions: const [],
      leading: CupertinoNavigationBarBackButton(
          color: textColors, onPressed: onPressed),
    );
  }
}

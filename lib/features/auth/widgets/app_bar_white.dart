import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWhite extends StatelessWidget {
  const AppBarWhite({super.key, required this.onPressed, required this.text});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 21),
      ),
      actions: const [],
      leading: CupertinoNavigationBarBackButton(
          color: Colors.black, onPressed: onPressed),
    );
  }
}

import 'package:flutter/material.dart';

import 'back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.backgroundColor = const Color.fromARGB(17, 255, 255, 255)});
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      leading: const BackButton(),
      title: Padding(
        padding: const EdgeInsets.only(left: 65.0),
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 21),
        ),
      ),
    );
  }
}

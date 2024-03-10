import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Color.fromARGB(255, 108, 230, 112);
  static LinearGradient linearGradient = LinearGradient(
      colors: [Colors.green.shade500, Colors.green.shade200],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const Color backgroundColor = Colors.white;

  static const Color kbackgroundColor = Color.fromARGB(17, 255, 255, 255);
  static const Color textBlackColor = Colors.black;
  static Color shadowColor = const Color(0xFFF9F9F9);
}

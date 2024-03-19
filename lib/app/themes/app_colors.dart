import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Color.fromARGB(255, 108, 230, 112);
  static LinearGradient linearGradient = LinearGradient(
      colors: [Colors.green.shade500, Colors.green.shade200],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static LinearGradient imageGradient = const LinearGradient(
      colors: [Colors.black12, Colors.black87],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const Color backgroundColor = Colors.white;
  static const Color blackshadowColor = Color.fromARGB(255, 42, 41, 41);
  static Color sellColor = const Color.fromARGB(255, 7, 189, 116);
  static Color rentColor = const Color.fromARGB(255, 36, 107, 253);

  static const Color kbackgroundColor = Color.fromARGB(17, 255, 255, 255);
  static const Color textBlackColor = Colors.black;
  static Color shadowColor = const Color(0xFFF9F9F9);
}

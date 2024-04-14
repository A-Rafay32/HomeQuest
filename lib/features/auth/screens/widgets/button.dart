import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/core/utils/loader.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.press,
    required this.text,
    this.horizontal = 55,
    this.vertical = 15,
    this.textColor = Colors.white,
    this.isLoading = false,
  });
  final void Function() press;
  final String text;
  final double horizontal;
  final double vertical;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(
              horizontal: horizontal.w, vertical: vertical.h),
          elevation: 2.0,
        ),
        onPressed: press,
        child: isLoading
            ? const ButtonLoader()
            : Text(text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: textColor, fontWeight: FontWeight.w700)));
  }
}

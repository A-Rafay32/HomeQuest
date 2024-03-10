import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/text_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.press,
    required this.text,
  });
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
          elevation: 2.0,
        ),
        onPressed: press,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.backgroundColor)));
  }
}

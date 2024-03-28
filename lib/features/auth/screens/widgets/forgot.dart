import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/screens/forgot_screen.dart';

class Forgot extends StatefulWidget {
  const Forgot({
    super.key,
  });

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Checkbox(
            value: isRemember,
            onChanged: (value) {
              setState(() {
                isRemember == true ? isRemember = false : isRemember = true;
              });
            },
          ),
          const Text(
            "Remember me",
            style: TextStyle(color: AppColors.primaryColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push(const ForgotScreen());
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

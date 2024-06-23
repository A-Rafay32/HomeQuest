import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.keyBoardType,
      this.obscureText = false,
      this.onChanged,
      this.onTap,
      this.validator,
      this.paddingX = 20,
      this.maxLines = 1,
      required this.inputDecoration,
      required this.controller,
      this.onSubmitted});

  Function(String)? onChanged;
  Function(String)? onSubmitted;
  Function()? onTap;
  String? Function(String?)? validator;
  final double paddingX;
  final TextEditingController controller;
  TextInputType? keyBoardType;
  bool obscureText;
  int maxLines;
  InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingX,
      ),
      child: TextFormField(
          onChanged: onChanged,
          maxLines: maxLines,
          onTap: onTap,
          onFieldSubmitted: onSubmitted,
          keyboardType: keyBoardType,
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration),
    );
  }
}

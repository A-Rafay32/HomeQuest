import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:real_estate_app/app/themes/app_colors.dart";
import "package:real_estate_app/app/themes/app_text_field_themes.dart";

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool isObscure = false;
  // final formKey = GlobalKey<FormState>();

  void setObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: Provider.of<login>(context, listen: false).formKey,
      child: Container(
        // height: size.height * 0.31,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email "
                      : null;
                },
                controller: widget.emailController,
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: AppTextFieldDecorations.emailInputDecoration),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                return value != null && value.length < 6
                    ? "Enter min 6 characters "
                    : null;
              },
              obscureText: isObscure,
              controller: widget.passwordController,
              cursorColor: Colors.black,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: AppTextFieldDecorations.passwordInputDecoration(
                  isObscure, setObscureText),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }
}

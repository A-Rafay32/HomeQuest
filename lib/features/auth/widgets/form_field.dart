import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:real_estate_app/app/themes/app_colors.dart";

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    super.key,
  });

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
                controller: TextEditingController(),
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: EmailInputDecoration("email")),
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
              controller: TextEditingController(),
              cursorColor: Colors.black,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: PasswordInputDecoration(isObscure, setObscureText),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration EmailInputDecoration(String label) {
  return InputDecoration(
      suffixIcon: (label == "email")
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Icon(
                Icons.email_outlined,
                color: AppColors.primaryColor,
              ),
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.primaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Enter your ${label.toLowerCase()}",
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10));
}

InputDecoration PasswordInputDecoration(bool isObscure, VoidCallback press) {
  return InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: IconButton(
          onPressed: press,
          icon: (isObscure)
              ? SvgPicture.asset("assets/svgs/eye_closed.svg",
                  height: 30,
                  width: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn))
              : SvgPicture.asset("assets/svg/eye_open.svg",
                  height: 30,
                  width: 30,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn)),
          iconSize: 28,
          color: AppColors.primaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      labelText: "Password",
      labelStyle: const TextStyle(color: AppColors.primaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Enter your password",
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10));
}

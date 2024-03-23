import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/screens/login_screen.dart';
import 'package:real_estate_app/features/auth/screens/register_screen.dart';
import 'package:real_estate_app/features/auth/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/widgets/button.dart';
import 'package:real_estate_app/features/auth/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/widgets/forgot.dart';
import 'package:real_estate_app/features/auth/widgets/form_field.dart';
import 'package:real_estate_app/features/auth/widgets/header.dart';
import 'package:real_estate_app/features/auth/widgets/signup_bar.dart';
import 'package:real_estate_app/features/auth/widgets/socialcard.dart';
import 'package:real_estate_app/features/home/screens/home_screen_body.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: CustomAppBar(
            onPressed: () {
              context.pop();
            },
            text: "Recover",
          ),
        ),
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              LoginHeader(
                w: context.w,
                text1: "Recover Password",
                text2: "Provide either your email or phone Number",
                text3: "",
              ),
              AppSizes.largeY,
              AppSizes.largeY,
              CustomTextField(
                  validator: (value) {
                    return value == null ? "Field can't be empty" : null;
                  },
                  controller: TextEditingController(),
                  inputDecoration:
                      AppTextFieldDecorations.emailInputDecoration),
              AppSizes.largeY,
              Button(
                press: () {
                  context.pushNamed(HomeScreen.homeScreen);
                },
                text: "Submit",
              ),
              const Spacer(),
              SignUpBar(
                onTap: () => context.pop(),
                text1: "Already rememeber password?",
                text2: "Sign in",
              ),
            ],
          ),
        )));
  }
}

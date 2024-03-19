import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/screens/register_screen.dart';
import 'package:real_estate_app/features/auth/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/widgets/button.dart';
import 'package:real_estate_app/features/auth/widgets/forgot.dart';
import 'package:real_estate_app/features/auth/widgets/form_field.dart';
import 'package:real_estate_app/features/auth/widgets/header.dart';
import 'package:real_estate_app/features/auth/widgets/signup_bar.dart';
import 'package:real_estate_app/features/auth/widgets/socialcard.dart';
import 'package:real_estate_app/features/home/screens/home_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  static const loginScreen = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: CustomAppBar(
            onPressed: () {
              context.pop();
            },
            text: "Login",
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
                text1: "Welcome Back",
                text2: "Sign in with your email and password ",
                text3: "or continue with social media",
              ),
              AppSizes.largeY,
              const AuthFormField(),
              AppSizes.tinyY,
              const Forgot(),
              AppSizes.normalY,
              Button(
                press: () {
                  context.pushNamed(HomeScreen.homeScreen);
                },
                text: "Login",
              ),
              AppSizes.largeY,
              AppSizes.largeY,
              const SocialCard(),
              const Spacer(),
              SignUpBar(
                onTap: () => context.pushNamed(RegisterScreen.registerScreen),
                text1: "Dont't have an account?",
                text2: "Sign up",
              ),
            ],
          ),
        )));
  }
}

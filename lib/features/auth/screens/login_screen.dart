import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier_provider.dart';
import 'package:real_estate_app/features/auth/providers/auth_service_provider.dart';
import 'package:real_estate_app/features/auth/screens/register_screen.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/forgot.dart';
import 'package:real_estate_app/features/auth/screens/widgets/form_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/header.dart';
import 'package:real_estate_app/features/auth/screens/widgets/signup_bar.dart';
import 'package:real_estate_app/features/auth/screens/widgets/socialcard.dart';
import 'package:real_estate_app/features/home/screens/home_screen_body.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({
    super.key,
  });

  static const loginScreen = "/LoginScreen";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              AuthFormField(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSizes.tinyY,
              const Forgot(),
              AppSizes.normalY,
              Button(
                press: () {
                  Future<Either<FirebaseAuthException, Success>> result = ref
                      .read(authNotifier.notifier)
                      .signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                  result.fold((left) {
                    print("exception :${left.message}");
                  }, (right) {
                    print("success${right.message}");
                  });
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

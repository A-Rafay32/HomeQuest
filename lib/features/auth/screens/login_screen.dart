import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/register_screen.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/forgot.dart';
import 'package:real_estate_app/features/auth/screens/widgets/form_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/header.dart';
import 'package:real_estate_app/features/auth/screens/widgets/signup_bar.dart';
import 'package:real_estate_app/features/auth/screens/widgets/socialcard.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                isLoading: ref.watch(authNotifier).isLoading,
                press: () => ref.read(authNotifier.notifier).signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context),
                text: "Login",
              ),
              AppSizes.largeY,
              AppSizes.largeY,
              const SocialCard(),
              const Spacer(),
              SignUpBar(
                onTap: () => context.push(RegisterScreen()),
                text1: "Dont't have an account?",
                text2: "Sign up",
              ),
            ],
          ),
        )));
  }
}

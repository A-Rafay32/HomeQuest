import 'package:either_dart/either.dart';
import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:real_estate_app/app/themes/app_paddings.dart";
import "package:real_estate_app/app/themes/app_text_field_themes.dart";
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier_provider.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/form_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/header.dart';
import 'package:real_estate_app/features/auth/screens/widgets/signup_bar.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  static String registerScreen = "/RegisterScreen";
  bool isReset = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Register",
            )),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              LoginHeader(
                  w: context.w,
                  text1: "Create Your Account",
                  text2: "Sign up with your email and password",
                  text3: "or continue with social media"),
              AppSizes.largeY,
              CustomTextField(
                  validator: (value) {
                    return value == null ? "Field can't be empty" : null;
                  },
                  controller: nameController,
                  inputDecoration:
                      AppTextFieldDecorations.genericInputDecoration(
                          label: "Name")),
              AppSizes.normalY,
              AuthFormField(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSizes.largeY,
              Button(
                press: () => _register(ref, context),
                text: "Register",
              ),
              const Spacer(),
              SignUpBar(
                onTap: () => context.pop(),
                text1: "Already have an account?",
                text2: "Sign In",
              ),
            ],
          ),
        ));
  }

  void _register(WidgetRef ref, BuildContext context) async {
    Either<Failure, Success> result = await ref
        .read(authNotifier.notifier)
        .register(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim());

    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
      context.pop();
    });
  }
}

class ForgotFormField extends StatefulWidget {
  const ForgotFormField({super.key});

  @override
  State<ForgotFormField> createState() => _ForgotFormFieldState();
}

class _ForgotFormFieldState extends State<ForgotFormField> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  // Future resetPassword() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(child: CircularProgressIndicator()),
  //   );
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: emailController.text.trim());
  //     Util.showSnackBar("Password Reset Email Sent");
  //     Navigator.of(context).popUntil((route) => route.isFirst);
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //     Util.showSnackBar(e.message);
  //     Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
        child: Container(
      height: size.height * 0.18,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
          validator: (value) {
            return value != null && !EmailValidator.validate(value)
                ? "Enter a valid email "
                : null;
          },
          controller: emailController,
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: AppTextFieldDecorations.emailInputDecoration),
    ));
  }
}

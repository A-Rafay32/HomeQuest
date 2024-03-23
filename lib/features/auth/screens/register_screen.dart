import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:real_estate_app/app/themes/app_paddings.dart";
import "package:real_estate_app/app/themes/app_text_field_themes.dart";
import "package:real_estate_app/core/exceptions/routes_extenstion.dart";
import "package:real_estate_app/features/auth/widgets/app_bar_white.dart";
import "package:real_estate_app/features/auth/widgets/button.dart";
import "package:real_estate_app/features/auth/widgets/custom_text_field.dart";
import "package:real_estate_app/features/auth/widgets/form_field.dart";
import "package:real_estate_app/features/auth/widgets/header.dart";
import "package:real_estate_app/features/auth/widgets/signup_bar.dart";
import "package:real_estate_app/features/auth/widgets/socialcard.dart";

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String registerScreen = "/RegisterScreen";
  bool isReset = true;

  @override
  Widget build(BuildContext context) {
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
                  controller: TextEditingController(),
                  inputDecoration:
                      AppTextFieldDecorations.genericInputDecoration(
                          label: "Name")),

              AppSizes.normalY,
              const AuthFormField(),
              AppSizes.largeY,
                Button(
                press: () {},
                text: "Register",
              ),
              // AppSizes.largeY,
              // const Text("or register with"),
              // AppSizes.normalY,
              // const SocialCard(),
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

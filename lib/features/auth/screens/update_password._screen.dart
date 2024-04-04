import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/header.dart';
import 'package:real_estate_app/features/auth/screens/widgets/signup_bar.dart';
import 'package:real_estate_app/features/home/screens/home_screen.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({
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
            text: "Set New Password",
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
                text1: "Set New Password",
                text2: "",
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
                      AppTextFieldDecorations.passwordInputDecoration(
                          true, () => null)),
              AppSizes.normalY,
              CustomTextField(
                  validator: (value) {
                    return value == null ? "Field can't be empty" : null;
                  },
                  controller: TextEditingController(),
                  inputDecoration:
                      AppTextFieldDecorations.passwordInputDecoration(
                          true, () => null)),
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

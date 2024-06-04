import 'package:flutter/material.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/text_theme.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/screens/auth_builder.dart';
import 'package:real_estate_app/features/home/screens/home_screen.dart';
import 'package:real_estate_app/features/onboarding/setup_profile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String splashScreen = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SizedBox(
          height: context.h,
          width: context.w,
          child: Stack(
            children: [
              Image.asset(
                AppImages.splashImage,
                fit: BoxFit.cover,
              ),
              GetStartedButton(w: context.w, h: context.h),
              Positioned(
                top: context.h * 0.6,
                left: 20,
                right: 20,
                child: Text("Find the Best Place\nFor Rent in Good Price",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.textTheme.headlineLarge
                        ?.copyWith(color: Colors.white, fontSize: 30)),
              ),
              Positioned(
                top: context.h * 0.715,
                left: 20,
                right: 20,
                child: Text(
                    "Embark on Your Home Finding Journey:\nWhere Every Listing is a Step Closer to Your Dream Home",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: AppTextTheme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white, fontSize: 15)),
              ),
            ],
          ),
        ));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.h * 0.86,
      left: 70,
      right: 70,
      child: GestureDetector(
        onTap: () {
          context.push(AuthStateBuilder(widget: HomeScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            gradient: AppColors.linearGradient,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text("Get Started ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ),
        ),
      ),
    );
  }
}

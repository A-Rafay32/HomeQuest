import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/text_theme.dart';

class AppTextFieldDecorations {
  static final searchFieldDecoration = InputDecoration(
      fillColor: AppColors.blackshadowColor,
      filled: true,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blackshadowColor),
          borderRadius: BorderRadius.circular(25),
          gapPadding: 10),
      prefixIcon: Container(
        margin: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          AppSvgs.search,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      suffixIcon: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: AppColors.linearGradient, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppSvgs.filter,
          height: 5,
          width: 5,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Search",
      hintStyle: AppTextTheme.bodyMedium.copyWith(color: Colors.white),
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

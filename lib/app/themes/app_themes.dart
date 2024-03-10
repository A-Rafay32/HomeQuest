import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/text_theme.dart';

class AppThemes {
  late final theme = ThemeData(
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      textTheme: AppTextTheme.textTheme,
      elevatedButtonTheme: elevationButtonTheme,
      textButtonTheme: textButtonTheme,
      cardColor: AppColors.backgroundColor,
      appBarTheme: appBarTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      snackBarTheme: snackbarTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.secondaryColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(Colors.white),
        checkColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
      useMaterial3: true,
      shadowColor: AppColors.shadowColor);

  final snackbarTheme = SnackBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      insetPadding: const EdgeInsets.all(7),
      elevation: 1.0,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: AppTextTheme.bodyMedium,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));

  final appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppTextTheme.titleMedium.copyWith(color: Colors.white),
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  final TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          textStyle: MaterialStatePropertyAll(AppTextTheme.bodyMedium),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.backgroundColor)));

  final elevationButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    elevation: const MaterialStatePropertyAll(2.0),
    textStyle: MaterialStatePropertyAll(AppTextTheme.bodyMedium),
  ));
}

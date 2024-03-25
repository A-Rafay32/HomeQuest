import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/routes/app_routes.dart';
import 'package:real_estate_app/app/themes/app_themes.dart';
import 'package:real_estate_app/features/onboarding/splash_screen.dart';
import 'package:real_estate_app/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Real Estate',
            initialRoute: SplashScreen.splashScreen,
            theme: AppThemes().theme,
            routes: AppRoutes.routes,
          );
        });
  }
}

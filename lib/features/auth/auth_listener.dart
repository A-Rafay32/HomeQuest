import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';

class AuthStateBuilder extends StatelessWidget {
  AuthStateBuilder({required this.widget, super.key});
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: AppColors.primaryColor,
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Sign in Error"),
            );
          }
          if (snapshot.hasData) {
            return widget;
          }
        },
      ),
    );
  }
}

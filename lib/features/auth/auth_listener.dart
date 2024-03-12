import 'package:ez_homes/contants.dart';
import 'package:ez_homes/view/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthListener extends StatelessWidget {
  AuthListener({required this.widget, super.key});
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: primaryColor,
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const CircularProgressIndicator(
              color: primaryColor,
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
          if (!snapshot.hasData) {
            return const SplashScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }
        },
      ),
    );
  }
}

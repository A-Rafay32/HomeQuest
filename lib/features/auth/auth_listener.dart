import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier_provider.dart';
import 'package:real_estate_app/features/auth/providers/auth_service_provider.dart';
import 'package:real_estate_app/features/auth/screens/login_screen.dart';

class AuthStateBuilder extends ConsumerWidget {
  AuthStateBuilder({required this.widget, super.key});
  Widget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.watch(authServiceProvider).authStateChanges(),
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
          return const LoginScreen();
        },
      ),
    );
  }
}

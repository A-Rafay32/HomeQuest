import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/login_screen.dart';

class AuthStateBuilder extends ConsumerWidget {
  const AuthStateBuilder({required this.widget, super.key});
  final Widget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateStream = ref.watch(authStreamProvider);
    return Scaffold(
        body: authStateStream.when(
      data: (data) => data != null ? widget : LoginScreen(),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => Container(
        height: context.h,
        width: context.w,
        color: AppColors.backgroundColor,
        child: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    ));
  }
}

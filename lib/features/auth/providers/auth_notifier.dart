import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/repositories/auth_repository.dart';

class AuthNotifier extends StateNotifier<AsyncValue> {
  AuthNotifier({
    required this.authService,
  }) : super(const AsyncValue.data(null));

  final AuthRepository authService;

  User? currentUser() => AuthRepository.currentUser;

  Stream<User?> authStateChanges() => authService.authStateChanges();

  void signIn(
      {required String email, required String password, required BuildContext context}) async {
    state = const AsyncValue.loading();
    final result = await authService
        .signIn(email: email, password: password)
        .whenComplete(() => state = const AsyncValue.data(null));
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
    });
  }

  FutureEither0 signOut() async {
    return await authService.signOut();
  }

  void register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final result = await authService.register(name: name, email: email, password: password);
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
      context.pop();
    });
  }
}

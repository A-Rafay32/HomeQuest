import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';

class AuthNotifier extends StateNotifier<AuthService> {
  AuthNotifier({
    required this.authService,
  }) : super(AuthService());

  final AuthService authService;

  User? currentUser() => AuthService.currentUser;

  Stream<User?> authStateChanges() => authService.authStateChanges();

  FutureEither0 signIn(
      {required String email, required String password}) async {
    return await authService.signIn(email: email, password: password);
  }

  FutureEither0 signOut() async {
    return await authService.signOut();
  }

  FutureEither0 register(
      {required String name,
      required String email,
      required String password}) async {
    return await authService.register(
        name: name, email: email, password: password);
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';

class AuthNotifier extends StateNotifier<AsyncValue> {
  AuthNotifier({
    required this.authService,
  }) : super(const AsyncValue.data(null));

  final AuthService authService;

  User? currentUser() => AuthService.currentUser;

  Stream<User?> authStateChanges() => authService.authStateChanges();

  FutureEither0 signIn(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    return await authService
        .signIn(email: email, password: password)
        .whenComplete(() => state = const AsyncValue.data(null));
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

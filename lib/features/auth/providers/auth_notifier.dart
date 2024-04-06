import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';

class AuthNotifier extends StateNotifier<AuthService> {
  AuthNotifier({
    required this.authService,
  }) : super(AuthService());

  final AuthService authService;

  User? currentUser() => AuthService.currentUser;

  Stream<User?> authStateChanges() => authService.authStateChanges();

  Future<Either<Failure, Success>> signIn(
      {required String email, required String password}) async {
    return await authService.signIn(email: email, password: password);
  }

  Future<Either<FirebaseAuthException, Success>> signOut() async {
    return await authService.signOut();
  }

  Future<Either<Failure, Success>> register(
      {required String name,
      required String email,
      required String password}) async {
    return await authService.register(
        name: name, email: email, password: password);
  }
}

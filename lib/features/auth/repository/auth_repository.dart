import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';

abstract class AuthRepository {
  Future<Either<FirebaseAuthException, Success>> signIn(
      {required String email, required String password});

  Future<Either<FirebaseAuthException, Success>> signOut();

  Future<Either<AuthException, Success>> register(
      {required String name, required String email, required String password});

  void updatePassword() {}
  void forgetPassword() {}

  void updateEmail() {}
}

abstract class SocialAuthRepository {
  void googleSignUp() {}
  void googleSignIn() {}

  void twitterSignUp() {}
  void twitterSignIn() {}

  void facebookSignUp() {}
  void facebookSignIn() {}
}

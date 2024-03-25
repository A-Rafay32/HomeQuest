import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate_app/features/auth/repository/auth_repository.dart';

class AuthService {
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static User? get currentUser => firebaseAuth.currentUser;

  void signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  void signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  void register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  void resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      String returnedEmail = await firebaseAuth.verifyPasswordResetCode(code);
      if (returnedEmail.isNotEmpty) {
        await firebaseAuth.confirmPasswordReset(
            code: code, newPassword: newPassword);
      } else {
        throw "Reset code failed to verify";
      }
    } catch (e) {
      rethrow;
    }
  }

  void updateUser() async {
    try {} catch (e) {
      rethrow;
    }
  }
}

class SocialAuthService extends AuthService implements SocialAuthRepository {
  // var googleAuth => Goog

  @override
  void googleSignUp() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  void googleSignIn() {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void twitterSignUp() {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void twitterSignIn() {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void facebookSignUp() {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void facebookSignIn() {
    try {} catch (e) {
      rethrow;
    }
  }
}

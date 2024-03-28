import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate_app/features/auth/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/features/auth/repository/auth_repository.dart';

class AuthService implements AuthRepository {
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  @override
  Future<Either<FirebaseAuthException, Success>> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(Success(message: "User signed in with $email"));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, Success>> signOut() async {
    try {
      await firebaseAuth.signOut();
      return Right(Success(message: "User signed out successfully"));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<AuthException, Success>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.credential != null) {
        await firebaseAuth.signInWithCredential(userCredential.credential!);
        return Right(
            Success(message: "User Created and signed with email $email"));
      } else {
        return Left(AuthException(message: "User Credential is Empty"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(AuthException(message: e.message!, code: e.code));
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

  @override
  void forgetPassword() {}

  void updateUser() async {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void updateEmail() {}
  @override
  void updatePassword() {}
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

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/auth/model/user.dart';

class AuthService {
  static UserService userService = UserService.instance;
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  FutureEither0 signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final result = await userService.getUserByEmail(email);

      if (result.isLeft) {
        return Left(Failure(message: "No user exists with the email provided"));
      }
      return Right(Success(message: "User signed in with $email"));
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 signOut() async {
    try {
      await firebaseAuth.signOut();
      return Right(Success(message: "User signed out successfully"));
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final result = await userService.createUser(UserModel(
          id: userCredential.user?.uid.toString() ?? "",
          name: name,
          email: email,
          password: password));

      if (result.isLeft) {
        return Left(Failure(message: "User failed to be created in database"));
      }

      return Right(Success(message: "User created with email: $email"));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(
        message: e.message!,
      ));
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

  void forgetPassword() {}

  void updateUser() async {
    try {} catch (e) {
      rethrow;
    }
  }

  void updateEmail() {}

  void updatePassword() {}
}

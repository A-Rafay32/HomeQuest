abstract class AuthRepository {
  void signIn() {}
  void signOut() {}

  void register() {}

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

class AuthException {
  final String? code;
  final String message;

  AuthException({required this.message, this.code});
}

class Success {
  final bool value;
  final String message;

  Success({
    required this.message,
    this.value = true,
  });
}

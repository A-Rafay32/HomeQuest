import 'package:real_estate_app/features/bill/model/bill.dart';

class AppException {
  final String? code;
  final String message;

  AppException({required this.message, this.code});
}

class Success {
  final bool value;
  final String message;

  Success({
    required this.message,
    this.value = true,
  });
}

class Failure implements Exception {
  final String message;

  Failure({required this.message});
}

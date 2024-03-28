import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier.dart';
import 'package:real_estate_app/features/auth/providers/auth_service_provider.dart';

final authNotifier = StateNotifierProvider<AuthNotifier, AuthService>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService: authService);
});

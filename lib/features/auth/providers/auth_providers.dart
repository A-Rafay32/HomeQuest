import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/repositories/auth_repository.dart';
import 'package:real_estate_app/features/auth/repositories/user_repository.dart';
import 'package:real_estate_app/features/auth/providers/auth_provider.dart';

final authServiceProvider = Provider((ref) {
  return AuthRepository();
});

final authNotifier = StateNotifierProvider<AuthNotifier, AsyncValue>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService: authService);
});

final authStreamProvider = StreamProvider.autoDispose((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChanges();
});

final currentUserProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final userServiceProvider = Provider((ref) => UserRepository.instance);

// final userDocProvider = Provider<UserModel>((ref) {
//   final authService = ref.read(userServiceProvider);
//   final email = ref.read(currentUserProvider)?.email;
//   authService.getUserByEmail(email.toString());
// });

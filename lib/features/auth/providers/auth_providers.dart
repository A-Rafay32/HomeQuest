import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/auth/model/user.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier.dart';
import 'package:real_estate_app/features/auth/providers/auth_service_provider.dart';

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

final userServiceProvider = Provider((ref) => UserService.instance);

// final userDocProvider = Provider<UserModel>((ref) {
//   final authService = ref.read(userServiceProvider);
//   final email = ref.read(currentUserProvider)?.email;
//   authService.getUserByEmail(email.toString());
// });

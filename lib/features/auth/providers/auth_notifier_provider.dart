import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier.dart';
import 'package:real_estate_app/features/auth/providers/auth_service_provider.dart';

final authNotifier = StateNotifierProvider<AuthNotifier, AuthService>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService: authService);
});

final authStreamProvider = StreamProvider.autoDispose((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChanges();
});

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  // get FirebaseAuth from the provider below
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  // call a method that returns a Stream<User?>
  return firebaseAuth.authStateChanges();
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/features/auth/model/user.dart';
import 'package:real_estate_app/features/auth/repositories/auth_repository.dart';
import 'package:real_estate_app/features/auth/repositories/user_repository.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository();
});

final authNotifier = StateNotifierProvider<AuthNotifier, AsyncValue>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  return AuthNotifier(authService: authService);
});

final authStreamProvider = StreamProvider.autoDispose((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final currentUserProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final currentUserDocProvider = Provider((ref) =>
    ref.read(userRepositoryProvider).getUserByEmail(currentUser?.email ?? ""));

final userRepositoryProvider = Provider((ref) => UserRepository());

final getUserProvider =
    FutureProvider.family<UserModel, String>((ref, String userID) async {
  return ref.watch(userRepositoryProvider).getUser(userID);
});

// final userDocProvider = Provider<UserModel>((ref) {
//   final authService = ref.read(userServiceProvider);
//   final email = ref.read(currentUserProvider)?.email;
//   authService.getUserByEmail(email.toString());
// });

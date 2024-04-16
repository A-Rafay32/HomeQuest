import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';

class UserNotifier extends StateNotifier<AsyncValue> {
  UserNotifier({required this.userService})
      : super(const AsyncValue.data(null));

  final UserService userService;

  FutureEither0 addToFavourites(String houseId) async {
    return await userService.addToFavourites(
        FirebaseAuth.instance.currentUser?.uid ?? '', houseId);
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, AsyncValue>((ref) {
  final userService = ref.read(userServiceProvider);
  return UserNotifier(userService: userService);
});

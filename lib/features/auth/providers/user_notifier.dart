import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/repositories/user_repository.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';

class UserNotifier extends StateNotifier<AsyncValue> {
  UserNotifier({required this.userService})
      : super(const AsyncValue.data(null));

  final UserRepository userService;

  FutureEither0 addToFavourites(String houseId) async {
    return await userService.addToFavourites(houseId);
  }

  Future<AsyncValue<List<DocumentSnapshot>>> getFavourites() async {
    state = const AsyncValue.loading();
    return await userService
        .getUserFavourites()
        .then((value) => AsyncValue.data(value.right));
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, AsyncValue>((ref) {
  final userService = ref.read(userServiceProvider);
  return UserNotifier(userService: userService);
});

final favouritesProvider = FutureProvider((ref) async {
  final userService = ref.read(userServiceProvider);
  return userService.getUserFavourites();
});

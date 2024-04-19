import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';

class UserNotifier extends StateNotifier<AsyncValue> {
  UserNotifier({required this.userService})
      : super(const AsyncValue.data(null));

  final UserRepository userService;

  FutureEither0 addToFavourites(String houseId) async {
    return await userService.addToFavourites(houseId);
  }

  FutureEither1<List<DocumentSnapshot>> getFavourites() async {
    return await userService.getUserFavourites();
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

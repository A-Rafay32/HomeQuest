import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/home/repositories/rental_home_repository.dart';

class RentalHomeNotifier extends StateNotifier<AsyncValue> {
  RentalHomeNotifier({required this.repository})
      : super(const AsyncValue.data(null));

  final RentalHomeRepository repository;

  void addRentalHouse(
      {required RentalHouse rentalHouse,
      required String? ownerId,
      required BuildContext context}) async {
    state = const AsyncValue.loading();
    final result = await repository
        .addRentalHouse(ownerId: ownerId, rentalHouse: rentalHouse)
        .whenComplete(() => state = const AsyncValue.data(null));
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
    });
  }

  FutureEither0 deleteHouse(String houseId) async {
    return await repository.deleteHouse(houseId);
  }

  Stream<List<RentalHouse>> getAllRentalHouse() {
    return repository.getAllHouses();
  }

  Stream<List<RentalHouse>> getAllAvailableRentalHouse() {
    return repository.getAllAvailableRentalHouse();
  }

  FutureEither0 updateHouse(
      String houseId, Map<String, dynamic> updatefields) async {
    return await repository.updateHouse(houseId, updatefields);
  }
}

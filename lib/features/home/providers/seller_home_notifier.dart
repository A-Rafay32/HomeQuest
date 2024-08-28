import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/features/home/models/seller_house.dart';
import 'package:real_estate_app/features/home/repositories/seller_home_repository.dart';

class SellerHomeNotifier extends StateNotifier<AsyncValue> {
  SellerHomeNotifier({required this.sellerHomeRepository})
      : super(const AsyncData(null));

  final SellerHomeRepository sellerHomeRepository;

  void addSellerHouse(SellerHouse sellerHouse, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await sellerHomeRepository
        .addSellerHouse(sellerHouse: sellerHouse)
        .whenComplete(() => const AsyncData(null));

    result.fold((left) => context.showSnackBar(left.message.toString()),
        (right) => context.showSnackBar(right.message.toString()));
  }

  void delete(String houseId, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await sellerHomeRepository
        .deleteHouse(houseId)
        .whenComplete(() => const AsyncData(null));

    result.fold((left) => context.showSnackBar(left.message.toString()),
        (right) => context.showSnackBar(right.message.toString()));
  }

  void update(SellerHouse sellerHouse, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await sellerHomeRepository
        .addSellerHouse(sellerHouse: sellerHouse)
        .whenComplete(() => const AsyncData(null));

    result.fold((left) => context.showSnackBar(left.message.toString()),
        (right) => context.showSnackBar(right.message.toString()));
  }

  // get
}

final sellerHomeProvider = Provider((ref) {
  return SellerHomeRepository();
});

final sellerHomeNotifierProvider =
    StateNotifierProvider<SellerHomeNotifier, AsyncValue>((ref) {
  final sellerHomeRepository = ref.watch(sellerHomeProvider);
  return SellerHomeNotifier(sellerHomeRepository: sellerHomeRepository);
});

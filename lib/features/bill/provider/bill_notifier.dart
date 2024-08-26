import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/features/bill/model/bill.dart';
import 'package:real_estate_app/features/bill/repository/bill_repository.dart';

class BillNotifier extends StateNotifier<AsyncValue> {
  BillNotifier({required this.billRepository})
      : super(const AsyncValue.data(null));

  final BillRepository billRepository;

  void createBill(Bill bill, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await billRepository
        .createBill(bill)
        .whenComplete(() => const AsyncValue.data(null));

    result.fold((left) => context.showSnackBar(left.message),
        (right) => context.showSnackBar(right.message));
  }

  void updateBill(Bill bill, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await billRepository
        .createBill(bill)
        .whenComplete(() => const AsyncValue.data(null));

    result.fold((left) => context.showSnackBar(left.message),
        (right) => context.showSnackBar(right.message));
  }

  void deleteBill(Bill bill, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await billRepository
        .createBill(bill)
        .whenComplete(() => const AsyncValue.data(null));

    result.fold((left) => context.showSnackBar(left.message),
        (right) => context.showSnackBar(right.message));
  }

  // void getBill() {}
}

final billRepositoryProvider = Provider((ref) {
  return BillRepository();
});

final billNotifierProvider =
    StateNotifierProvider<BillNotifier, AsyncValue>((ref) {
  final billRepository = ref.watch(billRepositoryProvider);
  return BillNotifier(billRepository: billRepository);
});

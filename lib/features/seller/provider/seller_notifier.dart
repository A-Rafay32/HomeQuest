import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/features/seller/model/seller.dart';
import 'package:real_estate_app/features/seller/repository/seller_repository.dart';

class SellerNotifier extends StateNotifier<AsyncValue> {
  SellerNotifier() : super(const AsyncValue.data(null));

  void createSeller(Seller seller, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await SellerRepository()
        .createSeller(seller: seller, uid: currentUser?.uid ?? "");

    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
    });
  }

  // FutureEither1<Seller> getSeller(String uid, BuildContext context) async {
  //   state = const AsyncValue.loading();
  //   return await SellerRepository()
  //       .getSeller(uid: uid)
  //       .whenComplete(() => const AsyncValue.data(null));
  // }
}

final sellerNotifierProvider =
    StateNotifierProvider<SellerNotifier, AsyncValue>((ref) {
  return SellerNotifier();
});

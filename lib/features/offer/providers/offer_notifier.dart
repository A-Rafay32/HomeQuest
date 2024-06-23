import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/repository/offer_repository.dart';

class OfferNotifier extends StateNotifier<AsyncValue> {
  OfferNotifier() : super(const AsyncValue.data(null));

  void createOffer(Offer offer, BuildContext context) async {
    state = const AsyncValue.loading();
    final result =
        await OfferRepository().createOffer(offer).whenComplete(() => const AsyncValue.data(null));
    result.fold((left) {
      context.pop();
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.pop();
      context.showSnackBar(right.message.toString());
    });
  }
}

final offerNotifierProvider = StateNotifierProvider<OfferNotifier, AsyncValue>((ref) {
  return OfferNotifier();
});

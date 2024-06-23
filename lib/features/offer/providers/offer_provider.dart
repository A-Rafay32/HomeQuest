import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/core/exceptions/exceptions.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/repository/offer_repository.dart';

final offerRepositoryProvider = Provider((ref) {
  return OfferRepository();
});
final offersByUserProvider = StreamProvider((ref) {
  return ref.watch(offerRepositoryProvider).getAllOffersByUser(currentUser?.uid ?? "");
});

final offersForUserProvider = StreamProvider((ref) {
  return ref.watch(offerRepositoryProvider).getAllOffersForUser(currentUser?.uid ?? "");
});

final offerFutureProvider = FutureProvider.family<Offer, String>((ref, String offerId) async {
  return ref.watch(offerRepositoryProvider).getOffer(offerId);
});

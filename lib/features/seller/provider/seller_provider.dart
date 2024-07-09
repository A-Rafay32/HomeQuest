import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/providers/offer_provider.dart';
import 'package:real_estate_app/features/seller/model/seller.dart';
import 'package:real_estate_app/features/seller/repository/seller_repository.dart';

final sellerRepositoryProvider = Provider((ref) => SellerRepository());

final getSellerProvider =
    FutureProvider.family<Seller, String>((ref, String sellerId) async {
  return ref.watch(sellerRepositoryProvider).getSeller(uid: sellerId);
});

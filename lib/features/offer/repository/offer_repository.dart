import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';

class OfferRepository {
  final offerCollection = FirebaseFirestore.instance.collection("offers");

  FutureEither0 createOffer(Offer offer) async {
    try {
      await offerCollection.add(offer.toMap()).catchError((error) => throw error);
      return success("Offer created successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  FutureEither0 updateOffer(String offerId, Offer offer) async {
    try {
      await offerCollection.doc(offerId).update(offer.toMap()).catchError((error) => throw error);
      return success("Offer updated successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  FutureEither0 deleteOffer(String offerId) async {
    try {
      await offerCollection.doc(offerId).delete().catchError((error) => throw error);
      return success("Offer deleted successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  FutureEither1<Offer> getOffer(String offerId) async {
    try {
      final docSnapshot = await offerCollection.doc(offerId).get();
      if (docSnapshot.exists) {
        return Right(Offer.fromMap(docSnapshot.data() as Map<String, dynamic>));
      } else {
        return failure("Offer not found");
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  Stream<List<Offer>> getAllOffers() {
    try {
      return offerCollection.snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((docSnapshot) {
          return Offer.fromMap(docSnapshot.data());
        }).toList();
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<List<Offer>> getAllOffersForSeller(String sellerId) {
    try {
      return offerCollection
          .where('isSentTo', isEqualTo: sellerId)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((docSnapshot) {
          return Offer.fromMap(docSnapshot.data());
        }).toList();
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<List<Offer>> getAllOffersBySeller(String sellerId) {
    try {
      return offerCollection
          .where('isCreatedBy', isEqualTo: sellerId)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((docSnapshot) {
          return Offer.fromMap(docSnapshot.data());
        }).toList();
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

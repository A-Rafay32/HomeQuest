import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';

class OfferRepository {
  final offerCollection = FirebaseFirestore.instance.collection("offers");

  FutureEither0 createOffer(Offer offer) async {
    try {
      await offerCollection
          .doc(offer.id)
          .set(offer.toMap())
          .catchError((error) => throw error);
      return success("Offer created successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  FutureEither0 updateOffer(
      String offerId, Map<String, dynamic> updatedFields) async {
    try {
      await offerCollection
          .doc(offerId)
          .update(updatedFields)
          .catchError((error) => throw error);
      return success("Offer updated successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  FutureEither0 deleteOffer(String offerId) async {
    try {
      await offerCollection
          .doc(offerId)
          .delete()
          .catchError((error) => throw error);
      return success("Offer deleted successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }

  Future<Offer> getOffer(String offerId) async {
    try {
      final docSnapshot = await offerCollection.doc(offerId).get();
      return Offer.fromMap(docSnapshot.data() as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
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
          .where('sentTo', isEqualTo: sellerId)
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
          .where('createdBy', isEqualTo: sellerId)
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

  Stream<List<Offer>> getAllOffersForUser(String userId) {
    try {
      return offerCollection
          .where('sentTo', isEqualTo: userId)
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

  Stream<List<Offer>> getAllOffersByUser(String userId) {
    try {
      return offerCollection
          .where('createdBy', isEqualTo: userId)
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

  FutureEither0 acceptOffer(String offerId, Offer offer) async {
    try {
      await offerCollection
          .doc(offerId)
          .update({"isAccepted": true}).catchError((error) => throw error);
      return success("Offer updated successfully");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return failure(e.toString());
    }
  }
}

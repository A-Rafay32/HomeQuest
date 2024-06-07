import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/seller/model/seller.dart';

class SellerRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference sellerCollection =
      FirebaseFirestore.instance.collection("sellers");

  FutureEither0 createSeller(
      {required Seller seller, required String uid}) async {
    try {
      await sellerCollection.doc(uid).set(seller.toMap());
      return success("Seller created successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither0 updateSeller(
      {required String uid, required Map<String, dynamic> updateFields}) async {
    try {
      await sellerCollection.doc(uid).update(updateFields);
      return success("Seller updated successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither0 deleteSeller({required String uid}) async {
    try {
      await sellerCollection.doc(uid).delete();
      return success("Seller deleted successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither1<Seller> getSeller({required String uid}) async {
    try {
      final doc = await sellerCollection.doc(uid).get();
      if (doc.exists) {
        return Right(Seller.fromMap(doc.data() as Map<String, dynamic>));
      } else {
        return failure("Seller not found");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither1<Seller> getSellerByEmail(String email) async {
    try {
      // get user
      QuerySnapshot userDoc =
          await sellerCollection.where("email", isEqualTo: email).get();
      if (userDoc.docs.isNotEmpty) {
        return Right(userDoc.docs as Seller);
      } else {
        return failure("User Doesn't exist");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }
}

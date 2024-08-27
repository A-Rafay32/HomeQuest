import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/core/enums/house_status.dart';
import 'package:real_estate_app/core/exceptions/exceptions.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/bill/model/bill.dart';
import 'package:real_estate_app/features/home/models/seller_house.dart';

class SellerHomeRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final houseCollection = FirebaseFirestore.instance.collection("houses");

  FutureEither0 addSellerHouse({required SellerHouse sellerHouse}) async {
    try {
      await houseCollection
          .add(sellerHouse.toMap())
          .catchError((error) => throw error.toString());

      return Right(Success(message: "Seller House added successfully"));
    } on FirebaseException catch (e) {
      return failure(e.toString());
    } catch (e, stackTrace) {
      debugPrint("error : $e \n StackTrace : $stackTrace ");
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 deleteHouse(String houseId) async {
    try {
      await firestore.doc(houseId).delete();
      return Right(Success(message: "House deleted successfully"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<SellerHouse> getHouse(String houseId) async {
    try {
      DocumentSnapshot docSnapshot = await houseCollection.doc(houseId).get();
      if (docSnapshot.exists) {
        SellerHouse h =
            SellerHouse.fromMap(docSnapshot.data() as Map<String, dynamic>);
        print(h.toMap());
        return Right(
            SellerHouse.fromMap(docSnapshot.data() as Map<String, dynamic>));
      } else {
        return Left(Failure(message: "House Doesnot exist"));
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 updateHouse(
      String houseId, Map<String, dynamic> updatefields) async {
    try {
      await houseCollection
          .doc(houseId)
          .update(updatefields)
          .catchError((error) => throw error.toString());

      return Right(Success(message: "House updated successfully"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<List<SellerHouse>> getUserHouses(List<dynamic> houseIds) async {
    try {
      List<SellerHouse> list = [];
      for (var id in houseIds) {
        DocumentSnapshot docs = await houseCollection
            .doc(id)
            .get()
            .catchError((error) => throw error.toString());
        print(docs.data() as Map<String, dynamic>);
        list.add(SellerHouse.fromMap(docs.data() as Map<String, dynamic>));
      }
      return Right(list);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e, stackTrace) {
      debugPrint(" error : ${e.toString()} \n stackTrace : $stackTrace");
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<List<Bill>> getAllHouseBills(String houseIds) async {
    try {
      QuerySnapshot docs =
          await houseCollection.doc(houseIds).collection("bills").get();
      return Right(docs.docs
          .map((docSnapshot) =>
              Bill.fromMap(docSnapshot.data() as Map<String, dynamic>))
          .toList());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Stream<List<SellerHouse>> getAllHouses() {
    try {
      return houseCollection.snapshots().map((querySnapshot) => querySnapshot
          .docs
          .map((documentSnapshot) =>
              SellerHouse.fromMap(documentSnapshot.data()))
          .toList());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e, stackTrace) {
      debugPrint(" error : ${e.toString()} \n stackTrace : $stackTrace");
      rethrow;
    }
  }

  Stream<List<SellerHouse>> getAllSellerHouse() {
    try {
      return houseCollection
          .where("houseStatus", isEqualTo: HouseStatus.Sale.toString())
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((documentSnapshot) =>
                  SellerHouse.fromMap(documentSnapshot.data()))
              .toList());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e, stackTrace) {
      debugPrint(" error : ${e.toString()} \n stackTrace : $stackTrace");
      rethrow;
    }
  }

  Stream<List<SellerHouse>> getAllAvailableSellerHouse() {
    try {
      return houseCollection
          .where("isAvailable", isEqualTo: true)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((documentSnapshot) =>
                  SellerHouse.fromMap(documentSnapshot.data()))
              .toList());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e, stackTrace) {
      debugPrint(" error : ${e.toString()} \n stackTrace : $stackTrace");
      rethrow;
    }
  }
}

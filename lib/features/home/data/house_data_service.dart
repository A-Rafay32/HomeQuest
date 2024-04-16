import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';

class RentalHomeService {
  RentalHomeService({required this.userService});

  final UserService userService;
  final firestore = FirebaseFirestore.instance;
  final houseCollection = FirebaseFirestore.instance.collection("houses");

  FutureEither0 addRentalHouse(
      {required RentalHouse rentalHouse, required String? ownerId}) async {
    try {
      if (ownerId != null) {
        final isLegit = await userService.getUser(ownerId).fold(
            (left) => throw left.message,
            (right) =>
                right.usertype == UserType.admin ||
                right.usertype == UserType.seller);

        if (isLegit) {
          houseCollection
              .add(rentalHouse.toMap())
              .catchError((error) => throw error.toString());
        } else {
          return Left(
              Failure(message: "You don't have permission for this action"));
        }
        return Right(Success(message: "House added successfully"));
      } else {
        return Left(Failure(message: "Owner Id is empty "));
      }
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 deleteHouse() async {
    try {
      return Right(Success(message: "House deleted successfully"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<RentalHouse> getRentalHouse(String houseId) async {
    try {
      DocumentSnapshot docSnapshot = await houseCollection.doc(houseId).get();
      if (docSnapshot.exists) {
        RentalHouse h =
            RentalHouse.fromMap(docSnapshot.data() as Map<String, dynamic>);
        print(h.toMap());
        return Right(
            RentalHouse.fromMap(docSnapshot.data() as Map<String, dynamic>));
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

  Stream<List<RentalHouse>> getAllRentalHouse() {
    try {
      return houseCollection.snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((documentSnapshot) {
          return RentalHouse.fromMap(documentSnapshot.data());
        }).toList();
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
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

  FutureEither1<List<House>> getUserFavourites(List<String> houseIds) async {
    try {
      List<House> houses = [];
      for (var id in houseIds) {
        DocumentSnapshot docs = await houseCollection
            .doc(id)
            .get()
            .catchError((error) => throw error.toString());
        final house = House.fromMap(docs.data() as Map<String, dynamic>);
        houses.add(house);
      }
      return Right(houses);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

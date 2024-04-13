import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/data/user_service.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';

class RentalHomeService {
  RentalHomeService._privConst();

  static final RentalHomeService instance = RentalHomeService.instance;

  final firestore = FirebaseFirestore.instance;
  final houseCollection = FirebaseFirestore.instance.collection("house");
  final UserService userService = UserService.instance;

  FutureEither0 addRentalHouse({
    required String name,
    required int bathroomQty,
    required String description,
    required int roomQty,
    required int sizeInFeet,
    required String address,
    required String housetype,
    required double rentPerMonth,
    required String ownerId,
  }) async {
    try {
      final rentalHouse = RentalHouse(
          name: name,
          bathroomQty: bathroomQty,
          features: null,
          description: description,
          roomQty: roomQty,
          sizeInFeet: sizeInFeet,
          address: address,
          housetype: HouseType.Rent,
          constructedOn: DateTime.now(),
          ownerId: ownerId,
          images: AppImages.houseImages,
          isFurnished: false,
          rentPerMonth: rentPerMonth);

      final isAdmin = await userService.getUser(ownerId).fold(
          (left) => throw left.message,
          (right) => right.usertype == UserType.admin ? true : false);

      return (isAdmin)
          ? Right(Success(message: "House added successfully"))
          : Left(Failure(message: "House failed to be added"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
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

  Stream<RentalHouse> getAllRentalHouse() {
    try {
      return houseCollection.snapshots().map(
          (event) => RentalHouse.fromMap(event.docs as Map<String, dynamic>));
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
}

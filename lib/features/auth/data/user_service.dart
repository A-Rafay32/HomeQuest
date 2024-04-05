import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/features/auth/model/user.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<Either<Failure, Success>> createUser(UserModel user) async {
    try {
      await userCollection.add({user});
      return Right(Success(message: "user created"));
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> updateUser(
      String documentId, UserModel updatedUser) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (userDoc.exists) {
        userDoc.reference.update(updatedUser.toMap());
      }
      return Right(Success(message: "User Updated"));
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, UserModel>?> readUser(String documentId) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (userDoc.exists) {
        Map<String, dynamic> userMap = userDoc.data() as Map<String, dynamic>;
        return Right(UserModel.fromMap(userMap));
      } else {
        return Left(Failure(message: "User Doesn't exist"));
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> deleteUser(String documentId) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (userDoc.exists) {
        await userDoc.reference.delete();
        return Right(Success(message: "User deleted Successfully"));
      } else {
        return Left(Failure(message: "User doesnot exist"));
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }
}

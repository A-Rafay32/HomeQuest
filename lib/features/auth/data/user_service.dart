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
      await userCollection.add(user.toMap());
      return Right(Success(message: "user created"));
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> updateUser(
      String documentId, Map<String, dynamic> updatedFields) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (userDoc.exists) {
        userDoc.reference.update(updatedFields);
      }
      return Right(Success(message: "User Updated"));
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, UserModel>?> getUser(String documentId) async {
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

  Future<Either<Failure, UserModel>> getUserByEmail(String email) async {
    try {
      // get user
      QuerySnapshot userDoc =
          await userCollection.where("email", isEqualTo: email).get();
      if (userDoc.docs.isNotEmpty) {
        Map<String, dynamic> userMap = userDoc.docs as Map<String, dynamic>;
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
      await userCollection.doc(documentId).delete().onError(
          (error, stackTrace) =>
              Left(Failure(message: "Failed to delete User : $error")));
      return Right(Success(message: "User deleted Successfully"));
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/model/user.dart';

class UserService {
  UserService._priv();
  static final UserService instance = UserService._priv();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
            toFirestore: (model, _) => model.toMap(),
          );

  FutureEither0 createUser(UserModel user) async {
    try {
      await userCollection.add(user);
      return Right(Success(message: "User created successfully"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 updateUser(
      String documentId, Map<String, dynamic> updatedFields) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (!userDoc.exists) {
        throw "User Doc doesnt't exist";
      }
      await userDoc.reference.update(updatedFields);
      return Right(Success(message: "User Updated"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<UserModel> getUser(String documentId) async {
    try {
      // get user
      DocumentSnapshot userDoc = await userCollection.doc(documentId).get();
      // update user
      if (userDoc.exists) {
        Map<String, dynamic> userMap = userDoc.data() as Map<String, dynamic>;
        return Right(UserModel.fromMap(userMap));
      } else {
        throw "User Doesn't exist";
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<UserModel> getUserByEmail(String email) async {
    try {
      // get user
      QuerySnapshot userDoc =
          await userCollection.where("email", isEqualTo: email).get();
      if (userDoc.docs.isNotEmpty) {
        return Right(userDoc.docs as UserModel);
      } else {
        throw "User Doesn't exist";
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 deleteUser(String documentId) async {
    try {
      await userCollection.doc(documentId).delete().onError(
          (error, stackTrace) => throw "Failed to delete User : $error");
      return Right(Success(message: "User deleted Successfully"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

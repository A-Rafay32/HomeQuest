import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/core/exceptions/exceptions.dart';
import 'package:real_estate_app/core/services/image_picker_service.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/model/user.dart';
import 'package:real_estate_app/features/home/repositories/rental_home_repository.dart';

class UserRepository {
  UserRepository._priv();
  static final instance = UserRepository._priv();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  FutureEither0 createUser(UserModel user, String uid) async {
    try {
      await userCollection.doc(uid).set(user);
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

  FutureEither0 addToFavourites(String houseId) async {
    try {
      await userCollection.doc(currentUser?.uid).update({
        "favourites": FieldValue.arrayUnion([houseId])
      }).catchError((error) => throw error);
      return Right(Success(message: "Added to Favourites ⭐"));
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither1<List<DocumentSnapshot>> getUserFavourites() async {
    try {
      final user = await getUser(currentUser?.uid ?? "");
      final houseIds = user.right.favourites;
      return await RentalHomeRepository().getUserHouses(houseIds);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      return Left(Failure(message: "Failed to fetch the user favourites"));
    }
  }

  FutureEither0 setUserProfileImage() async {
    try {
      final url = await ImageService()
          .uploadImage(userStorageRef, currentUser?.displayName ?? "");
      await currentUser
          ?.updatePhotoURL(url.right)
          .catchError((error) => throw error);
      return Right(Success(message: "Profile Image updated successfully"));
    } catch (e) {
      return Left(Failure(message: "Failed to update the profile image "));
    }
  }
}

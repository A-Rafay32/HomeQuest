import 'package:real_estate_app/core/enums/gender.dart';
import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/address.dart';

class UserModel {
  final String name;
  final String email;
  final String phoneNum;
  final String description;
  final String image;
  final bool isEmailVerified;
  final List<dynamic> paymentInfo;
  final List<String> socialMediaLinks;
  final Address address;
  final DateTime dateofBirth;
  final Gender gender;
  final UserType usertype;
  // final List<String> userHouseIds;
  // final List<String> userBills;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNum,
    required this.image,
    required this.dateofBirth,
    required this.description,
    required this.gender,
    required this.isEmailVerified,
    required this.paymentInfo,
    required this.socialMediaLinks,
    this.usertype = UserType.user,
  });

  // UserModel fromJson(Map<dynamic, dynamic> json) {
  //   return UserModel(
  //       userBills: json["userBills"],
  //       image: json["image"],
  //       phoneNum: json["phoneNum"],
  //       address: json["address"],
  //       name: json["name"],
  //       email: json["email"],
  //       userHouseIds: json["userHouseIds"],
  //       usertype: (json["userType"]["usertype_key"] == "user")
  //           ? UserType.user
  //           : UserType.admin);
  // }

  // Map<dynamic, dynamic> toJson(UserModel user) {
  //   return {
  //     "name": user.name,
  //     "email": user.email,
  //     "address": user.address,
  //     "phoneNum": user.phoneNum,
  //     "image": user.image,
  //     "userBills": userBills,
  //     "userHouseId": user.userHouseIds,
  //     "userType": user.usertype.name == "user" ? "user" : "admin"
  //   };
  // }
}

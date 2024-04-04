import 'package:real_estate_app/core/enums/user_type.dart';

class UserModel {
  final String name;
  final String email;
  final String address;
  final String phoneNum;
  final String image;
  final UserType usertype;
  final List<String> userHouseIds;
  final List<String> userBills;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNum,
    required this.image,
    required this.userBills,
    required this.userHouseIds,
    this.usertype = UserType.user,
  });

  UserModel fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
        userBills: json["userBills"],
        image: json["image"],
        phoneNum: json["phoneNum"],
        address: json["address"],
        name: json["name"],
        email: json["email"],
        userHouseIds: json["userHouseIds"],
        usertype: (json["userType"]["usertype_key"] == "user")
            ? UserType.user
            : UserType.admin);
  }

  Map<dynamic, dynamic> toJson(UserModel user) {
    return {
      "name": user.name,
      "email": user.email,
      "address": user.address,
      "phoneNum": user.phoneNum,
      "image": user.image,
      "userBills": userBills,
      "userHouseId": user.userHouseIds,
      "userType": user.usertype.name == "user" ? "user" : "admin"
    };
  }
}

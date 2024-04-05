// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:real_estate_app/core/enums/gender.dart';
import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/address.dart';

class UserModel {
  final String id;
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

  UserModel({
    required this.id,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phoneNum': phoneNum,
      'description': description,
      'image': image,
      'isEmailVerified': isEmailVerified,
      'paymentInfo': paymentInfo,
      'socialMediaLinks': socialMediaLinks,
      'address': address.toMap(),
      'dateofBirth': dateofBirth.millisecondsSinceEpoch,
      'gender': gender.toString(),
      'usertype': usertype.toString(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNum: map['phoneNum'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      isEmailVerified: map['isEmailVerified'] as bool,
      paymentInfo: List<dynamic>.from((map['paymentInfo'] as List<dynamic>)),
      socialMediaLinks:
          List<String>.from((map['socialMediaLinks'] as List<String>)),
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
      dateofBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateofBirth'] as int),
      gender: Gender.toGender(map['gender']),
      usertype: UserType.toUserType(map['usertype']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

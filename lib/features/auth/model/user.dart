// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:real_estate_app/core/enums/gender.dart';
import 'package:real_estate_app/core/enums/user_type.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String id;
  final String? phoneNum;
  final String? description;
  final String? image;
  final String? address;
  final bool? isEmailVerified;
  List<dynamic> favourites;
  List<String>? houses;
  final List<dynamic>? paymentInfo;
  final List<String>? socialMediaLinks;
  final DateTime? dateofBirth;
  final Gender? gender;
  final UserType? usertype;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.address,
    this.phoneNum,
    this.image,
    this.dateofBirth,
    this.description,
    this.gender,
    this.isEmailVerified,
    this.houses,
    this.favourites = const [],
    this.paymentInfo,
    this.socialMediaLinks,
    this.usertype = UserType.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNum': phoneNum,
      'description': description,
      'image': image,
      "favourites": favourites,
      'isEmailVerified': isEmailVerified,
      'houses': houses,
      'paymentInfo': paymentInfo,
      'socialMediaLinks': socialMediaLinks,
      'address': address,
      'dateofBirth': dateofBirth?.millisecondsSinceEpoch,
      'gender': gender.toString(),
      'usertype': usertype?.name.toString()
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      id: map['id'] as String,
      phoneNum: map['phoneNum'] != null ? map['phoneNum'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      isEmailVerified: map['isEmailVerified'] != null
          ? map['isEmailVerified'] as bool
          : null,
      houses: map['houses'] != null ? map['houses'] as List<String> : null,
      favourites: map['favourites'] ?? [],
      paymentInfo: map['paymentInfo'] != null
          ? List<dynamic>.from((map['paymentInfo'] as List<dynamic>))
          : null,
      socialMediaLinks: map['socialMediaLinks'] != null
          ? List<String>.from((map['socialMediaLinks'] as List<String>))
          : null,
      address: map['address'],
      dateofBirth: map['dateofBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateofBirth'] as int)
          : null,
      gender: null,
      // map['gender'] != null ? Gender.toGender(map['gender']) : null,
      usertype:
          map['usertype'] != null ? UserType.toUserType(map['usertype']) : null,
    );
  }
}

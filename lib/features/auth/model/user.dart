// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:real_estate_app/core/enums/gender.dart';
import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/address.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String id;
  final String? phoneNum;
  final String? description;
  final String? image;
  final bool? isEmailVerified;
  final List<dynamic>? paymentInfo;
  final List<String>? socialMediaLinks;
  final Address? address;
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
      'isEmailVerified': isEmailVerified,
      'paymentInfo': paymentInfo,
      'socialMediaLinks': socialMediaLinks,
      'address': address?.toMap(),
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
      paymentInfo: map['paymentInfo'] != null
          ? List<dynamic>.from((map['paymentInfo'] as List<dynamic>))
          : null,
      socialMediaLinks: map['socialMediaLinks'] != null
          ? List<String>.from((map['socialMediaLinks'] as List<String>))
          : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      dateofBirth: map['dateofBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateofBirth'] as int)
          : null,
      gender: map['gender'] != null ? Gender.toGender(map['gender']) : null,
      usertype:
          map['usertype'] != null ? UserType.toUserType(map['usertype']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

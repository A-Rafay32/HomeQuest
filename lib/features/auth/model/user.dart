// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';

class UserModel {
  final UserDetails userDetails;
  final bool? isEmailVerified;
  List<dynamic> favourites;
  List<String>? myHouses;
  final List<dynamic>? paymentInfo;
  final List<String>? socialMediaLinks;
  final UserType? usertype;

  UserModel({
    required this.userDetails,
    this.isEmailVerified,
    this.myHouses,
    this.favourites = const [],
    this.paymentInfo,
    this.socialMediaLinks,
    this.usertype = UserType.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "favourites": favourites,
      'isEmailVerified': isEmailVerified,
      'myHouses': myHouses,
      'paymentInfo': paymentInfo,
      'socialMediaLinks': socialMediaLinks,
      'userDetails': userDetails.toMap(),
      'usertype': usertype?.name.toString()
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userDetails: map["userDetails"] ?? {},
      isEmailVerified: map['isEmailVerified'] != null
          ? map['isEmailVerified'] as bool
          : null,
      myHouses: map['myHouses'] ?? [],
      favourites: map['favourites'] ?? [],
      paymentInfo: map['paymentInfo'] != null
          ? List<dynamic>.from((map['paymentInfo'] as List<dynamic>))
          : null,
      socialMediaLinks: map['socialMediaLinks'] != null
          ? List<String>.from((map['socialMediaLinks'] as List<String>))
          : null,
      usertype:
          map['usertype'] != null ? UserType.toUserType(map['usertype']) : null,
    );
  }
}

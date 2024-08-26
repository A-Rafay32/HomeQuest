import 'dart:convert';

import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';

class Seller {
  final String id;
  final UserDetails userDetails;
  final String storeName;
  final String? storeImage;
  final String storephoneNum;
  final String? storeAddress;
  final String? storeDescription;
  final DateTime memberSince;
  final double rating;
  final List<String> reviews;
  final List<String> listedHouseIds;
  final DateTime? registeredOn;
  final List<String> contracts;
  final List<String> offers;
  final String licenseNumber;
  final int numOfHouseSold;
  final int numOfRentedHouses;
  final UserType userType;

  Seller({
    required this.id,
    required this.userDetails,
    required this.memberSince,
    required this.rating,
    required this.storeName,
    required this.storephoneNum,
    required this.reviews,
    required this.listedHouseIds,
    required this.registeredOn,
    required this.contracts,
    required this.offers,
    required this.licenseNumber,
    required this.numOfHouseSold,
    required this.numOfRentedHouses,
    this.userType = UserType.seller,
    this.storeAddress,
    this.storeDescription,
    this.storeImage,
  });

  int get totalListings => listedHouseIds.length;
  int get totalFeaturedListings => listedHouseIds.length;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userDetails': userDetails.toMap(),
      'storeName': storeName,
      'storeImage': storeImage,
      'storephoneNum': storephoneNum,
      'storeAddress': storeAddress,
      'storeDescription': storeDescription,
      'memberSince': memberSince.millisecondsSinceEpoch,
      'rating': rating,
      'reviews': reviews,
      'listedHouseIds': listedHouseIds,
      'registeredOn': registeredOn?.millisecondsSinceEpoch,
      'contracts': contracts,
      'offers': offers,
      'licenseNumber': licenseNumber,
      'numOfHouseSold': numOfHouseSold,
      'numOfRentedHouses': numOfRentedHouses,
      'userType': userType.name.toString(),
    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map["id"],
      userDetails: UserDetails.fromMap(map['userDetails']),
      storeName: map['storeName'] ?? '',
      storeImage: map['storeImage'],
      storephoneNum: map['storephoneNum'] ?? '',
      storeAddress: map['storeAddress'],
      storeDescription: map['storeDescription'],
      memberSince: DateTime.fromMillisecondsSinceEpoch(map['memberSince']),
      rating: map['rating']?.toDouble() ?? 0.0,
      reviews: List<String>.from(map['reviews']),
      listedHouseIds: List<String>.from(map['listedHouseIds']),
      registeredOn: map['registeredOn'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['registeredOn'])
          : null,
      contracts: List<String>.from(map['contracts']),
      offers: List<String>.from(map['offers']),
      licenseNumber: map['licenseNumber'] ?? '',
      numOfHouseSold: map['numOfHouseSold']?.toInt() ?? 0,
      numOfRentedHouses: map['numOfRentedHouses']?.toInt() ?? 0,
      userType: UserType.toUserType(map['userType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Seller.fromJson(String source) => Seller.fromMap(json.decode(source));
}

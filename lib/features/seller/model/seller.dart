import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';

class Seller {
  final UserDetails userDetails;
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
    required this.userDetails,
    required this.memberSince,
    required this.rating,
    required this.reviews,
    required this.listedHouseIds,
    required this.registeredOn,
    required this.contracts,
    required this.offers,
    required this.licenseNumber,
    required this.numOfHouseSold,
    required this.numOfRentedHouses,
    this.userType = UserType.seller,
  });

  int get totalListings => listedHouseIds.length;
  int get totalFeaturedListings => listedHouseIds.length;

  Map<String, dynamic> toMap() {
    return {
      'userDetails': userDetails.toMap(),
      'memberSince': memberSince.toIso8601String(),
      'rating': rating,
      'reviews': reviews,
      'listedHouseIds': listedHouseIds,
      'registeredOn': registeredOn?.toIso8601String(),
      'contracts': contracts,
      'offers': offers,
      'licenseNumber': licenseNumber,
      'numOfHouseSold': numOfHouseSold,
      'numOfRentedHouses': numOfRentedHouses,
      'userType': userType.toString(),
    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
        userDetails: UserDetails.fromMap(map['userDetails']),
        memberSince: DateTime.parse(map['memberSince']),
        rating: map['rating'],
        reviews: List<String>.from(map['reviews']),
        listedHouseIds: List<String>.from(map['listedHouseIds']),
        registeredOn: DateTime.parse(map['registeredOn']),
        contracts: List<String>.from(map['contracts']),
        offers: map["offers"],
        licenseNumber: map['licenseNumber'],
        numOfHouseSold: map['numOfHouseSold'],
        numOfRentedHouses: map['numOfRentedHouses'],
        userType: UserType.toUserType(map["userType"]));
  }
}

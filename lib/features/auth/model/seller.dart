import 'dart:developer';

import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';

class Seller {
  final UserDetails userDetails;
  final DateTime memberSince;
  final double rating;
  final List<String> reviews;
  final List<String> listedHouseIds;
  final DateTime registeredOn;
  final List<String> reviews;
  final List<String> contracts;
  final List<Request> request;
  final String licenseNumber;
  final int numOfhouseSold;
  final int numOfRentedHouses;
  final UserType userType;

  int get totalListings => listedHouseIds.length;
  int get totalFeaturedListings => listedHouseIds.length;
}

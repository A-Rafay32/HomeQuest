// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';

abstract class House {
  final String? name;
  final String description;
  final String? insurance;
  final String? features;
  final String? ownerId;
  final String address;
  final int roomQty;
  final int bathroomQty;
  final int sizeInFeet;
  final double? tax;
  final bool isFeatured;
  final bool isFurnished;
  final bool isAvailable;
  final List<String> images;
  final DateTime constructedOn;
  final HouseType housetype;

  House({
    required this.bathroomQty,
    required this.description,
    required this.roomQty,
    required this.sizeInFeet,
    required this.address,
    required this.housetype,
    required this.constructedOn,
    required this.ownerId,
    required this.images,
    required this.isFurnished,
    this.features,
    this.isFeatured = false,
    this.isAvailable = true,
    this.insurance,
    this.tax,
    this.name,
  });
}

RentalHouse demoHouse = RentalHouse(
    rentPerMonth: 6900000,
    name: "56 Green Bank, London",
    description: "Description",
    roomQty: 2,
    sizeInFeet: 100,
    address: "address",
    bathroomQty: 2,
    features: "",
    constructedOn: DateTime.now(),
    isFurnished: false,
    ownerId: "asdasd",
    insurance: null,
    isAvailable: true,
    isFeatured: true,
    tax: 69,
    housetype: HouseType.Rent,
    images: AppImages.houseImages);


// 7004 Bradtke Locks, South Jordon, Georgia, USA
// 56 Green Bank, London
// The roof is flat and is covered with slate shingles. One large chimney sits at the side of the house. Many smaller windows let in plenty of light to the rooms below the roof.
// The house itself is surrounded by a modest, childsafe garden covered mostly in grass and with a children's playground in the center.
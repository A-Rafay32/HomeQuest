// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';

class House {
  final String id;
  final String? name;
  final String description;
  final String? insurance;
  final String? features;
  final String? ownerId;
  final String address;
  final int roomQty;
  final int bathroomQty;
  final int sizeInFeet;
  // final double price;
  final double? tax;
  final bool isFeatured;
  final bool isFurnished;
  final bool isAvailable;
  final List<dynamic> images;
  final DateTime constructedOn;
  final HouseType housetype;

  House({
    required this.id,
    required this.bathroomQty,
    required this.description,
    required this.roomQty,
    required this.sizeInFeet,
    required this.address,
    required this.housetype,
    required this.constructedOn,
    required this.ownerId,
    required this.images,
    // required this.price,
    required this.isFurnished,
    this.features,
    this.isFeatured = false,
    this.isAvailable = true,
    this.insurance,
    this.tax,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      // 'price': price,
      'description': description,
      'insurance': insurance,
      'features': features,
      'ownerId': ownerId,
      'address': address,
      'roomQty': roomQty,
      'bathroomQty': bathroomQty,
      'sizeInFeet': sizeInFeet,
      'tax': tax,
      'isFeatured': isFeatured,
      'isFurnished': isFurnished,
      'isAvailable': isAvailable,
      'images': images,
      'constructedOn': constructedOn.millisecondsSinceEpoch,
      'housetype': housetype.toString(),
    };
  }

  factory House.fromMap(Map<String, dynamic> map) {
    return House(
        id: (map["id"] ?? '') as String,
        // price: (map["price"] ?? 0.0),
        name: map['name'] != null ? map["name"] ?? '' : null,
        description: (map["description"] ?? '') as String,
        insurance: map['insurance'] != null ? map["insurance"] ?? '' : null,
        features: map['features'] != null ? map["features"] ?? '' : null,
        ownerId: map['ownerId'] != null ? map["ownerId"] ?? '' : null,
        address: (map["address"] ?? '') as String,
        roomQty: (map["roomQty"] ?? 0) as int,
        bathroomQty: (map["bathroomQty"] ?? 0) as int,
        sizeInFeet: (map["sizeInFeet"] ?? 0) as int,
        tax: map['tax'] != null ? map["tax"] ?? 0.0 : null,
        isFeatured: (map["isFeatured"] ?? false) as bool,
        isFurnished: (map["isFurnished"] ?? false) as bool,
        isAvailable: (map["isAvailable"] ?? false) as bool,
        images: List<dynamic>.from(
          ((map['images'] ?? const <dynamic>[]) as List<dynamic>),
        ),
        constructedOn: DateTime.fromMillisecondsSinceEpoch(
            (map["constructedOn"] ?? 0) as int),
        housetype: HouseType.toHouseType(
          (map["housetype"]),
        ));
  }

  String toJson() => json.encode(toMap());

  factory House.fromJson(String source) =>
      House.fromMap(json.decode(source) as Map<String, dynamic>);
}

RentalHouse demoHouse = RentalHouse(
    id: "123",
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
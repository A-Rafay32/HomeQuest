// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/core/enums/house_type.dart';

class House {
  final String name;
  final String description;
  final double pricePerMonth;
  final double salePrice;
  final int roomQty;
  final int sizeInFeet;
  final String address;
  final String email;
  final int phoneNum;
  // Map<String, dynamic> extras;
  final HouseType housetype;
  final List<String> images;

  House({
    required this.name,
    required this.description,
    required this.pricePerMonth,
    required this.salePrice,
    required this.roomQty,
    required this.sizeInFeet,
    required this.address,
    required this.email,
    required this.phoneNum,
    required this.housetype,
    required this.images,
  });

  House copyWith({
    String? name,
    String? description,
    double? pricePerMonth,
    double? salePrice,
    int? roomQty,
    int? sizeInFeet,
    String? address,
    String? email,
    int? phoneNum,
    HouseType? housetype,
    List<String>? images,
  }) {
    return House(
      name: name ?? this.name,
      description: description ?? this.description,
      pricePerMonth: pricePerMonth ?? this.pricePerMonth,
      salePrice: salePrice ?? this.salePrice,
      roomQty: roomQty ?? this.roomQty,
      sizeInFeet: sizeInFeet ?? this.sizeInFeet,
      address: address ?? this.address,
      email: email ?? this.email,
      phoneNum: phoneNum ?? this.phoneNum,
      housetype: housetype ?? this.housetype,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'pricePerMonth': pricePerMonth,
      'salePrice': salePrice,
      'roomQty': roomQty,
      'sizeInFeet': sizeInFeet,
      'address': address,
      'email': email,
      'phoneNum': phoneNum,
      'housetype': housetype.toString(),
      'images': images,
    };
  }

  factory House.fromMap(Map<String, dynamic> map) {
    return House(
        name: map['name'] as String,
        description: map['description'] as String,
        pricePerMonth: map['pricePerMonth'] as double,
        salePrice: map['salePrice'] as double,
        roomQty: map['roomQty'] as int,
        sizeInFeet: map['sizeInFeet'] as int,
        address: map['address'] as String,
        email: map['email'] as String,
        phoneNum: map['phoneNum'] as int,
        housetype: HouseType.toHouseType(map['housetype']),
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory House.fromJson(String source) =>
      House.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'House(name: $name, description: $description, pricePerMonth: $pricePerMonth, salePrice: $salePrice, roomQty: $roomQty, sizeInFeet: $sizeInFeet, address: $address, email: $email, phoneNum: $phoneNum, housetype: $housetype, images: $images)';
  }

  @override
  bool operator ==(covariant House other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.pricePerMonth == pricePerMonth &&
        other.salePrice == salePrice &&
        other.roomQty == roomQty &&
        other.sizeInFeet == sizeInFeet &&
        other.address == address &&
        other.email == email &&
        other.phoneNum == phoneNum &&
        other.housetype == housetype &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        pricePerMonth.hashCode ^
        salePrice.hashCode ^
        roomQty.hashCode ^
        sizeInFeet.hashCode ^
        address.hashCode ^
        email.hashCode ^
        phoneNum.hashCode ^
        housetype.hashCode ^
        images.hashCode;
  }
}

House demoHouse = House(
    name: "56 Green Bank, London",
    description: "Description",
    pricePerMonth: 20,
    salePrice: 28.6,
    roomQty: 2,
    sizeInFeet: 100,
    address: "address",
    email: "",
    phoneNum: 0,
    housetype: HouseType.Rent,
    images: AppImages.houseImages);

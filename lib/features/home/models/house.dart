// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/core/enums/house_type.dart';

class House {
  final String name;
  final String description;
  final double pricePerMonth;
  final double salePrice;
  final int roomQty;
  final int bathroomQty;
  final int sizeInFeet;
  final String features;
  final String address;
  final String email;
  // Map<String, dynamic> extras;
  final HouseType housetype;
  final List<String> images;

  House({
    required this.name,
    required this.bathroomQty,
    required this.features,
    required this.description,
    required this.pricePerMonth,
    required this.salePrice,
    required this.roomQty,
    required this.sizeInFeet,
    required this.address,
    required this.email,
    required this.housetype,
    required this.images,
  });
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
    bathroomQty: 2,
    features: "",
    housetype: HouseType.Rent,
    images: AppImages.houseImages);

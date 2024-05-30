import 'package:real_estate_app/core/enums/house_status.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/models/house_details.dart';
import 'package:real_estate_app/features/home/models/house_location.dart';

class SellerHouse extends House {
  final DateTime? soldOn;
  final String boughtFrom;
  final String currentOwner;
  final double purchasePrice;
  final double extraCost;
  final double monthlyMortgageCost;
  final double mortgageInterest;

  SellerHouse({
    required String id,
    String? name,
    required String description,
    String? insurance,
    String? features,
    String? ownerId,
    bool isApproved = false,
    required String listedBy,
    double? propertyTax,
    required bool isFeatured,
    required bool isFurnished,
    required bool isAvailable,
    required List<dynamic> images,
    required DateTime constructedOn,
    required DateTime listedOn,
    required HouseDetails houseDetails,
    required HouseLocation houseLocation,
    required HouseStatus houseStatus,
    required HouseType houseType,
    this.soldOn,
    required this.boughtFrom,
    required this.currentOwner,
    required this.purchasePrice,
    required this.extraCost,
    required this.monthlyMortgageCost,
    required this.mortgageInterest,
  }) : super(
          id: id,
          name: name,
          description: description,
          insurance: insurance,
          features: features,
          ownerId: ownerId,
          listedBy: listedBy,
          propertyTax: propertyTax,
          isFeatured: isFeatured,
          isFurnished: isFurnished,
          isAvailable: isAvailable,
          isApproved: isApproved,
          images: images,
          constructedOn: constructedOn,
          listedOn: listedOn,
          houseDetails: houseDetails,
          houseLocation: houseLocation,
          houseStatus: houseStatus,
          houseType: houseType,
        );

  @override
  Map<String, dynamic> toMap() {
    final houseMap = super.toMap();
    houseMap.addAll({
      'soldOn': soldOn?.toIso8601String(),
      'boughtFrom': boughtFrom,
      'currentOwner': currentOwner,
      'purchasePrice': purchasePrice,
      'extraCost': extraCost,
      'monthlyMortgageCost': monthlyMortgageCost,
      'mortgageInterest': mortgageInterest,
    });
    return houseMap;
  }

  factory SellerHouse.fromMap(Map<String, dynamic> map) {
    return SellerHouse(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      insurance: map['insurance'],
      features: map['features'],
      ownerId: map['ownerId'],
      listedBy: map['listedBy'],
      propertyTax: map['propertyTax'],
      isFeatured: map['isFeatured'],
      isFurnished: map['isFurnished'],
      isAvailable: map['isAvailable'],
      images: List<dynamic>.from(map['images']),
      constructedOn: DateTime.parse(map['constructedOn']),
      listedOn: DateTime.parse(map['listedOn']),
      houseDetails: HouseDetails.fromMap(map['houseDetails']),
      houseLocation: HouseLocation.fromMap(map['houseLocation']),
      houseStatus: HouseStatus.toHouseStatus(map['houseStatus']),
      houseType: HouseType.toHouseType(map['houseType']),
      soldOn: map['soldOn'] != null ? DateTime.parse(map['soldOn']) : null,
      boughtFrom: map['boughtFrom'],
      currentOwner: map['currentOwner'],
      purchasePrice: map['purchasePrice'],
      extraCost: map['extraCost'],
      monthlyMortgageCost: map['monthlyMortgageCost'],
      mortgageInterest: map['mortgageInterest'],
    );
  }
}

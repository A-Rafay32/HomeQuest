import 'package:real_estate_app/core/enums/house_status.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/house_details.dart';
import 'package:real_estate_app/features/home/models/house_location.dart';

class House {
  final String id;
  final String? name;
  final String description;
  final String? insurance;
  final String? features;
  final String? ownerId;
  final String listedBy;
  final double? propertyTax;
  final bool isFeatured;
  final bool isFurnished;
  final bool isAvailable;
  final bool isApproved;
  final List<dynamic> images;
  final DateTime constructedOn;
  DateTime? listedOn;
  final HouseDetails houseDetails;
  final HouseLocation houseLocation;
  final HouseStatus houseStatus;
  final HouseType houseType;

  House({
    required this.id,
    this.name,
    required this.description,
    this.insurance,
    this.features,
    this.ownerId,
    required this.listedBy,
    this.propertyTax,
    required this.isFeatured,
    required this.isFurnished,
    required this.isAvailable,
    required this.isApproved,
    required this.images,
    required this.constructedOn,
    this.listedOn,
    required this.houseDetails,
    required this.houseLocation,
    required this.houseStatus,
    required this.houseType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'insurance': insurance,
      'features': features,
      'ownerId': ownerId,
      'listedBy': listedBy,
      'propertyTax': propertyTax,
      'isFeatured': isFeatured,
      'isFurnished': isFurnished,
      'isAvailable': isAvailable,
      'isApproved': isApproved,
      'images': images,
      'constructedOn': constructedOn.toIso8601String(),
      'listedOn': listedOn?.toIso8601String() ?? "",
      'houseDetails': houseDetails.toMap(),
      'houseLocation': houseLocation.toMap(),
      'houseStatus': houseStatus.toString(),
      'houseType': houseType.toString(),
    };
  }

  static House fromMap(Map<String, dynamic> map) {
    return House(
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
      isApproved: map['isApproved'],
      images: List<dynamic>.from(map['images']),
      constructedOn: DateTime.parse(map['constructedOn']),
      listedOn: DateTime.parse(map['listedOn'] ?? ""),
      houseDetails: HouseDetails.fromMap(map['houseDetails']),
      houseLocation: HouseLocation.fromMap(map['houseLocation']),
      houseStatus: HouseStatus.toHouseStatus(map['houseStatus']),
      houseType: HouseType.toHouseType(map['houseType']),
    );
  }
}

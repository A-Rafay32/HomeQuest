import 'package:real_estate_app/core/enums/house_status.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/home_review.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/models/house_details.dart';
import 'package:real_estate_app/features/home/models/house_location.dart';
import 'package:real_estate_app/features/home/models/maintenance.dart';

class RentalHouse extends House {
  final double rentPerMonth;
  final double? otherCosts;
  final String? tenantId;
  final DateTime? noticePeriod;
  final List<double>? penalties;
  final List<String>? terms;
  final List<String>? disputes;
  final List<String>? rentalHistory;
  final List<MaintenanceRequest>? maintenanceRequest;
  final List<RentalHomeReview>? reviews;

  RentalHouse({
    required String id,
    String? name,
    required String description,
    String? insurance,
    String? features,
    String? ownerId,
    required String listedBy,
    double? propertyTax,
    bool isApproved = false,
    required bool isFeatured,
    required bool isFurnished,
    required bool isAvailable,
    required List<dynamic> images,
    required DateTime constructedOn,
    DateTime? listedOn,
    required HouseDetails houseDetails,
    required HouseLocation houseLocation,
    required HouseStatus houseStatus,
    required HouseType houseType,
    required this.rentPerMonth,
    this.otherCosts,
    this.tenantId,
    this.noticePeriod,
    this.penalties,
    this.terms,
    this.disputes,
    this.rentalHistory,
    this.maintenanceRequest,
    this.reviews,
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
    final map = super.toMap();
    map.addAll({
      'rentPerMonth': rentPerMonth,
      'otherCosts': otherCosts,
      'tenantId': tenantId,
      'noticePeriod': noticePeriod?.toString(),
      'penalties': penalties,
      'rentalHistory': rentalHistory,
      'maintenanceRequest': maintenanceRequest?.map((req) => req.toMap()).toList(),
      'reviews': reviews?.map((review) => review.toMap()).toList(),
    });
    return map;
  }

  static RentalHouse fromMap(Map<String, dynamic> map) {
    return RentalHouse(
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
      listedOn: map['listedOn'] != null ?  DateTime.parse(map['listedOn']) : null, 
      houseDetails: HouseDetails.fromMap(map['houseDetails']),
      houseLocation: HouseLocation.fromMap(map['houseLocation']),
      houseStatus: HouseStatus.toHouseStatus(map['houseStatus']),
      houseType: HouseType.toHouseType(map['houseType']),
      rentPerMonth: map['rentPerMonth'],
      otherCosts: map['otherCosts'],
      tenantId: map['tenantId'],
      noticePeriod: map['noticePeriod'] != null ? DateTime.parse(map['noticePeriod']) : null,
      penalties: (map['penalties'] as List<dynamic>?)?.map((e) => e as double).toList(),
      terms: List<String>.from(map['terms'] ?? []),
      disputes: List<String>.from(map['disputes'] ?? []),
      rentalHistory: List<String>.from(map['rentalHistory'] ?? []),
      maintenanceRequest: (map['maintenanceRequest'] as List<dynamic>?)
          ?.map((e) => MaintenanceRequest.fromMap(e))
          .toList(),
      reviews: (map['reviews'] as List<dynamic>?)?.map((e) => RentalHomeReview.fromMap(e)).toList(),
    );
  }
}

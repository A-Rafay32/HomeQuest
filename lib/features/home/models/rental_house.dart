// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/bill/bill.dart';
import 'package:real_estate_app/features/home/models/home_review.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/models/maintenance.dart';

class RentalHouse extends House {
  final double rentPerMonth;
  final double? otherCosts;
  final String? tenantId;
  final DateTime? noticePeriod;
  final List<double>? penalties;
  final List<Bill>? bills;
  final List<String>? terms;
  final List<String>? disputes;
  final List<String>? rentalHistory;
  final List<MaintenanceRequest>? maintenanceRequest;
  final List<RentalHomeReview>? reviews;

  bool get isMaintenanceRequest => maintenanceRequest != null ? true : false;
  int get rentalCount => rentalHistory?.length ?? 0;
  bool get isRented => tenantId != null ? true : false;

  RentalHouse({
    required super.bathroomQty,
    required super.description,
    required super.roomQty,
    required super.sizeInFeet,
    required super.address,
    required super.constructedOn,
    required super.ownerId,
    required super.images,
    required super.isFurnished,
    required this.rentPerMonth,
    super.isFeatured = false,
    super.housetype = HouseType.Rent,
    super.isAvailable = true,
    super.insurance,
    super.tax,
    super.name,
    this.bills,
    this.disputes,
    this.maintenanceRequest,
    this.otherCosts,
    super.features,
    this.penalties,
    this.rentalHistory,
    this.reviews,
    this.noticePeriod,
    this.tenantId,
    this.terms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
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
      'housetype': housetype.name.toString(),
      'rentPerMonth': rentPerMonth,
      'otherCosts': otherCosts,
      'tenantId': tenantId,
      'noticePeriod': noticePeriod?.millisecondsSinceEpoch,
      'penalties': penalties,
      'bills': bills != null ? bills?.map((x) => x.toMap()).toList() : [],
      'terms': terms,
      'disputes': disputes,
      'rentalHistory': rentalHistory,
      'maintenanceRequest': maintenanceRequest != null
          ? maintenanceRequest?.map((x) => x.toMap()).toList()
          : [],
      'reviews': reviews != null ? reviews?.map((x) => x.toMap()).toList() : [],
    };
  }

  factory RentalHouse.fromMap(Map<String, dynamic> map) {
    return RentalHouse(
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] as String,
      insurance: map['insurance'] != null ? map['insurance'] as String : null,
      features: map['features'] as String,
      ownerId: map['ownerId'] as String,
      address: map['address'] as String,
      roomQty: map['roomQty'] as int,
      bathroomQty: map['bathroomQty'] as int,
      sizeInFeet: map['sizeInFeet'] as int,
      tax: map['tax'] != null ? map['tax'] as double : null,
      isFeatured: map['isFeatured'] as bool,
      isFurnished: map['isFurnished'] as bool,
      isAvailable: map['isAvailable'] as bool,
      images: List<String>.from((map['images'] as List<String>)),
      constructedOn:
          DateTime.fromMillisecondsSinceEpoch(map['constructedOn'] as int),
      housetype: HouseType.toHouseType(map['housetype']),
      rentPerMonth: map['rentPerMonth'] as double,
      otherCosts:
          map['otherCosts'] != null ? map['otherCosts'] as double : null,
      tenantId: map['tenantId'] != null ? map['tenantId'] as String : null,
      noticePeriod: map['noticePeriod'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['noticePeriod'] as int)
          : null,
      penalties: map['penalties'] != null
          ? List<double>.from((map['penalties'] as List<double>))
          : null,
      bills: map['bills'] != null
          ? List<Bill>.from(
              (map['bills'] as List<int>).map<Bill?>(
                (x) => Bill.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      terms: map['terms'] != null
          ? List<String>.from((map['terms'] as List<String>))
          : null,
      disputes: map['disputes'] != null
          ? List<String>.from((map['disputes'] as List<String>))
          : null,
      rentalHistory: map['rentalHistory'] != null
          ? List<String>.from((map['rentalHistory'] as List<String>))
          : null,
      maintenanceRequest: map['maintenanceRequest'] != null
          ? List<MaintenanceRequest>.from(
              (map['maintenanceRequest'] as List<int>).map<MaintenanceRequest?>(
                (x) => MaintenanceRequest.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      reviews: map['reviews'] != null
          ? List<RentalHomeReview>.from(
              (map['reviews'] as List<int>).map<RentalHomeReview?>(
                (x) => RentalHomeReview.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RentalHouse.fromJson(String source) =>
      RentalHouse.fromMap(json.decode(source) as Map<String, dynamic>);
}

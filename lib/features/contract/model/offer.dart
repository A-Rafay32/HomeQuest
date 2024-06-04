import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Offer {
  final double? offeredMoney;
  final double? settledMoney;
  final String? statement;
  final String createdBy;
  final String isSentTo;
  final String isAccepted;
  final OfferPurpose purpose;
  Offer({
    this.offeredMoney,
    this.settledMoney,
    this.statement,
    required this.createdBy,
    required this.isSentTo,
    required this.isAccepted,
    required this.purpose,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offeredMoney': offeredMoney,
      'settledMoney': settledMoney,
      'statement': statement,
      'createdBy': createdBy,
      'isSentTo': isSentTo,
      'isAccepted': isAccepted,
      'purpose': purpose.toString(),
    };
  }

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      offeredMoney: map['offeredMoney'] ?? 0.0,
      settledMoney: map['settledMoney'] ?? 0.0,
      statement: map['statement'] ?? "",
      createdBy: map['createdBy'] ?? "",
      isSentTo: map['isSentTo'] ?? "",
      isAccepted: map['isAccepted'] ?? "",
      purpose: OfferPurpose.toOfferPurpose(map['purpose']),
    );
  }
}

enum OfferPurpose {
  visit,
  buy;

  static OfferPurpose toOfferPurpose(String str) {
    return OfferPurpose.values.firstWhere((element) => element.name == str);
  }
}

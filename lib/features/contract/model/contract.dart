import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contract {
  final String seller;
  final String buyer;
  final String? agent;
  final String property;
  final String? depositedMoney;
  final String? installments;
  final List<String>? terms;
  final String isApprovedByBuyer;
  final bool isSentForApproval;
  final bool isApprovedBySeller;
  final String statement;
  final String documentsInfo;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  Contract({
    required this.seller,
    required this.buyer,
    this.agent,
    required this.property,
    this.depositedMoney,
    this.installments,
    this.terms,
    required this.isApprovedByBuyer,
    required this.isSentForApproval,
    required this.isApprovedBySeller,
    required this.statement,
    required this.documentsInfo,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seller': seller,
      'buyer': buyer,
      'agent': agent,
      'property': property,
      'depositedMoney': depositedMoney,
      'installments': installments,
      'terms': terms,
      'isApprovedByBuyer': isApprovedByBuyer,
      'isSentForApproval': isSentForApproval,
      'isApprovedBySeller': isApprovedBySeller,
      'statement': statement,
      'documentsInfo': documentsInfo,
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      seller: map['seller'] ?? "",
      buyer: map['buyer'] ?? "",
      agent: map['agent'] ?? "",
      property: map['property'] ?? "",
      depositedMoney: map['depositedMoney'] ?? "",
      installments: map['installments'] ?? "",
      terms: map['terms'] ?? [],
      isApprovedByBuyer: map['isApprovedByBuyer'] ?? "",
      isSentForApproval: map['isSentForApproval'] ?? false,
      isApprovedBySeller: map['isApprovedBySeller'] ?? false,
      statement: map['statement'] ?? "",
      documentsInfo: map['documentsInfo'] ?? "",
      createdBy: map['createdBy'] ?? "",
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? ""),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] ?? ""),
    );
  }
}

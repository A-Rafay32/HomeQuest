// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum BillStatus {
  due,
  paid,
  missed;

  static BillStatus toStatus(String str) {
    return BillStatus.values.firstWhere((element) => element.name == str);
  }
}

enum BillCategory {
  electric,
  water,
  gas,
  rent;

  static BillCategory toCategory(String str) {
    return BillCategory.values.firstWhere((element) => element.name == str);
  }
}

class Bill {
  String id;
  String houseId;
  String tenantId;
  double? lateFees;
  double amount;
  DateTime dateCreated;
  DateTime dueDate;
  DateTime paidDate;
  BillCategory category;
  BillStatus status;

  Bill({
    required this.category,
    this.id = "1",
    required this.houseId,
    this.lateFees,
    required this.paidDate,
    required this.dateCreated,
    required this.amount,
    required this.tenantId,
    required this.dueDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category.name.toString(),
      'status': status.name.toString(),
      'houseId': houseId,
      'tenantId': tenantId,
      'lateFees': lateFees,
      'amount': amount,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'paidDate': paidDate.millisecondsSinceEpoch,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      category: BillCategory.toCategory(map["category"]),
      status: BillStatus.toStatus(map["status"]),
      id: map['id'] ?? '',
      houseId: map['houseId'] ?? '',
      tenantId: map['tenantId'] ?? '',
      lateFees: map['lateFees']?.toDouble(),
      amount: map['amount']?.toDouble() ?? 0.0,
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      paidDate: DateTime.fromMillisecondsSinceEpoch(map['paidDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source));
}

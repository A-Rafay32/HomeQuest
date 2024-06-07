// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum Status {
  due,
  paid,
  missed;

  static Status toStatus(String str) {
    return Status.values.firstWhere((element) => element.name == str);
  }
}

enum Category {
  electric,
  gas,
  rent;

  static Category toCategory(String str) {
    return Category.values.firstWhere((element) => element.name == str);
  }
}

class Bill {
  String id;
  String houseId;
  String tenantId;
  String month;
  double amount;
  Category category;
  DateTime dueDate;
  DateTime paidDate;
  double? lateFees;
  Status status;

  Bill({
    required this.category,
    this.id = "1",
    required this.month,
    required this.houseId,
    required this.lateFees,
    required this.paidDate,
    required this.amount,
    required this.tenantId,
    required this.dueDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'houseId': houseId,
      'tenantId': tenantId,
      'month': month,
      'amount': amount,
      'category': category.toString(),
      'dueDate': dueDate.millisecondsSinceEpoch,
      'paidDate': paidDate.millisecondsSinceEpoch,
      'lateFees': lateFees,
      'status': status.toString(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'] as String,
      houseId: map['houseId'] as String,
      tenantId: map['tenantId'] as String,
      month: map['month'] as String,
      amount: map['amount'] as double,
      category: Category.toCategory(map['category']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      paidDate: DateTime.fromMillisecondsSinceEpoch(map['paidDate'] as int),
      lateFees: map['lateFees'] != null ? map['lateFees'] as double : null,
      status: Status.toStatus(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source) as Map<String, dynamic>);
}

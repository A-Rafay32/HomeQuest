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
  String month;
  int amount;
  Category category;
  DateTime date;
  Status status;

  Bill({
    required this.category,
    required this.month,
    required this.amount,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'month': month,
      'amount': amount,
      'category': category.name.toString(),
      'date': date.toIso8601String(),
      'status': status.name.toString(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      month: map['month'] as String,
      amount: map['amount'] as int,
      category: Category.toCategory(map['category']),
      date: DateTime.parse(map['date']),
      status: Status.toStatus(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) =>
      Bill.fromMap(json.decode(source) as Map<String, dynamic>);
}

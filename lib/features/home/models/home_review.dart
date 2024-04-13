// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RentalHomeReview {
  final String review;
  final String reviewer;
  final int stars;
  final DateTime dateReviewed;

  RentalHomeReview(
      {required this.review,
      required this.reviewer,
      required this.stars,
      required this.dateReviewed});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'review': review,
      'reviewer': reviewer,
      'stars': stars,
      'dateReviewed': dateReviewed.millisecondsSinceEpoch,
    };
  }

  factory RentalHomeReview.fromMap(Map<String, dynamic> map) {
    return RentalHomeReview(
      review: map['review'] as String,
      reviewer: map['reviewer'] as String,
      stars: map['stars'] as int,
      dateReviewed:
          DateTime.fromMillisecondsSinceEpoch(map['dateReviewed'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory RentalHomeReview.fromJson(String source) =>
      RentalHomeReview.fromMap(json.decode(source) as Map<String, dynamic>);
}

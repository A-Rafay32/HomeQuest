class Offer {
  final double? offeredMoney;
  final double? settledMoney;
  final String? statement;
  final String createdBy;
  final String isSentTo;
  final String isAccepted;
  final OfferPurpose purpose;
}

enum OfferPurpose { visit, buy }

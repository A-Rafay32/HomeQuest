// ignore: camel_case_types, constant_identifier_names

enum HouseStatus {
  Sale,
  Rent,
  Rented,
  Owned;

  static HouseStatus toHouseStatus(HouseStatus houseStatus) {
    return HouseStatus.Sale;
  }
}

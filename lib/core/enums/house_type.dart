// ignore: camel_case_types, constant_identifier_names

enum HouseType {
  forSale,
  forRent,
  Rented,
  Owned;

  static HouseType toHouseType(String str) {
    return HouseType.values.firstWhere((element) => element.name == str);
  }
}

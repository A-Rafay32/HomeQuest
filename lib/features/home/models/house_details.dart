class HouseDetails {
  final int roomQty;
  final int bathroomQty;
  final int sizeInFeet;
  final int livingRoomQty;
  final int balconyQty;
  final int kitchen;
  final int floors;
  final int parkingSpaces;
  final bool hasGarage;
  final bool hasTerrace;

  HouseDetails({
    required this.roomQty,
    required this.bathroomQty,
    required this.sizeInFeet,
    required this.livingRoomQty,
    required this.balconyQty,
    required this.kitchen,
    required this.floors,
    required this.parkingSpaces,
    required this.hasGarage,
    required this.hasTerrace,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomQty': roomQty,
      'bathroomQty': bathroomQty,
      'sizeInFeet': sizeInFeet,
      'livingRoomQty': livingRoomQty,
      'balconyQty': balconyQty,
      'kitchen': kitchen,
      'floors': floors,
      'parkingSpaces': parkingSpaces,
      'hasGarage': hasGarage,
      'hasTerrace': hasTerrace,
    };
  }

  factory HouseDetails.fromMap(Map<String, dynamic> map) {
    return HouseDetails(
      roomQty: map['roomQty'],
      bathroomQty: map['bathroomQty'],
      sizeInFeet: map['sizeInFeet'],
      livingRoomQty: map['livingRoomQty'],
      balconyQty: map['balconyQty'],
      kitchen: map['kitchen'],
      floors: map['floors'],
      parkingSpaces: map['parkingSpaces'],
      hasGarage: map['hasGarage'],
      hasTerrace: map['hasTerrace'],
    );
  }
}

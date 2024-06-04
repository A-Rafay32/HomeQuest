class HouseLocation {
  final String address;
  final String? state;
  final String? zipCode;
  final String? country;
  final double? latitude;
  final double? longitude;

  HouseLocation({
    required this.address,
    this.state,
    this.zipCode,
    this.country,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory HouseLocation.fromMap(Map<String, dynamic> map) {
    return HouseLocation(
      address: map['address'] ?? "",
      state: map['state'] ?? "",
      zipCode: map['zipCode'] ?? "",
      country: map['country'] ?? "",
      latitude: map['latitude'] ?? "",
      longitude: map['longitude'] ?? "",
    );
  }
}

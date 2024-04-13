import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/home/data/house_data_service.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';

class RentalHomeNotifier extends StateNotifier<RentalHomeService> {
  RentalHomeNotifier() : super(RentalHomeService.instance);

  RentalHomeService repository = RentalHomeService.instance;

  FutureEither0 addRentalHouse({
    required String name,
    required int bathroomQty,
    required String description,
    required int roomQty,
    required int sizeInFeet,
    required String address,
    required String housetype,
    required double rentPerMonth,
    required String ownerId,
  }) async {
    return await repository.addRentalHouse(
        name: name,
        bathroomQty: bathroomQty,
        description: description,
        roomQty: roomQty,
        sizeInFeet: sizeInFeet,
        address: address,
        housetype: housetype,
        rentPerMonth: rentPerMonth,
        ownerId: ownerId);
  }

  FutureEither0 deleteHouse() async {
    return await repository.deleteHouse();
  }

  Stream<RentalHouse> getAllRentalHouse() {
    return repository.getAllRentalHouse();
  }

  FutureEither0 updateHouse(
      String houseId, Map<String, dynamic> updatefields) async {
    return await repository.updateHouse(houseId, updatefields);
  }
}

final rentalHomeStateNotifier =
    StateNotifierProvider<RentalHomeNotifier, RentalHomeService>((ref) {
  return RentalHomeNotifier();
});

final rentalHomeRepository = Provider((ref) => RentalHomeService.instance);

final rentalHomeStreamProvider = StreamProvider((ref) {
  final repository = ref.read(rentalHomeRepository);
  return repository.getAllRentalHouse();
});

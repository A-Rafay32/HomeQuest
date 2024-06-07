import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/home/providers/rental_home_notifier.dart';
import 'package:real_estate_app/features/home/repositories/rental_home_repository.dart';

final rentalHomeNotifierProvider =
    StateNotifierProvider<RentalHomeNotifier, AsyncValue>((ref) {
  final repository = ref.read(rentalHomeRepository);
  return RentalHomeNotifier(repository: repository);
});

final rentalHomeRepository = Provider((ref) {
  return RentalHomeRepository();
});

final rentalHomeStreamProvider = StreamProvider((ref) {
  final repository = ref.read(rentalHomeRepository);
  return repository.getAllRentalHouse();
});

final availableRentalHomeStreamProvider = StreamProvider((ref) {
  final repository = ref.read(rentalHomeRepository);
  return repository.getAllAvailableRentalHouse();
});

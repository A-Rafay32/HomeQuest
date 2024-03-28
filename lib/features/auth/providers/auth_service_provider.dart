import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/features/auth/data/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

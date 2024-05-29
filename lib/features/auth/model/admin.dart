import 'package:real_estate_app/core/enums/user_type.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';
import 'package:real_estate_app/features/contract/model/contract.dart';

class Admin {
  final UserDetails userDetails;
  final List<String>? permissions;
  final UserType userType;
  final List<String >disapprovedHouses;
  final List<String > featuredHouses ;
  final List<Contract> contracts; 
}

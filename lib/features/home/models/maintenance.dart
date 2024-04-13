// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum MaintenanceRequestStatus {
  resolved,
  disapproved,
  approved;

  static MaintenanceRequestStatus toMaintenanceRequestStatus(String str) {
    return MaintenanceRequestStatus.values
        .firstWhere((element) => element.name == str);
  }
}

class MaintenanceRequest {
  final String details;
  final String houseId;
  final double maintenanceCost;
  final String? disapprovalReason;
  final DateTime resolvedoOn;
  final DateTime requestedOn;
  final MaintenanceRequestStatus status;

  MaintenanceRequest(
      {required this.details,
      required this.houseId,
      required this.maintenanceCost,
      required this.disapprovalReason,
      required this.resolvedoOn,
      required this.requestedOn,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'details': details,
      'houseId': houseId,
      'maintenanceCost': maintenanceCost,
      'disapprovalReason': disapprovalReason,
      'resolvedoOn': resolvedoOn.millisecondsSinceEpoch,
      'requestedOn': requestedOn.millisecondsSinceEpoch,
      'status': status.name.toString(),
    };
  }

  factory MaintenanceRequest.fromMap(Map<String, dynamic> map) {
    return MaintenanceRequest(
      details: map['details'] as String,
      houseId: map['houseId'] as String,
      maintenanceCost: map['maintenanceCost'] as double,
      disapprovalReason: map['disapprovalReason'] != null
          ? map['disapprovalReason'] as String
          : null,
      resolvedoOn:
          DateTime.fromMillisecondsSinceEpoch(map['resolvedoOn'] as int),
      requestedOn:
          DateTime.fromMillisecondsSinceEpoch(map['requestedOn'] as int),
      status:
          MaintenanceRequestStatus.toMaintenanceRequestStatus(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MaintenanceRequest.fromJson(String source) =>
      MaintenanceRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

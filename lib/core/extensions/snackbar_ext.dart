import 'package:flutter/material.dart';
import 'package:real_estate_app/core/utils/app_alerts.dart';

extension AppAlerts on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(snackBarContent(
      message: message,
      context: this,
    ));
  }
}

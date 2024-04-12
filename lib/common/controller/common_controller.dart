import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/country_time_zone.dart';

class CommonController extends GetxController with WidgetsBindingObserver {
  CommonController();

  String guestHelpUrl = '';

  CountryTimeZone? countryTimeZone;

  int orderStatusInterval = 0;

  int orderStatusTimeout = 0;

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
      default:
    }
  }
}

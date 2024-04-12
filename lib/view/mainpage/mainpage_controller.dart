import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainpageController extends GetxController with WidgetsBindingObserver {
  MainpageController();

  RxInt count = 0.obs;

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  increaseCount() {
    count++;
  }
}

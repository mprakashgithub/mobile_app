import 'dart:convert' as json_convert;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/app_constants.dart';
import 'controller/configuration_controller.dart';

class LoadLocalization {
  Future<Map<String, Map<String, String>>> init() async {
    Get.lazyPut(() => ConfigurationController());

    Map<String, Map<String, String>> languages = {};
    for (var languageModel in AppConstants.languages) {
      String jsonStringValues =
          await rootBundle.loadString(languageModel.jsonData);
      Map<String, dynamic> mappedJson =
          json_convert.json.decode(jsonStringValues);
      Map<String, String> json = {};

      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          json;
    }
    return languages;
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/local_storage_keys.dart';
import '../../../local_database/local_storage_manager.dart';
import '../../../utils/utils.dart';
import '../model/language_model.dart';

class ConfigurationController extends GetxController implements GetxService {
  ConfigurationController() {
    loadCurrentLanguage();
  }

  Rx<LanguageModel> selectedLanguage = AppConstants.languages.first.obs;

  Locale _locale = Locale(AppConstants.languages.first.languageCode,
      AppConstants.languages.first.countryCode);

  bool _isLtr = true;
  List<LanguageModel> _languages = [];

  Rx<Locale> get locale => _locale.obs;

  bool get isLtr => _isLtr;

  List<LanguageModel> get languages => _languages;

  setLanguage(LanguageModel languageData) {
    Locale locale = Locale(
      languageData.languageCode,
      languageData.countryCode,
    );

    Get.updateLocale(locale);
    _locale = locale;
    if (_locale.languageCode == 'bn') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }

    writeLocalData(LocalStorageKeys.LANGUAGE_CODE, locale.languageCode);

    selectedLanguage(languageData);
    update();
  }

  void loadCurrentLanguage() async {
    log("load language");
    _locale = Locale(
        await readLocalData<String>(LocalStorageKeys.LANGUAGE_CODE) ??
            AppConstants.languages.first.languageCode,
        await readLocalData<String>(LocalStorageKeys.COUNTRY_CODE) ??
            AppConstants.languages.first.countryCode);
    _isLtr = _locale.languageCode != 'bn';
    for (var element in AppConstants.languages) {
      if (element.languageCode == _locale.languageCode) {
        selectedLanguage.value = element;
        break;
      }
    }

    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  var isNetworkOverlayEnabled = false.obs;
  void toggleNetworkOverlayVisibility() {
    isNetworkOverlayEnabled
      ..toggle()
      ..refresh();
    showSnackBar(
        "Network Debug Overlay Button ${isNetworkOverlayEnabled.isTrue ? 'Enabled' : 'Disabled'}");
  }
}

class Messages extends Translations {
  final Map<String, Map<String, String>> languages;
  Messages(this.languages);

  @override
  Map<String, Map<String, String>> get keys => languages;
}

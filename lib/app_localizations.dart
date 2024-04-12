import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale? locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, String>? sentences;

  Future<bool> load() async {
    String data =
        await rootBundle.loadString('assets/json/${locale!.languageCode}.json');
    Map<String, dynamic> result = json.decode(data);

    sentences = {};
    result.forEach((String key, dynamic value) {
      sentences![key] = value.toString();
    });

    return true;
  }

  static String trans(String key) {
    return sentences?[key] ?? '$key not found.';
  }
}

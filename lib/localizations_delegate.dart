import 'package:flutter/material.dart';

import 'app_localizations.dart';

class LocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}

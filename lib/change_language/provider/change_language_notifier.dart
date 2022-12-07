import 'package:flutter/material.dart';
import 'package:grappus_mobile/utils/prefs.dart';

class ChangeLanguageNotifier with ChangeNotifier {
  String localeLanguageCode = Prefs.appLocalizationCode;

  void updateLocaleValue(String localeValue) {
    Prefs.appLocalizationCode = localeValue;
    localeLanguageCode = localeValue;
    notifyListeners();
  }
}

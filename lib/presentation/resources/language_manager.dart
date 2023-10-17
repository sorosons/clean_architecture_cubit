import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC, SPANISH, INDIA, FRENCH, DUTCH, TURKISH }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String SPANISH = "es";
const String INDIA = "hi";
const String FRENCH = "fr";
const String DUTCH = "de";
const String TURKISH = "tr";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";

const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");
const Locale SPANISH_LOCAL = Locale("es", "ES");
const Locale INDIA_LOCAL = Locale("hi", "IN");
const Locale FRENCH_LOCAL = Locale("fr", "FR");
const Locale DUTCH_LOCAL = Locale("de", "DE");
const Locale TURKISH_LOCAL = Locale("tr", "TR");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.SPANISH:
        return SPANISH;
      case LanguageType.INDIA:
        return INDIA;
      case LanguageType.FRENCH:
        return FRENCH;
      case LanguageType.DUTCH:
        return DUTCH;
      case LanguageType.TURKISH:
        return TURKISH;
    }
  }
}

part of 'locale.model.dart';

extension LocaleProfileExtension on LocaleProfile {
  Locale get locale {
    switch (this) {
      case LocaleProfile.english:
        return enLocale;
      case LocaleProfile.bengali:
        return bnLocale;
      default:
        return enLocale;
    }
  }

  String get localeName {
    switch (this) {
      case LocaleProfile.english:
        return 'English';
      case LocaleProfile.bengali:
        return 'Bengali';
      default:
        return 'English';
    }
  }
}

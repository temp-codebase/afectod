import 'package:afectod/app/common/locale/cubit/locale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'selected_locale';

  LocaleCubit() : super(const LocaleState());
  Future<void> loadLocaleFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeCode = prefs.getString(_localeKey);

      if (localeCode != null) {
        final locale = Locale(localeCode);
        emit(state.copyWith(locale: locale));
      }
    } catch (e) {
      //
    }
  }

  Future<void> changeLocale(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
      emit(state.copyWith(locale: locale));
    } catch (e) {
      //
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    final locale = Locale(languageCode);
    await changeLocale(locale);
  }

  Future<void> setTurkish() async {
    await changeLanguage('tr');
  }

  Future<void> setEnglish() async {
    await changeLanguage('en');
  }

  String getCurrentLanguageName() {
    switch (state.locale.languageCode) {
      case 'tr':
        return 'Türkçe';
      case 'en':
        return 'English';
      default:
        return 'Türkçe';
    }
  }
}

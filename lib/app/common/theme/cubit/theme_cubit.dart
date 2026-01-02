import 'package:afectod/app/common/theme/cubit/theme_state.dart';
import 'package:afectod/core/helpers/shared_preferences/file_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  Future<void> loadThemeFromStorage() async {
    try {
      final isDarkMode = await FileStorage.getData('is_dark_mode');
      if (isDarkMode == true) {
        emit(state.copyWith(themeMode: ThemeMode.dark));
      } else {
        emit(state.copyWith(themeMode: ThemeMode.light));
      }
    } catch (e) {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }

  Future<void> toggleTheme() async {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    try {
      await FileStorage.saveData(
        'is_dark_mode',
        newThemeMode == ThemeMode.dark,
      );
      emit(state.copyWith(themeMode: newThemeMode));
    } catch (e) {
      emit(state.copyWith(themeMode: newThemeMode));
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    try {
      await FileStorage.saveData('is_dark_mode', themeMode == ThemeMode.dark);
      emit(state.copyWith(themeMode: themeMode));
    } catch (e) {
      emit(state.copyWith(themeMode: themeMode));
    }
  }
}

import 'package:flutter/material.dart';
import 'theme_dark.dart';
import 'theme_light.dart';

class AppTheme {
  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
  
  static ThemeData getTheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  static ThemeData get defaultTheme => lightTheme;
}

import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static ThemeData get theme =>
      ThemeData(
        extensions: const <ThemeExtension<dynamic>>[
          CustomColors.dark,
        ],
        appBarTheme: const AppBarTheme(
          backgroundColor: AfectodColors.backgroundDark,
          foregroundColor: AfectodColors.white,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: AfectodColors.white),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: AfectodColors.surfaceDark,
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
          color: AfectodColors.backgroundDark,
        ),
        colorScheme: ColorScheme.dark(
          primary: AfectodColors.navyBlue,
          secondary: AfectodColors.navyBlue,
          surface: AfectodColors.surfaceDark,
          tertiary: AfectodColors.primaryGold,
        ),
        fontFamily: GoogleFonts.indieFlower().fontFamily,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AfectodColors.navyBlue,
          foregroundColor: AfectodColors.white,
          elevation: 0,
          splashColor: AfectodColors.transparent,
          highlightElevation: 0,
        ),
        scaffoldBackgroundColor: AfectodColors.backgroundDark,
        highlightColor: AfectodColors.transparent,
        splashColor: AfectodColors.transparent,
        dividerColor: AfectodColors.borderDark,
        useMaterial3: true,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      );
}

import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData get theme =>
      ThemeData(
        extensions: const <ThemeExtension<dynamic>>[
          CustomColors.light,
        ],
        appBarTheme: const AppBarTheme(
          backgroundColor: AfectodColors.background,
          foregroundColor: AfectodColors.textPrimary,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: AfectodColors.textPrimary),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: AfectodColors.surface,
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
          color: AfectodColors.background,
        ),
        colorScheme: ColorScheme.light(
          primary: AfectodColors.navyBlue,
          secondary: AfectodColors.navyBlue,
          surface: AfectodColors.surface,
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
        scaffoldBackgroundColor: AfectodColors.background,
        highlightColor: AfectodColors.transparent,
        splashColor: AfectodColors.transparent,
        dividerColor: AfectodColors.divider,
        useMaterial3: true,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      );
}

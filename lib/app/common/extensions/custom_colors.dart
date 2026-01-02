import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color profileCardBackground;
  final Color profileAvatarBackground;
  final Color profileAvatarBorder;
  final Color profileAvatarIcon;
  final Color profileTextPrimary;
  final Color profileTextSecondary;
  final Color borderColor;
  final Color bottomBarBackground;
  final Color bottomBarBorder;
  final Color bottomBarItemUnselected;
  final Color navBarDiscoverColor;
  final Color navBarFavoritesColor;
  final Color navBarSettingsColor;

  const CustomColors({
    required this.profileCardBackground,
    required this.profileAvatarBackground,
    required this.profileAvatarBorder,
    required this.profileAvatarIcon,
    required this.profileTextPrimary,
    required this.profileTextSecondary,
    required this.borderColor,
    required this.bottomBarBackground,
    required this.bottomBarBorder,
    required this.bottomBarItemUnselected,
    required this.navBarDiscoverColor,
    required this.navBarFavoritesColor,
    required this.navBarSettingsColor,
  });

  static const light = CustomColors(
    profileCardBackground: AfectodColors.background,
    profileAvatarBackground: AfectodColors.lightGrey,
    profileAvatarBorder: AfectodColors.lightGrey,
    profileAvatarIcon: AfectodColors.black,
    profileTextPrimary: AfectodColors.black,
    profileTextSecondary: AfectodColors.black,
    borderColor: AfectodColors.lightGrey,
    bottomBarBackground: AfectodColors.background,
    bottomBarBorder: AfectodColors.lightGrey,
    bottomBarItemUnselected: AfectodColors.unSelected,
    navBarDiscoverColor: AfectodColors.navyBlue,
    navBarFavoritesColor: AfectodColors.error,
    navBarSettingsColor: AfectodColors.borderDark,
  );

  static const dark = CustomColors(
    profileCardBackground: AfectodColors.surfaceDark,
    profileAvatarBackground: AfectodColors.backgroundDark,
    profileAvatarBorder: AfectodColors.borderDark,
    profileAvatarIcon: AfectodColors.navyBlue,
    profileTextPrimary: AfectodColors.white,
    profileTextSecondary: AfectodColors.white,
    borderColor: AfectodColors.borderDark,
    bottomBarBackground: AfectodColors.backgroundDark,
    bottomBarBorder: AfectodColors.borderDark,
    bottomBarItemUnselected: AfectodColors.unSelected,
    navBarDiscoverColor: AfectodColors.neonBlue,
    navBarFavoritesColor: AfectodColors.neonPink,
    navBarSettingsColor: AfectodColors.neonGray,
  );

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? profileCardBackground,
    Color? profileAvatarBackground,
    Color? profileAvatarBorder,
    Color? profileAvatarIcon,
    Color? profileTextPrimary,
    Color? profileTextSecondary,
    Color? borderColor,
    Color? bottomBarBackground,
    Color? bottomBarBorder,
    Color? bottomBarItemUnselected,
    Color? navBarDiscoverColor,
    Color? navBarFavoritesColor,
    Color? navBarSettingsColor,
  }) {
    return CustomColors(
      profileCardBackground:
          profileCardBackground ?? this.profileCardBackground,
      profileAvatarBackground:
          profileAvatarBackground ?? this.profileAvatarBackground,
      profileAvatarBorder: profileAvatarBorder ?? this.profileAvatarBorder,
      profileAvatarIcon: profileAvatarIcon ?? this.profileAvatarIcon,
      profileTextPrimary: profileTextPrimary ?? this.profileTextPrimary,
      profileTextSecondary: profileTextSecondary ?? this.profileTextSecondary,
      borderColor: borderColor ?? this.borderColor,
      bottomBarBackground: bottomBarBackground ?? this.bottomBarBackground,
      bottomBarBorder: bottomBarBorder ?? this.bottomBarBorder,
      bottomBarItemUnselected:
          bottomBarItemUnselected ?? this.bottomBarItemUnselected,
      navBarDiscoverColor: navBarDiscoverColor ?? this.navBarDiscoverColor,
      navBarFavoritesColor: navBarFavoritesColor ?? this.navBarFavoritesColor,
      navBarSettingsColor: navBarSettingsColor ?? this.navBarSettingsColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      profileCardBackground: Color.lerp(
        profileCardBackground,
        other.profileCardBackground,
        t,
      )!,
      profileAvatarBackground: Color.lerp(
        profileAvatarBackground,
        other.profileAvatarBackground,
        t,
      )!,
      profileAvatarBorder: Color.lerp(
        profileAvatarBorder,
        other.profileAvatarBorder,
        t,
      )!,
      profileAvatarIcon: Color.lerp(
        profileAvatarIcon,
        other.profileAvatarIcon,
        t,
      )!,
      profileTextPrimary: Color.lerp(
        profileTextPrimary,
        other.profileTextPrimary,
        t,
      )!,
      profileTextSecondary: Color.lerp(
        profileTextSecondary,
        other.profileTextSecondary,
        t,
      )!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      bottomBarBackground: Color.lerp(
        bottomBarBackground,
        other.bottomBarBackground,
        t,
      )!,
      bottomBarBorder: Color.lerp(bottomBarBorder, other.bottomBarBorder, t)!,
      bottomBarItemUnselected: Color.lerp(
        bottomBarItemUnselected,
        other.bottomBarItemUnselected,
        t,
      )!,
      navBarDiscoverColor: Color.lerp(
        navBarDiscoverColor,
        other.navBarDiscoverColor,
        t,
      )!,
      navBarFavoritesColor: Color.lerp(
        navBarFavoritesColor,
        other.navBarFavoritesColor,
        t,
      )!,
      navBarSettingsColor: Color.lerp(
        navBarSettingsColor,
        other.navBarSettingsColor,
        t,
      )!,
    );
  }
}

extension CustomColorsExtension on BuildContext {
  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;
}

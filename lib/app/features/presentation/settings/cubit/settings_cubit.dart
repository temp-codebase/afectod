import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/enums/settings_item_type.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/locale/cubit/locale_cubit.dart';
import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/common/theme/cubit/theme_cubit.dart';
import 'package:afectod/app/features/data/models/logic/settings_item_model.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:afectod/app/features/presentation/settings/cubit/settings_state.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_picker.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthService _authService;

  SettingsCubit(this._authService) : super(const SettingsState()) {
    loadPackageInfo();
  }

  Future<void> loadPackageInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();
      emit(state.copyWith(packageInfo: info, isLoading: false));
    } catch (e) {
      debugPrint('Package info yüklenemedi: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  void changeLanguage(String language) {
    emit(state.copyWith(selectedLanguage: language));
  }

  List<SettingsItemModel> getAppearanceItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeState = context.read<ThemeCubit>().state;
    final isDarkMode = themeState.themeMode == ThemeMode.dark;
    return [
      SettingsItemModel(
        title: l10n.settingsDarkTheme,
        subtitle: l10n.settingsDarkThemeSubtitle,
        icon: isDarkMode ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max,
        iconColor: isDarkMode ? AfectodColors.navyBlue : AfectodColors.black,
        type: SettingsItemType.toggle,
        getSwitchValue: () {
          final themeState = context.read<ThemeCubit>().state;
          return themeState.themeMode == ThemeMode.dark;
        },
        onSwitchChanged: (context, value) {
          context.read<ThemeCubit>().toggleTheme();
        },
        switchActiveColor: AfectodColors.navyBlue,
      ),
    ];
  }

  List<SettingsItemModel> getLanguageItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeCubit = context.read<LocaleCubit>();
    return [
      SettingsItemModel(
        title: l10n.settingsLanguage,
        subtitle: localeCubit.getCurrentLanguageName(),
        icon: CupertinoIcons.globe,
        type: SettingsItemType.navigation,
        onTap: (context) {
          _showLanguagePicker(context);
        },
      ),
    ];
  }

  void _showLanguagePicker(BuildContext context) {
    final languages = ['Türkçe', 'English'];
    final localeCubit = context.read<LocaleCubit>();

    SettingsPicker.showLanguagePicker(
      context: context,
      currentLanguage: localeCubit.getCurrentLanguageName(),
      languages: languages,
      onLanguageSelected: (language) {
        if (language == 'Türkçe') {
          localeCubit.setTurkish();
        } else if (language == 'English') {
          localeCubit.setEnglish();
        }
        changeLanguage(language);
      },
    );
  }

  List<SettingsItemModel> getAccountItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      SettingsItemModel(
        title: l10n.settingsChangePassword,
        icon: CupertinoIcons.lock_fill,
        type: SettingsItemType.navigation,
        onTap: (context) {
          context.router.push(const ChangePasswordRoute());
        },
      ),
      SettingsItemModel(
        title: l10n.settingsLogout,
        icon: CupertinoIcons.square_arrow_right,
        iconColor: AfectodColors.error,
        type: SettingsItemType.navigation,
        onTap: (context) {
          _showLogoutDialog(context);
        },
      ),
    ];
  }

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderHelper.thirtyFive.circular,
        ),
        title: Text(
          l10n.settingsLogout,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: context.customColors.profileTextPrimary,
          ),
        ),
        content: Text(
          l10n.settingsLogoutConfirm,
          style: TextStyle(color: context.customColors.profileTextSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            child: Text(
              l10n.cancel,
              style: TextStyle(
                color: context.customColors.profileTextSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              context.router.pop();
              await _authService.logout();
              if (context.mounted) {
                context.read<MainCubit>().resetIndex();
                context.router.replaceAll([const AuthRoute()]);
              }
            },
            child: Text(
              l10n.settingsLogout,
              style: const TextStyle(
                color: AfectodColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

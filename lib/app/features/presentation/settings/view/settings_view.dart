import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/common/theme/cubit/theme_cubit.dart';
import 'package:afectod/app/common/theme/cubit/theme_state.dart';
import 'package:afectod/app/common/widgets/appbar/afectod_appbar.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/app/features/presentation/settings/cubit/settings_cubit.dart';
import 'package:afectod/app/features/presentation/settings/cubit/settings_state.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_column.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_info_card.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_item_builder.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_profile_card.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = getIt<AuthService>().getCurrentUser();
    final cubit = getIt.get<SettingsCubit>();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, settingsState) {
            return AfectodScaffold(
              appBar: AfectodAppBar(title: l10n.settingsTitle),
              body: SingleChildScrollView(
                padding: PaddingHelper.sixteen.allWithBottomNavigationBar,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: PaddingHelper.sixteen.value,
                  children: [
                    if (currentUser != null)
                      SettingsProfileCard(
                        userName: currentUser.username,
                        userEmail: currentUser.email,
                      ),
                    SettingsColumn(
                      title: l10n.settingsAppearance,
                      children: cubit
                          .getAppearanceItems(context)
                          .map((item) => SettingsItemBuilder(item: item))
                          .toList(),
                    ),
                    SettingsColumn(
                      title: l10n.settingsLanguageRegion,
                      children: cubit
                          .getLanguageItems(context)
                          .map((item) => SettingsItemBuilder(item: item))
                          .toList(),
                    ),
                    SettingsColumn(
                      title: l10n.settingsAccount,
                      children: cubit
                          .getAccountItems(context)
                          .map((item) => SettingsItemBuilder(item: item))
                          .toList(),
                    ),
                    if (settingsState.packageInfo != null)
                      SettingsInfoCard(packageInfo: settingsState.packageInfo!),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

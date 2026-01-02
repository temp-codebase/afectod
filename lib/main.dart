import 'package:afectod/app/common/function/afectod_function.dart';
import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/common/locale/cubit/locale_cubit.dart';
import 'package:afectod/app/common/locale/cubit/locale_state.dart';
import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/common/theme/app_theme.dart';
import 'package:afectod/app/common/theme/cubit/theme_cubit.dart';
import 'package:afectod/app/common/theme/cubit/theme_state.dart';
import 'package:afectod/app/features/presentation/auth/cubit/auth_cubit.dart';
import 'package:afectod/app/features/presentation/auth/cubit/change_password_cubit.dart';
import 'package:afectod/app/features/presentation/discover/cubit/discover_cubit.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_cubit.dart';
import 'package:afectod/app/features/presentation/settings/cubit/settings_cubit.dart';
import 'package:afectod/app/features/presentation/splash/cubit/splash_cubit.dart';
import 'package:afectod/core/helpers/screen_util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

void main() async {
  await AfectodFunctions.init();
  runApp(const AfectodApp());
}

class AfectodApp extends StatelessWidget {
  const AfectodApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<ThemeCubit>()),
        BlocProvider(create: (context) => getIt.get<LocaleCubit>()),
        BlocProvider(create: (context) => getIt.get<SplashCubit>()),
        BlocProvider(create: (context) => getIt.get<MainCubit>()),
        BlocProvider(create: (context) => getIt.get<DiscoverCubit>()),
        BlocProvider(create: (context) => getIt.get<SettingsCubit>()),
        BlocProvider(create: (context) => getIt.get<FavoritesCubit>()),
        BlocProvider(create: (context) => getIt.get<AuthCubit>()),
        BlocProvider(create: (context) => getIt.get<ChangePasswordCubit>()),
        BlocProvider(create: (context) => getIt.get<SearchCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: getIt.get<AppRouter>().config(),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('tr', 'TR'),
                  Locale('en', 'EN'),
                ],
                locale: localeState.locale,
              );
            },
          );
        },
      ),
    );
  }
}

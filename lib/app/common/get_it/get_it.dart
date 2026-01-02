import 'package:afectod/app/common/locale/cubit/locale_cubit.dart';
import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/common/theme/cubit/theme_cubit.dart';
import 'package:afectod/app/features/data/datasources/home_remote_datasources.dart';
import 'package:afectod/app/features/data/datasources/i_home_remote_datasource.dart';
import 'package:afectod/app/features/data/repositories/home_repository.dart';
import 'package:afectod/app/features/data/repositories/i_home_repository.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/app/features/data/services/favorites_service.dart';
import 'package:afectod/app/features/data/services/search_history_service.dart';
import 'package:afectod/app/features/presentation/auth/cubit/auth_cubit.dart';
import 'package:afectod/app/features/presentation/auth/cubit/change_password_cubit.dart';
import 'package:afectod/app/features/presentation/discover/cubit/discover_cubit.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_cubit.dart';
import 'package:afectod/app/features/presentation/settings/cubit/settings_cubit.dart';
import 'package:afectod/app/features/presentation/splash/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  setupRouter();
  setupRepository();
  setupDataSource();
  setupServices();
  setupCubit();
}

void setupRouter() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}

void setupRepository() {
  getIt.registerLazySingleton<IHomeRepository>(
    () => HomeRepositoryImpl(remoteDatasource: getIt()),
  );
}

void setupDataSource() {
  getIt.registerLazySingleton<IHomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(),
  );
}

void setupServices() {
  getIt
    ..registerSingleton<AuthService>(AuthService())
    ..registerSingleton<FavoritesService>(FavoritesService())
    ..registerSingleton<SearchHistoryService>(SearchHistoryService());
}

void setupCubit() {
  getIt
    ..registerLazySingleton<ThemeCubit>(
      () => ThemeCubit()..loadThemeFromStorage(),
    )
    ..registerLazySingleton<LocaleCubit>(
      () => LocaleCubit()..loadLocaleFromStorage(),
    )
    ..registerLazySingleton<SplashCubit>(() => SplashCubit(getIt(), getIt()))
    ..registerLazySingleton<MainCubit>(() => MainCubit())
    ..registerLazySingleton<SettingsCubit>(() => SettingsCubit(getIt()))
    ..registerLazySingleton<FavoritesCubit>(() => FavoritesCubit(getIt()))
    ..registerFactory<AuthCubit>(() => AuthCubit(getIt()))
    ..registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()))
    ..registerFactory<DiscoverCubit>(
      () => DiscoverCubit(homeRepository: getIt()),
    )
    ..registerFactory<SearchCubit>(() => SearchCubit(getIt(), getIt()));
}

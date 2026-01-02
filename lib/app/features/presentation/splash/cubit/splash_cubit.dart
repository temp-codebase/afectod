import 'dart:async';

import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/common/theme/cubit/theme_cubit.dart';
import 'package:afectod/app/common/theme/cubit/theme_state.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthService _authService;
  final ThemeCubit _themeCubit;
  StreamSubscription<ThemeState>? _themeSubscription;
  SplashCubit(this._authService, this._themeCubit)
    : super(const SplashState()) {
    _themeSubscription = _themeCubit.stream.listen((themeState) {
      emit(state.copyWith(themeMode: themeState.themeMode));
    });
    emit(state.copyWith(themeMode: _themeCubit.state.themeMode));
  }

  @override
  Future<void> close() {
    _themeSubscription?.cancel();
    return super.close();
  }

  Future<void> checkLoginStatus() async {
    emit(state.copyWith(status: SplashStatus.loading));
    try {
      final isLoggedIn = _authService.isLoggedIn();
      if (isLoggedIn) {
        emit(state.copyWith(status: SplashStatus.loggedIn));
        getIt.get<AppRouter>().replace(const MainRoute());
      } else {
        emit(state.copyWith(status: SplashStatus.loggedOut));
        getIt.get<AppRouter>().replace(const AuthRoute());
      }
    } catch (e) {
      emit(
        state.copyWith(status: SplashStatus.error, errorMessage: e.toString()),
      );
      getIt.get<AppRouter>().replace(const AuthRoute());
    }
  }
}

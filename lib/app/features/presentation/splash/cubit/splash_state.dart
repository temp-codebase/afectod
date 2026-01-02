part of 'splash_cubit.dart';

enum SplashStatus { initial, loading, loggedIn, loggedOut, error }

final class SplashState extends Equatable {
  final SplashStatus status;
  final String? errorMessage;
  final ThemeMode themeMode;

  const SplashState({
    this.status = SplashStatus.initial,
    this.errorMessage,
    this.themeMode = ThemeMode.system,
  });

  SplashState copyWith({
    SplashStatus? status,
    String? errorMessage,
    ThemeMode? themeMode,
  }) {
    return SplashState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  String get splashAnimationPath {
    return themeMode == ThemeMode.dark
        ? 'assets/lotties/splash_dark.json'
        : 'assets/lotties/splash_light.json';
  }

  @override
  List<Object?> get props => [status, errorMessage, themeMode];
}

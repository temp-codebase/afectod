import 'package:afectod/app/features/data/models/auth/user_model.dart';
import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, success, error }
enum AuthMode { login, register }

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthMode mode;
  final String? errorMessage;
  final UserModel? user;
  final bool obscurePassword;
  final bool obscureConfirmPassword;

  const AuthState({
    this.status = AuthStatus.initial,
    this.mode = AuthMode.login,
    this.errorMessage,
    this.user,
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthMode? mode,
    String? errorMessage,
    UserModel? user,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
  }) {
    return AuthState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      errorMessage: errorMessage,
      user: user ?? this.user,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }

  @override
  List<Object?> get props => [
        status,
        mode,
        errorMessage,
        user,
        obscurePassword,
        obscureConfirmPassword,
      ];
}


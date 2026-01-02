import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/app/features/presentation/auth/cubit/auth_state.dart';
import 'package:afectod/app/features/presentation/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCubit(this._authService) : super(const AuthState());

  void toggleMode() {
    emit(
      state.copyWith(
        mode: state.mode == AuthMode.login ? AuthMode.register : AuthMode.login,
        errorMessage: null,
      ),
    );
    _clearControllers();
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    final result = await _authService.login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    if (result.success) {
      _clearControllers();
      emit(state.copyWith(status: AuthStatus.success, user: result.user));
    } else {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: result.error),
      );
    }
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    final result = await _authService.register(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    if (result.success) {
      _clearControllers();
      emit(state.copyWith(status: AuthStatus.success, user: result.user));
    } else {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: result.error),
      );
    }
  }

  void _clearControllers() {
    getIt.get<MainCubit>().resetIndex();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void reset() {
    _clearControllers();
    emit(const AuthState());
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}

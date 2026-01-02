import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/app/features/presentation/auth/cubit/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthService _authService;
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ChangePasswordCubit(this._authService) : super(const ChangePasswordState());

  void toggleCurrentPasswordVisibility() {
    emit(state.copyWith(obscureCurrentPassword: !state.obscureCurrentPassword));
  }

  void toggleNewPasswordVisibility() {
    emit(state.copyWith(obscureNewPassword: !state.obscureNewPassword));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: ChangePasswordStatus.loading, errorMessage: null));
    final result = await _authService.changePassword(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );
    if (result.success) {
      emit(state.copyWith(status: ChangePasswordStatus.success));
      _clearControllers();
    } else {
      emit(state.copyWith(
        status: ChangePasswordStatus.error,
        errorMessage: result.error,
      ));
    }
  }

  void _clearControllers() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}


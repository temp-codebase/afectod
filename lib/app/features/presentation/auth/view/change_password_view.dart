import 'package:afectod/app/common/widgets/appbar/afectod_appbar.dart';
import 'package:afectod/app/common/widgets/button/afectod_button.dart';
import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/features/presentation/auth/cubit/change_password_cubit.dart';
import 'package:afectod/app/features/presentation/auth/cubit/change_password_state.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_error_handler.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_form_container.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_password_field.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_validators.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

@RoutePage()
class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<ChangePasswordCubit>();

    return AfectodScaffold(
      appBar: AfectodAppBar(
        title: l10n.change_password_title,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
      ),
      body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state.status == ChangePasswordStatus.success) {
            AuthErrorHandler.showSuccess(context, l10n.change_password_success);
            context.router.pop();
          } else if (state.status == ChangePasswordStatus.error && state.errorMessage != null) {
            AuthErrorHandler.show(context, l10n, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return AuthFormContainer(
            verticalPadding: 24,
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AfectodGap.l,
                  Text(
                    l10n.change_password_subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  AfectodGap.xxl,
                  AuthPasswordField(
                    controller: cubit.currentPasswordController,
                    label: l10n.change_password_current,
                    hint: l10n.change_password_current_hint,
                    obscureText: state.obscureCurrentPassword,
                    onToggleVisibility: cubit.toggleCurrentPasswordVisibility,
                    validator: (value) => AuthValidators.currentPassword(value, l10n),
                  ),
                  AfectodGap.l,
                  AuthPasswordField(
                    controller: cubit.newPasswordController,
                    label: l10n.change_password_new,
                    hint: l10n.change_password_new_hint,
                    obscureText: state.obscureNewPassword,
                    onToggleVisibility: cubit.toggleNewPasswordVisibility,
                    validator: (value) => AuthValidators.newPassword(
                      value,
                      cubit.currentPasswordController.text,
                      l10n,
                    ),
                  ),
                  AfectodGap.l,
                  AuthPasswordField(
                    controller: cubit.confirmPasswordController,
                    label: l10n.change_password_confirm,
                    hint: l10n.change_password_confirm_hint,
                    obscureText: state.obscureConfirmPassword,
                    onToggleVisibility: cubit.toggleConfirmPasswordVisibility,
                    validator: (value) => AuthValidators.confirmPassword(
                      value,
                      cubit.newPasswordController.text,
                      l10n,
                    ),
                  ),
                  AfectodGap.xxl,
                  Center(
                    child: state.status == ChangePasswordStatus.loading
                        ? const CircularProgressIndicator()
                        : AfectodButton(
                            onPressed: cubit.changePassword,
                            title: l10n.change_password_button,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



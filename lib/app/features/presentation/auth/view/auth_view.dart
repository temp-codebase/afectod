import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/router/app_router.dart';
import 'package:afectod/app/common/widgets/button/afectod_button.dart';
import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/common/widgets/textfield/afectod_textfield.dart';
import 'package:afectod/app/features/presentation/auth/cubit/auth_cubit.dart';
import 'package:afectod/app/features/presentation/auth/cubit/auth_state.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_error_handler.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_form_container.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_header.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_password_field.dart';
import 'package:afectod/app/features/presentation/auth/widget/auth_validators.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<AuthCubit>();

    return AfectodScaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.router.replace(const MainRoute());
          } else if (state.status == AuthStatus.error &&
              state.errorMessage != null) {
            AuthErrorHandler.show(context, l10n, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return AuthFormContainer(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: state.mode == AuthMode.login
                        ? l10n.auth_welcome_back
                        : l10n.auth_create_account,
                    subtitle: state.mode == AuthMode.login
                        ? l10n.auth_login_subtitle
                        : l10n.auth_register_subtitle,
                  ),
                  if (state.mode == AuthMode.register) ...[
                    AfectodTextField(
                      controller: cubit.usernameController,
                      label: l10n.auth_username,
                      hintText: l10n.auth_username_hint,
                      prefixIcon: Icons.person_outline,
                      validator: (value) =>
                          AuthValidators.username(value, l10n),
                    ),
                    AfectodGap.m,
                  ],
                  AfectodTextField(
                    controller: cubit.emailController,
                    label: l10n.auth_email,
                    hintText: l10n.auth_email_hint,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AuthValidators.email(value, l10n),
                  ),
                  AfectodGap.m,
                  AuthPasswordField(
                    controller: cubit.passwordController,
                    label: l10n.auth_password,
                    hint: l10n.auth_password_hint,
                    obscureText: state.obscurePassword,
                    onToggleVisibility: cubit.togglePasswordVisibility,
                    validator: (value) => AuthValidators.password(value, l10n),
                  ),
                  if (state.mode == AuthMode.register) ...[
                    AfectodGap.m,
                    AuthPasswordField(
                      controller: cubit.confirmPasswordController,
                      label: l10n.auth_confirm_password,
                      hint: l10n.auth_confirm_password_hint,
                      obscureText: state.obscureConfirmPassword,
                      onToggleVisibility: cubit.toggleConfirmPasswordVisibility,
                      validator: (value) => AuthValidators.confirmPassword(
                        value,
                        cubit.passwordController.text,
                        l10n,
                      ),
                    ),
                  ],
                  AfectodGap.xl,
                  Center(
                    child: state.status == AuthStatus.loading
                        ? const CircularProgressIndicator()
                        : AfectodButton(
                            onPressed: state.mode == AuthMode.login
                                ? cubit.login
                                : cubit.register,
                            title: state.mode == AuthMode.login
                                ? l10n.auth_login
                                : l10n.auth_register,
                          ),
                  ),
                  AfectodGap.l,
                  Center(
                    child: TextButton(
                      onPressed: cubit.toggleMode,
                      child: Text(
                        state.mode == AuthMode.login
                            ? l10n.auth_dont_have_account
                            : l10n.auth_already_have_account,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AfectodColors.navyBlue,
                        ),
                      ),
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

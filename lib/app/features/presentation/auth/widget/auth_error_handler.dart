import 'package:afectod/app/common/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AuthErrorHandler {
  static void show(BuildContext context, AppLocalizations l10n, String errorKey) {
    final message = switch (errorKey) {
      'auth_email_already_exists' => l10n.auth_email_already_exists,
      'auth_email_not_found' => l10n.auth_email_not_found,
      'auth_password_mismatch' => l10n.auth_password_mismatch,
      'auth_current_password_wrong' => l10n.change_password_current_wrong,
      _ => l10n.auth_error_occurred,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}


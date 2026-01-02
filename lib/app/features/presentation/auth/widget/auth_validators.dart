import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class AuthValidators {
  static String? username(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.auth_username_required;
    if (value.length < 3) return l10n.auth_username_too_short;
    return null;
  }

  static String? email(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.auth_email_required;
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return l10n.auth_email_invalid;
    }
    return null;
  }

  static String? password(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.auth_password_required;
    if (value.length < 6) return l10n.auth_password_too_short;
    return null;
  }

  static String? confirmPassword(
    String? value,
    String password,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) return l10n.auth_confirm_password_required;
    if (value != password) return l10n.auth_passwords_dont_match;
    return null;
  }

  static String? currentPassword(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.change_password_current_required;
    return null;
  }

  static String? newPassword(
    String? value,
    String currentPassword,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) return l10n.change_password_new_required;
    if (value.length < 6) return l10n.auth_password_too_short;
    if (value == currentPassword) return l10n.change_password_same_as_current;
    return null;
  }
}


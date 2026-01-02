import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatterExtension on String {
  String toLocalizedDate(BuildContext context) {
    try {
      final parts = split('-');
      if (parts.length == 3) {
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final day = int.parse(parts[2]);
        final date = DateTime(year, month, day);
        final locale = Localizations.localeOf(context);
        if (locale.languageCode == 'tr') {
          final formatter = DateFormat('d MMMM y', 'tr_TR');
          return formatter.format(date);
        } else {
          final formatter = DateFormat('MMMM d, y', 'en_US');
          return formatter.format(date);
        }
      }
      return this;
    } catch (e) {
      return this;
    }
  }

  String extractYear() {
    try {
      final parts = split('-');
      if (parts.isNotEmpty) {
        return parts.first;
      }
      return this;
    } catch (e) {
      return this;
    }
  }
}

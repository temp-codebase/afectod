import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

extension LanguageExtension on String {
  String toLanguageName(BuildContext context) {
    final l10n = context.l10n;
    final languages = {
      'en': l10n.languageEn,
      'tr': l10n.languageTr,
      'es': l10n.languageEs,
      'fr': l10n.languageFr,
      'de': l10n.languageDe,
      'it': l10n.languageIt,
      'ja': l10n.languageJa,
      'ko': l10n.languageKo,
      'zh': l10n.languageZh,
      'ru': l10n.languageRu,
      'pt': l10n.languagePt,
      'ar': l10n.languageAr,
      'hi': l10n.languageHi,
      'nl': l10n.languageNl,
      'sv': l10n.languageSv,
      'no': l10n.languageNo,
      'da': l10n.languageDa,
      'fi': l10n.languageFi,
      'pl': l10n.languagePl,
      'cs': l10n.languageCs,
      'hu': l10n.languageHu,
      'ro': l10n.languageRo,
      'el': l10n.languageEl,
      'he': l10n.languageHe,
      'th': l10n.languageTh,
      'vi': l10n.languageVi,
      'id': l10n.languageId,
      'ms': l10n.languageMs,
    };
    return languages[this] ?? toUpperCase();
  }
}

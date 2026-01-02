import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPicker {
  static void showLanguagePicker({
    required BuildContext context,
    required String currentLanguage,
    required List<String> languages,
    required ValueChanged<String> onLanguageSelected,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.customColors.borderColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderHelper.thirtyFive.circular,
      ),
      builder: (context) {
        return Container(
          padding: PaddingHelper.sixteen.all,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: PaddingHelper.eight.value,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AfectodColors.lightGrey,
                  borderRadius: BorderHelper.twentyFive.circular,
                ),
              ),
              Padding(
                padding: PaddingHelper.sixteen.onlyHorizontal,
                child: Text(
                  context.l10n.selectLanguage,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: context.customColors.profileTextPrimary,
                  ),
                ),
              ),
              Divider(color: context.customColors.borderColor),
              ...languages.map((language) {
                final isSelected = language == currentLanguage;
                return ListTile(
                  leading: Icon(
                    CupertinoIcons.globe,
                    color: isSelected
                        ? AfectodColors.navyBlue
                        : AfectodColors.textSecondary,
                  ),
                  title: Text(
                    language,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: context.customColors.profileTextPrimary,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(
                          CupertinoIcons.check_mark_circled_solid,
                          color: AfectodColors.navyBlue,
                        )
                      : null,
                  onTap: () {
                    onLanguageSelected(language);
                    context.router.pop();
                  },
                );
              }),
              AfectodGap(20),
            ],
          ),
        );
      },
    );
  }
}

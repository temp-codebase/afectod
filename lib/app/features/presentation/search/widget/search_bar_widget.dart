import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final VoidCallback onClear;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onClear,
  });

  void _handleClear() {
    controller.clear();
    onClear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: context.customColors.bottomBarBackground,
      ),
      padding: PaddingHelper.sixteen.all,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: l10n.searchPlaceholder,
          prefixIcon: const Icon(CupertinoIcons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(CupertinoIcons.xmark_circle_fill),
                  onPressed: _handleClear,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderHelper.twentyFive.circular,
            borderSide: BorderSide(color: context.customColors.borderColor),
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: onSearch,
      ),
    );
  }
}

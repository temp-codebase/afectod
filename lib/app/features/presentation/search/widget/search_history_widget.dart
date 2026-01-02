import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/features/data/models/search/search_history_model.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SearchHistoryWidget extends StatelessWidget {
  final List<SearchHistoryModel> history;
  final Function(String) onHistoryTap;
  final Function(String) onDeleteHistory;
  final VoidCallback onClearAll;

  const SearchHistoryWidget({
    super.key,
    required this.history,
    required this.onHistoryTap,
    required this.onDeleteHistory,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (history.isEmpty) {
      return Center(
        child: Column(
          spacing: PaddingHelper.sixteen.value,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.search, size: 64, color: Colors.grey[400]),
            Text(
              l10n.searchHint,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.customColors.bottomBarBackground,
          ),
          child: Padding(
            padding: PaddingHelper.sixteen.symmetricHorizontalx2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.searchRecentTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: onClearAll,
                  icon: const Icon(CupertinoIcons.trash, size: 16),
                  label: Text(l10n.searchClearAll),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: PaddingHelper.eight.onlyHorizontal,
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AfectodColors.navyBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    CupertinoIcons.clock,
                    color: AfectodColors.navyBlue,
                    size: 20,
                  ),
                ),
                title: Text(
                  item.keyword,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: const Icon(CupertinoIcons.xmark, size: 20),
                  onPressed: () => onDeleteHistory(item.keyword),
                  color: Colors.grey,
                ),
                onTap: () => onHistoryTap(item.keyword),
              );
            },
          ),
        ),
      ],
    );
  }
}

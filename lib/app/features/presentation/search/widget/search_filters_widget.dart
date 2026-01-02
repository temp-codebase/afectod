import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_state.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SearchFiltersWidget extends StatelessWidget {
  final SearchState state;
  final Function(int?, int?, double?, double?) onFilterApply;
  final VoidCallback onFilterClear;
  final Function(SortType) onSortChange;
  final VoidCallback onSortOrderToggle;

  const SearchFiltersWidget({
    super.key,
    required this.state,
    required this.onFilterApply,
    required this.onFilterClear,
    required this.onSortChange,
    required this.onSortOrderToggle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: PaddingHelper.eight.symmetricHorizontalx2,
      child: Column(
        children: [
          Row(
            spacing: PaddingHelper.eight.value,
            children: [
              Text(
                l10n.resultsCount(state.filteredResults.length),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () => _showFilterDialog(context),
                icon: Icon(
                  CupertinoIcons.slider_horizontal_3,
                  size: 18,
                  color: context.customColors.profileTextPrimary,
                ),
                label: Text(
                  l10n.filterTitle,
                  style: TextStyle(
                    color: context.customColors.profileTextPrimary,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.customColors.borderColor),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => _showSortDialog(context),
                icon: Icon(
                  state.sortOrder == SortOrder.ascending
                      ? CupertinoIcons.arrow_up
                      : CupertinoIcons.arrow_down,
                  size: 18,
                  color: context.customColors.profileTextPrimary,
                ),
                label: Text(
                  _getSortLabel(l10n),
                  style: TextStyle(
                    color: context.customColors.profileTextPrimary,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.customColors.borderColor),
                ),
              ),
            ],
          ),
          if (state.hasFilters)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (state.minYear != null || state.maxYear != null)
                  _buildFilterChip(
                    context,
                    l10n.filterYearRange(
                      state.minYear?.toString() ?? '?',
                      state.maxYear?.toString() ?? '?',
                    ),
                    () => onFilterApply(
                      null,
                      null,
                      state.minRating,
                      state.maxRating,
                    ),
                  ),
                if (state.minRating != null || state.maxRating != null)
                  _buildFilterChip(
                    context,
                    l10n.filterRatingRange(
                      state.minRating?.toStringAsFixed(1) ?? '?',
                      state.maxRating?.toStringAsFixed(1) ?? '?',
                    ),
                    () =>
                        onFilterApply(state.minYear, state.maxYear, null, null),
                  ),
                TextButton.icon(
                  onPressed: onFilterClear,
                  icon: const Icon(CupertinoIcons.xmark_circle, size: 16),
                  label: Text(l10n.searchClearAll),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    VoidCallback onDelete,
  ) {
    return Chip(
      label: Text(label),
      deleteIcon: const Icon(CupertinoIcons.xmark, size: 16),
      onDeleted: onDelete,
      backgroundColor: AfectodColors.navyBlue.withOpacity(0.1),
      deleteIconColor: AfectodColors.navyBlue,
    );
  }

  String _getSortLabel(AppLocalizations l10n) {
    switch (state.sortType) {
      case SortType.alphabetical:
        return l10n.sortAZ;
      case SortType.year:
        return l10n.sortYear;
      case SortType.rating:
        return l10n.sortRating;
    }
  }

  void _showFilterDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    int? tempMinYear = state.minYear;
    int? tempMaxYear = state.maxYear;
    double? tempMinRating = state.minRating;
    double? tempMaxRating = state.maxRating;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(l10n.filterTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.filterYear,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: l10n.filterMin,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(
                          text: tempMinYear?.toString() ?? '',
                        ),
                        onChanged: (value) {
                          tempMinYear = int.tryParse(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: l10n.filterMax,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(
                          text: tempMaxYear?.toString() ?? '',
                        ),
                        onChanged: (value) {
                          tempMaxYear = int.tryParse(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.filterRating,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: l10n.filterMin,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(
                          text: tempMinRating?.toStringAsFixed(1) ?? '',
                        ),
                        onChanged: (value) {
                          tempMinRating = double.tryParse(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: l10n.filterMax,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(
                          text: tempMaxRating?.toStringAsFixed(1) ?? '',
                        ),
                        onChanged: (value) {
                          tempMaxRating = double.tryParse(value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                onFilterApply(
                  tempMinYear,
                  tempMaxYear,
                  tempMinRating,
                  tempMaxRating,
                );
                Navigator.pop(context);
              },
              child: Text(l10n.apply),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.sortTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<SortType>(
              title: Text(l10n.sortAlphabetical),
              value: SortType.alphabetical,
              groupValue: state.sortType,
              onChanged: (value) {
                if (value != null) {
                  onSortChange(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<SortType>(
              title: Text(l10n.sortYear),
              value: SortType.year,
              groupValue: state.sortType,
              onChanged: (value) {
                if (value != null) {
                  onSortChange(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<SortType>(
              title: Text(l10n.sortRating),
              value: SortType.rating,
              groupValue: state.sortType,
              onChanged: (value) {
                if (value != null) {
                  onSortChange(value);
                  Navigator.pop(context);
                }
              },
            ),
            const Divider(),
            ListTile(
              title: Text(l10n.sortDirection),
              trailing: IconButton(
                icon: Icon(
                  state.sortOrder == SortOrder.ascending
                      ? CupertinoIcons.arrow_up
                      : CupertinoIcons.arrow_down,
                ),
                onPressed: () {
                  onSortOrderToggle();
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }
}

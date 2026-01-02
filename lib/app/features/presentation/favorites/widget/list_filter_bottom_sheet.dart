import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/widgets/bottom_sheet/bottom_sheet_container.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/presentation/favorites/widget/list_icon_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class ListFilterBottomSheet extends StatelessWidget {
  final List<FavoriteListModel> lists;
  final FavoriteListModel? selectedList;
  final Function(FavoriteListModel) onListSelected;
  final Function(String) onDeleteList;

  const ListFilterBottomSheet({
    super.key,
    required this.lists,
    required this.selectedList,
    required this.onListSelected,
    required this.onDeleteList,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomSheetContainer(
      title: l10n.selectListTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...lists.map((list) => _buildListItem(context, list, l10n)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, FavoriteListModel list, AppLocalizations l10n) {
    final isSelected = selectedList?.id == list.id;
    final isDefaultList = list.id == 'default_list';
    return ListTile(
      leading: ListIconContainer(
        icon: isDefaultList ? CupertinoIcons.heart_fill : CupertinoIcons.list_bullet,
        iconColor: isSelected ? Colors.white : AfectodColors.navyBlue,
        backgroundColor: isSelected ? AfectodColors.navyBlue : null,
      ),
      title: Text(
        list.name,
        style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.w500),
      ),
      subtitle: Text(l10n.moviesCount(list.movieIds.length)),
      trailing: isSelected
          ? const Icon(CupertinoIcons.check_mark_circled_solid, color: AfectodColors.navyBlue)
          : null,
      onTap: () {
        onListSelected(list);
        Navigator.pop(context);
      },
      onLongPress: isDefaultList ? null : () => _showDeleteDialog(context, list, l10n),
    );
  }

  void _showDeleteDialog(BuildContext context, FavoriteListModel list, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteListTitle),
        content: Text(l10n.deleteListConfirm(list.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              l10n.cancel,
              style: TextStyle(color: context.customColors.profileTextPrimary),
            ),
          ),
          TextButton(
            onPressed: () {
              onDeleteList(list.id);
              context.router.pop();
              context.router.pop();
            },
            child: Text(l10n.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}


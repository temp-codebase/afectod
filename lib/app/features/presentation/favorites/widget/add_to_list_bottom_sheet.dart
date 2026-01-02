import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/widgets/bottom_sheet/bottom_sheet_container.dart';
import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:afectod/app/features/presentation/favorites/widget/list_icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class AddToListBottomSheet extends StatefulWidget {
  final FavoriteMovieModel movie;
  final List<FavoriteListModel> allLists;
  final Function(String listId, bool shouldAdd) onListToggle;

  const AddToListBottomSheet({
    super.key,
    required this.movie,
    required this.allLists,
    required this.onListToggle,
  });

  @override
  State<AddToListBottomSheet> createState() => _AddToListBottomSheetState();
}

class _AddToListBottomSheetState extends State<AddToListBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomSheetContainer(
      title: l10n.addToListTitle,
      headerWidgets: [_buildMovieInfo()],
      child: widget.allLists.isEmpty ? _buildEmptyState(l10n) : _buildListView(l10n),
    );
  }

  Widget _buildMovieInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AfectodColors.navyBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(CupertinoIcons.film_fill, color: AfectodColors.navyBlue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.movie.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Icon(CupertinoIcons.tray, size: 48, color: Colors.grey[400]),
        const SizedBox(height: 8),
        Text(l10n.addToListNoLists, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        AfectodGap(20),
      ],
    );
  }

  Widget _buildListView(AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...widget.allLists.map((list) => _buildListItem(list, l10n)),
        AfectodGap(20),
      ],
    );
  }

  Widget _buildListItem(FavoriteListModel list, AppLocalizations l10n) {
    final isInList = list.containsMovie(widget.movie.id);
    final isDefaultList = list.id == 'default_list';
    return CheckboxListTile(
      enabled: !isDefaultList,
      secondary: ListIconContainer(
        icon: isDefaultList ? CupertinoIcons.heart_fill : CupertinoIcons.list_bullet,
        iconColor: isDefaultList ? Colors.grey : AfectodColors.navyBlue,
        backgroundColor: isDefaultList ? Colors.grey.withOpacity(0.1) : null,
      ),
      title: Text(
        list.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDefaultList ? Colors.grey : null,
        ),
      ),
      subtitle: Text(
        isDefaultList ? l10n.addToListAutomatic : l10n.moviesCount(list.movieIds.length),
        style: const TextStyle(fontSize: 12),
      ),
      value: isInList,
      activeColor: AfectodColors.navyBlue,
      onChanged: isDefaultList
          ? null
          : (value) {
              widget.onListToggle(list.id, value ?? false);
              setState(() {});
            },
    );
  }
}


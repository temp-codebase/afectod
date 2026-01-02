import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:afectod/app/features/presentation/favorites/widget/add_to_list_bottom_sheet.dart';
import 'package:afectod/app/features/presentation/favorites/widget/create_list_bottom_sheet.dart';
import 'package:afectod/app/features/presentation/favorites/widget/list_filter_bottom_sheet.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:flutter/material.dart';

class FavoritesBottomSheetHelper {
  static void showCreateList(
    BuildContext context, {
    required Function(String name, String? description) onCreateList,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.customColors.borderColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderHelper.thirtyFive.circular,
      ),
      builder: (_) => CreateListBottomSheet(onCreateList: onCreateList),
    );
  }

  static void showAddToList(
    BuildContext context, {
    required FavoriteMovieModel movie,
    required List<FavoriteListModel> allLists,
    required Function(String listId, bool shouldAdd) onListToggle,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.customColors.borderColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderHelper.thirtyFive.circular,
      ),
      builder: (_) => AddToListBottomSheet(
        movie: movie,
        allLists: allLists,
        onListToggle: onListToggle,
      ),
    );
  }

  static void showListFilter(
    BuildContext context, {
    required List<FavoriteListModel> lists,
    required FavoriteListModel? selectedList,
    required Function(FavoriteListModel) onListSelected,
    required Function(String) onDeleteList,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.customColors.borderColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderHelper.thirtyFive.circular,
      ),
      builder: (_) => ListFilterBottomSheet(
        lists: lists,
        selectedList: selectedList,
        onListSelected: onListSelected,
        onDeleteList: onDeleteList,
      ),
    );
  }
}

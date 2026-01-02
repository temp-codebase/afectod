import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/common/widgets/appbar/afectod_appbar.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/common/widgets/state/afectod_loading_state.dart';
import 'package:afectod/app/common/widgets/state/afectod_error_state.dart';
import 'package:afectod/app/common/widgets/state/afectod_empty_state.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_state.dart';
import 'package:afectod/app/features/presentation/favorites/widget/favorites_bottom_sheet_helper.dart';
import 'package:afectod/app/features/presentation/favorites/widget/favorites_movie_grid.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    getIt.get<FavoritesCubit>().init(context);
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return AfectodScaffold(
          appBar: AfectodAppBar(
            title: l10n.favoritesTitle,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
              onPressed: () => _showListFilterBottomSheet(context, state),
              tooltip: l10n.favoritesFilter,
            ),
            actions: [
              IconButton(
                icon: const Icon(CupertinoIcons.add),
                onPressed: () => _showCreateListBottomSheet(context),
                tooltip: l10n.favoritesNewList,
              ),
            ],
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, FavoritesState state) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = getIt.get<FavoritesCubit>();
    if (state.status == FavoritesStatus.loading) {
      return const AfectodLoadingState();
    }
    if (state.status == FavoritesStatus.error) {
      return AfectodErrorState(
        message: state.errorMessage ?? l10n.errorGeneric,
        retryButtonText: l10n.retryButton,
        onRetry: () => cubit.init(context),
      );
    }
    if (state.lists.isEmpty) {
      return AfectodEmptyState(
        message: l10n.favoritesNoLists,
        icon: CupertinoIcons.heart_slash,
      );
    }
    return Column(
      children: [
        if (state.selectedList != null) _buildListHeader(context, state, l10n),
        Divider(height: 1, color: context.customColors.borderColor),
        Expanded(
          child: FavoritesMovieGrid(
            movies: state.selectedListMovies,
            onMovieLongPress: (movie) =>
                _showAddToListBottomSheet(context, movie, state.lists),
            onRemoveMovie: (movieId) =>
                _handleRemoveMovie(context, state, movieId),
          ),
        ),
      ],
    );
  }

  Widget _buildListHeader(BuildContext context, FavoritesState state, l10n) {
    return Container(
      padding: PaddingHelper.sixteen.all,
      child: Row(
        spacing: PaddingHelper.eight.value,
        children: [
          Icon(
            state.selectedList!.id == 'default_list'
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.list_bullet,
            size: 20,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          Expanded(
            child: Text(
              state.selectedList!.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            l10n.moviesCount(state.selectedListMovies.length),
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }

  void _handleRemoveMovie(
    BuildContext context,
    FavoritesState state,
    int movieId,
  ) {
    if (state.selectedList != null) {
      context.read<FavoritesCubit>().removeMovieFromList(
        state.selectedList!.id,
        movieId,
      );
    }
  }

  void _showCreateListBottomSheet(BuildContext context) {
    FavoritesBottomSheetHelper.showCreateList(
      context,
      onCreateList: (name, description) {
        context.read<FavoritesCubit>().createList(name, description);
      },
    );
  }

  void _showAddToListBottomSheet(
    BuildContext context,
    FavoriteMovieModel movie,
    List<FavoriteListModel> lists,
  ) {
    final cubit = context.read<FavoritesCubit>();
    FavoritesBottomSheetHelper.showAddToList(
      context,
      movie: movie,
      allLists: lists,
      onListToggle: (listId, shouldAdd) {
        if (shouldAdd) {
          cubit.addMovieToList(listId, movie.id);
        } else {
          cubit.removeMovieFromList(listId, movie.id);
        }
      },
    );
  }

  void _showListFilterBottomSheet(BuildContext context, FavoritesState state) {
    FavoritesBottomSheetHelper.showListFilter(
      context,
      lists: state.lists,
      selectedList: state.selectedList,
      onListSelected: (list) => context.read<FavoritesCubit>().selectList(list),
      onDeleteList: (listId) =>
          context.read<FavoritesCubit>().deleteList(listId),
    );
  }
}

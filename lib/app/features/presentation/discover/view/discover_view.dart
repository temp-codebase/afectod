import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/common/utils/navigation_helper.dart';
import 'package:afectod/app/common/widgets/appbar/afectod_appbar.dart';
import 'package:afectod/app/common/widgets/scaffold/afectod_scaffold.dart';
import 'package:afectod/app/common/widgets/state/afectod_loading_state.dart';
import 'package:afectod/app/common/widgets/state/afectod_error_state.dart';
import 'package:afectod/app/common/widgets/state/afectod_empty_state.dart';
import 'package:afectod/app/features/presentation/discover/cubit/discover_cubit.dart';
import 'package:afectod/app/features/presentation/discover/widget/discover_card.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AfectodScaffold(
      appBar: AfectodAppBar(
        title: l10n.appTitle,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () => NavigationHelper.toSearch(context),
          ),
        ],
      ),
      body: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          if (state.status == DiscoverStatus.loading) {
            return const AfectodLoadingState();
          }
          if (state.status == DiscoverStatus.error) {
            return AfectodErrorState(
              message: state.errorMessage ?? l10n.errorGeneric,
              retryButtonText: l10n.retryButton,
              onRetry: () => context.read<DiscoverCubit>().discoverMovies(),
            );
          }
          if (state.allMovies.isEmpty) {
            return AfectodEmptyState(
              message: l10n.discoverNoMovies,
              icon: Icons.movie_outlined,
            );
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.9) {
                context.read<DiscoverCubit>().loadMoreMovies();
              }
              return false;
            },
            child: BlocBuilder<FavoritesCubit, dynamic>(
              builder: (context, favState) {
                final favoritesCubit = getIt.get<FavoritesCubit>();
                return GridView.builder(
                  padding: PaddingHelper.sixteen.allWithBottomNavigationBar,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: state.hasReachedMax
                      ? state.allMovies.length
                      : state.allMovies.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.allMovies.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final movie = state.allMovies[index];
                    final isFavorite = favoritesCubit.isMovieFavorite(
                      movie.id ?? 0,
                    );
                    return DiscoverCard(
                      movie: movie,
                      isFavorite: isFavorite,
                      onTap: () => NavigationHelper.toDetail(context, movie),
                      onFavoriteTap: () => favoritesCubit.toggleFavorite(movie),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

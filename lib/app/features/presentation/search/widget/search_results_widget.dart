import 'package:afectod/app/common/utils/navigation_helper.dart';
import 'package:afectod/app/common/widgets/state/afectod_empty_state.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/presentation/discover/widget/discover_card.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const SearchResultsWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (movies.isEmpty) {
      return AfectodEmptyState(
        message: l10n.searchNoResults,
        icon: CupertinoIcons.film,
      );
    }
    return BlocBuilder<FavoritesCubit, dynamic>(
      builder: (context, favState) {
        final favoritesCubit = context.read<FavoritesCubit>();
        return GridView.builder(
          padding: PaddingHelper.sixteen.all,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            final isFavorite = favoritesCubit.isMovieFavorite(movie.id ?? 0);
            return DiscoverCard(
              movie: movie,
              isFavorite: isFavorite,
              onTap: () => NavigationHelper.toDetail(context, movie),
              onFavoriteTap: () => favoritesCubit.toggleFavorite(movie),
            );
          },
        );
      },
    );
  }
}

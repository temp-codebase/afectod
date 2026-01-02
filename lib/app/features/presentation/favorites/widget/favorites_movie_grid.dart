import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/date_formatter_extension.dart';
import 'package:afectod/app/common/extensions/tmdb_image_extension.dart';
import 'package:afectod/app/common/utils/navigation_helper.dart';
import 'package:afectod/app/common/widgets/state/afectod_empty_state.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class FavoritesMovieGrid extends StatelessWidget {
  final List<FavoriteMovieModel> movies;
  final Function(FavoriteMovieModel)? onMovieTap;
  final Function(int) onRemoveMovie;
  final Function(FavoriteMovieModel)? onMovieLongPress;

  const FavoritesMovieGrid({
    super.key,
    required this.movies,
    this.onMovieTap,
    required this.onRemoveMovie,
    this.onMovieLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (movies.isEmpty) {
      return AfectodEmptyState(
        message: l10n.favoritesNoMoviesInList,
        icon: CupertinoIcons.heart,
      );
    }
    return GridView.builder(
      padding: PaddingHelper.sixteen.allWithBottomNavigationBar,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _FavoriteMovieCard(
          movie: movie,
          onTap: () {
            final movieModel = MovieModel.fromJson(movie.toMovieModelJson());
            NavigationHelper.toDetail(context, movieModel);
          },
          onLongPress: onMovieLongPress != null
              ? () => onMovieLongPress!(movie)
              : null,
          onRemove: () => _showRemoveDialog(context, movie),
        );
      },
    );
  }

  void _showRemoveDialog(BuildContext context, FavoriteMovieModel movie) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.removeMovieTitle),
        content: Text(l10n.removeMovieConfirm(movie.title)),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            child: Text(
              l10n.cancel,
              style: TextStyle(
                color: context.customColors.profileTextSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              onRemoveMovie(movie.id);
              context.router.pop();
            },
            child: Text(l10n.remove, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _FavoriteMovieCard extends StatelessWidget {
  final FavoriteMovieModel movie;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final VoidCallback onRemove;

  const _FavoriteMovieCard({
    required this.movie,
    required this.onTap,
    this.onLongPress,
    required this.onRemove,
  });

  static const double _overlayOpacity = 0.75;
  static const double _iconSize = 16.0;
  static const double _errorIconSize = 50.0;
  static const double _badgeHorizontalPadding = 12.0;
  static const double _badgeVerticalPadding = 8.0;
  static const double _footerHeight = 50.0;
  static const double _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderHelper.twentyFive.circular,
        child: Stack(
          children: [
            _buildPosterImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTopOverlay(), _buildFooterOverlay()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosterImage() {
    final imageUrl = TmdbImageExtension.posterUrl(movie.posterPath);

    if (imageUrl.isEmpty) {
      return _buildPlaceholder();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorWidget: (context, url, error) => _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.movie, size: _errorIconSize)),
    );
  }

  Widget _buildTopOverlay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildRatingBadge(), _buildRemoveBadge()],
      ),
    );
  }

  Widget _buildRatingBadge() {
    final rating = movie.voteAverage?.toStringAsFixed(1) ?? '0.0';

    return _buildBadge(
      child: Text(
        rating,
        style: const TextStyle(
          fontSize: _fontSize,
          fontWeight: FontWeight.bold,
          color: AfectodColors.white,
        ),
      ),
    );
  }

  Widget _buildRemoveBadge() {
    return GestureDetector(
      onTap: onRemove,
      child: _buildBadge(
        child: const Icon(
          CupertinoIcons.heart_fill,
          size: _iconSize,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildBadge({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _badgeHorizontalPadding,
        vertical: _badgeVerticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderHelper.twentyFive.circular,
        color: Colors.black.withOpacity(_overlayOpacity),
      ),
      child: child,
    );
  }

  Widget _buildFooterOverlay() {
    final year = movie.releaseDate?.extractYear() ?? '';
    final title = movie.title;

    return Container(
      padding: PaddingHelper.twelve.onlyHorizontal,
      height: _footerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(_overlayOpacity),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (year.isNotEmpty) _buildFooterText(year),
          _buildFooterText(title),
        ],
      ),
    );
  }

  Widget _buildFooterText(String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _fontSize,
        color: AfectodColors.white,
      ),
    );
  }
}

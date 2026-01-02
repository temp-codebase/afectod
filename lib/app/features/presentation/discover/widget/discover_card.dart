import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/date_formatter_extension.dart';
import 'package:afectod/app/common/extensions/tmdb_image_extension.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const DiscoverCard({
    super.key,
    required this.movie,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
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
      padding: PaddingHelper.eight.all,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildRatingBadge(), _buildFavoriteBadge()],
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

  Widget _buildFavoriteBadge() {
    return GestureDetector(
      onTap: onFavoriteTap,
      child: _buildBadge(
        child: Icon(
          isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          size: _iconSize,
          color: isFavorite ? Colors.red : Colors.white,
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
    final title = movie.title ?? '';
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

import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/tmdb_image_extension.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_button.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final MovieModel movie;
  final double backdropHeight;
  final CustomColors colors;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  const DetailAppBar({
    super.key,
    required this.movie,
    required this.backdropHeight,
    required this.colors,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: backdropHeight,
      pinned: true,
      backgroundColor: colors.profileCardBackground,
      titleSpacing: 0,
      leadingWidth: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailButton(
              icon: CupertinoIcons.back,
              onPressed: () => context.router.maybePop(),
            ),
            DetailButton(
              icon: isFavorite
                  ? CupertinoIcons.heart_fill
                  : CupertinoIcons.heart,
              onPressed: onFavoritePressed,
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: DetailText(title: movie.title!),
        background: CachedNetworkImage(
          imageUrl: TmdbImageExtension.url(
            movie.backdropPath ?? movie.posterPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_rating_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRating extends StatelessWidget {
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final CustomColors colors;
  final TextTheme textTheme;
  final double ratingIconSize;
  const DetailRating({
    super.key,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.colors,
    required this.textTheme,
    required this.ratingIconSize,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailRatingCard(
          colors: colors,
          children: [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: ratingIconSize,
            ),
            Text(
              voteAverage.toStringAsFixed(1),
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.profileTextPrimary,
              ),
            ),
            Text(
              l10n.detailVotesCount(voteCount),
              style: textTheme.bodyMedium?.copyWith(
                color: colors.profileTextSecondary,
              ),
            ),
          ],
        ),
        DetailRatingCard(
          colors: colors,
          children: [
            Text(
              popularity.toStringAsFixed(0),
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.profileTextPrimary,
              ),
            ),
            Icon(
              CupertinoIcons.flame_fill,
              size: ratingIconSize,
              color: AfectodColors.error,
            ),
          ],
        ),
      ],
    );
  }
}

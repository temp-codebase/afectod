import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/date_formatter_extension.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/common/extensions/language_extension.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_box_info.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_box_genre.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_info.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_info_row.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_rating.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailContentBuilder {
  DetailContentBuilder._();

  static const double _ratingIconSize = 20.0;

  static List<Widget> buildContent({
    required BuildContext context,
    required MovieModel movie,
    required CustomColors colors,
    required TextTheme textTheme,
  }) {
    final l10n = context.l10n;
    final widgets = <Widget>[];
    widgets.add(
      DetailRating(
        voteAverage: movie.voteAverage!,
        voteCount: movie.voteCount!,
        popularity: movie.popularity!,
        colors: colors,
        textTheme: textTheme,
        ratingIconSize: _ratingIconSize,
      ),
    );
    if (movie.overview != null && movie.overview!.isNotEmpty) {
      widgets.add(
        DetailInfo(
          title: l10n.detailOverview,
          icon: CupertinoIcons.doc_text,
          colors: colors,
          textTheme: textTheme,
          child: Text(
            movie.overview!,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.profileTextPrimary,
              height: 1.5,
            ),
          ),
        ),
      );
    }
    final infoRows = _buildInfoRows(context, movie);
    if (infoRows.isNotEmpty) {
      widgets.add(
        Column(spacing: PaddingHelper.twelve.value, children: infoRows),
      );
    }
    if (movie.genreIds != null && movie.genreIds!.isNotEmpty) {
      widgets.add(DetailBoxGenre(genreIds: movie.genreIds!));
    }
    widgets.add(DetailBoxInfo(hasVideo: movie.video, isAdult: movie.adult));
    return widgets;
  }

  static List<Widget> _buildInfoRows(BuildContext context, MovieModel movie) {
    final l10n = context.l10n;
    final rows = <Widget>[];
    if (movie.releaseDate != null) {
      rows.add(
        DetailInfoRow(
          icon: CupertinoIcons.calendar,
          title: l10n.detailReleaseDate,
          value: movie.releaseDate!.toLocalizedDate(context),
        ),
      );
    }
    if (movie.originalLanguage != null) {
      rows.add(
        DetailInfoRow(
          icon: CupertinoIcons.globe,
          title: l10n.detailOriginalLanguage,
          value: movie.originalLanguage!.toLanguageName(context),
        ),
      );
    }
    if (movie.id != null) {
      rows.add(
        DetailInfoRow(
          icon: CupertinoIcons.number,
          title: l10n.detailMovieId,
          value: movie.id.toString(),
        ),
      );
    }
    return rows;
  }
}

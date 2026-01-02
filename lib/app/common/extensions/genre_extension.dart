import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

extension GenreExtension on int {
  String toGenreName(BuildContext context) {
    final l10n = context.l10n;
    final genres = {
      28: l10n.genreAction,
      12: l10n.genreAdventure,
      16: l10n.genreAnimation,
      35: l10n.genreComedy,
      80: l10n.genreCrime,
      99: l10n.genreDocumentary,
      18: l10n.genreDrama,
      10751: l10n.genreFamily,
      14: l10n.genreFantasy,
      36: l10n.genreHistory,
      27: l10n.genreHorror,
      10402: l10n.genreMusic,
      9648: l10n.genreMystery,
      10749: l10n.genreRomance,
      878: l10n.genreScienceFiction,
      10770: l10n.genreTvMovie,
      53: l10n.genreThriller,
      10752: l10n.genreWar,
      37: l10n.genreWestern,
    };
    return genres[this] ?? l10n.genreUnknown(this);
  }
}

extension GenreListExtension on List<int> {
  List<String> toGenreNames(BuildContext context) {
    return map((id) => id.toGenreName(context)).toList();
  }

  String toGenreNamesString(BuildContext context) {
    return toGenreNames(context).join(', ');
  }
}

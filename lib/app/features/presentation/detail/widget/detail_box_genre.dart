import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/genre_extension.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_info.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBoxGenre extends StatelessWidget {
  final List<int> genreIds;
  const DetailBoxGenre({super.key, required this.genreIds});
  static const double _chipSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return DetailInfo(
      title: context.l10n.detailGenres,
      icon: CupertinoIcons.tag_fill,
      colors: context.customColors,
      textTheme: Theme.of(context).textTheme,
      child: Wrap(
        spacing: _chipSpacing,
        runSpacing: _chipSpacing,
        children: genreIds.map((genreId) {
          return Container(
            padding: PaddingHelper.eight.symmetricHorizontalx2,
            decoration: BoxDecoration(
              color: context.customColors.profileAvatarBackground,
              borderRadius: BorderHelper.twentyFive.circular,
              border: Border.all(color: context.customColors.borderColor),
            ),
            child: Text(
              genreId.toGenreName(context),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.customColors.profileTextPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

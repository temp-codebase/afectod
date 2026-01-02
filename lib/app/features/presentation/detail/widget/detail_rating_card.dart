import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class DetailRatingCard extends StatelessWidget {
  final CustomColors colors;
  final List<Widget> children;
  const DetailRatingCard({
    super.key,
    required this.colors,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingHelper.eight.symmetricHorizontalx2,
      decoration: BoxDecoration(
        color: colors.profileCardBackground,
        borderRadius: BorderHelper.twentyFive.circular,
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(spacing: PaddingHelper.eight.value, children: children),
    );
  }
}

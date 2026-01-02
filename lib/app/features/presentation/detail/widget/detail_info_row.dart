import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class DetailInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingHelper.sixteen.all,
      decoration: BoxDecoration(
        color: context.customColors.profileCardBackground,
        borderRadius: BorderHelper.fifty.circular,
        border: Border.all(color: context.customColors.borderColor),
      ),
      child: Row(
        spacing: PaddingHelper.sixteen.value,
        children: [
          Container(
            padding: PaddingHelper.twelve.all,
            decoration: BoxDecoration(
              color: context.customColors.profileAvatarBackground,
              borderRadius: BorderHelper.twentyFive.circular,
            ),
            child: Icon(
              icon,
              color: context.customColors.profileAvatarIcon,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.customColors.profileTextSecondary,
                  ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.customColors.profileTextPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

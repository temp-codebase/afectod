import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProfileCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final double avatarSize;
  final IconData avatarIcon;

  const SettingsProfileCard({
    super.key,
    required this.userName,
    required this.userEmail,
    this.avatarSize = 70.0,
    this.avatarIcon = CupertinoIcons.person_fill,
  });

  static const double _borderWidth = 1.0;
  static const double _spacing = 16.0;
  static const double _textOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: PaddingHelper.twenty.all,
      decoration: BoxDecoration(
        color: colors.profileCardBackground,
        border: Border.all(color: colors.borderColor, width: _borderWidth),
        borderRadius: BorderHelper.fifty.circular,
      ),
      child: Row(
        spacing: _spacing,
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              color: colors.profileAvatarBackground,
              borderRadius: BorderHelper.thirtyFive.circular,
            ),
            child: Icon(
              avatarIcon,
              size: avatarSize / 2,
              color: colors.profileAvatarIcon,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.profileTextPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  userEmail,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.profileTextSecondary.withOpacity(
                      _textOpacity,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

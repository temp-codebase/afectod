import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsInfoCard extends StatelessWidget {
  final PackageInfo packageInfo;
  final IconData appIcon;
  final double iconSize;
  final bool showPackageName;

  const SettingsInfoCard({
    super.key,
    required this.packageInfo,
    this.appIcon = CupertinoIcons.tickets_fill,
    this.iconSize = 48.0,
    this.showPackageName = true,
  });

  static const double _borderWidth = 1.0;
  static const double _spacing = 12;
  static const double _textOpacity = 0.7;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.customColors;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: PaddingHelper.twenty.all,
      decoration: BoxDecoration(
        color: colors.profileCardBackground,
        borderRadius: BorderHelper.fifty.circular,
        border: Border.all(color: colors.borderColor, width: _borderWidth),
      ),
      child: Column(
        spacing: _spacing,
        children: [
          Container(
            width: iconSize * 2,
            height: iconSize * 2,
            decoration: BoxDecoration(
              color: colors.profileAvatarBackground,
              borderRadius: BorderHelper.fifty.circular,
            ),
            child: Icon(
              appIcon,
              size: iconSize,
              color: colors.profileAvatarIcon,
            ),
          ),
          Column(
            children: [
              Text(
                packageInfo.appName,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.profileTextPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                l10n.settingsVersion(packageInfo.version),
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.profileTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                packageInfo.packageName,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.profileTextSecondary.withOpacity(_textOpacity),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Divider(color: colors.borderColor),
          Text(
            l10n.settingsCopyright,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colors.profileTextSecondary.withOpacity(_textOpacity),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

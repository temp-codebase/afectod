import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/features/presentation/detail/widget/detail_info.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBoxInfo extends StatelessWidget {
  final bool? hasVideo;
  final bool? isAdult;
  const DetailBoxInfo({
    super.key,
    this.hasVideo,
    this.isAdult,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.customColors;
    final textTheme = Theme.of(context).textTheme;
    final additionalInfo = <Map<String, dynamic>>[];
    if (hasVideo != null) {
      additionalInfo.add({
        'icon': CupertinoIcons.videocam_fill,
        'label': l10n.detailVideoContent,
        'value': hasVideo! ? l10n.detailVideoAvailable : l10n.detailVideoNotAvailable,
      });
    }
    if (isAdult != null) {
      additionalInfo.add({
        'icon': CupertinoIcons.exclamationmark_shield_fill,
        'label': l10n.detailAgeRestriction,
        'value': isAdult! ? l10n.detailAdultContent : l10n.detailGeneralAudience,
      });
    }
    if (additionalInfo.isEmpty) return const SizedBox.shrink();
    return DetailInfo(
      title: l10n.detailAdditionalInfo,
      icon: CupertinoIcons.info_circle_fill,
      colors: colors,
      textTheme: textTheme,
      child: Column(
        spacing: PaddingHelper.twelve.value,
        children: additionalInfo.map((info) {
          return Row(
            children: [
              Icon(
                info['icon'] as IconData,
                color: colors.profileAvatarIcon,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                '${info['label']}: ',
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.profileTextSecondary,
                ),
              ),
              Text(
                info['value'] as String,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.profileTextPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}


import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final CustomColors colors;
  final TextTheme textTheme;
  const DetailInfo({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingHelper.twenty.symmetricXHalf,
      decoration: BoxDecoration(
        color: colors.profileCardBackground,
        borderRadius: BorderHelper.fifty.circular,
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: PaddingHelper.twelve.value,
        children: [
          Row(
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colors.profileTextPrimary,
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

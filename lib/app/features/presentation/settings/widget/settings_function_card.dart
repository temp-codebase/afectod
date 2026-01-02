import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SettingsTrailingType { toggle, chevronRight, chevronDown, custom, none }

class SettingsFunctionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final SettingsTrailingType trailingType;
  final Widget? customTrailing;
  final VoidCallback? onTap;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final Color? switchActiveColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const SettingsFunctionCard({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.iconColor,
    this.iconBackgroundColor,
    this.trailingType = SettingsTrailingType.chevronRight,
    this.customTrailing,
    this.onTap,
    this.switchValue,
    this.onSwitchChanged,
    this.switchActiveColor,
    this.backgroundColor,
    this.borderColor,
  }) : assert(
         trailingType != SettingsTrailingType.toggle ||
             (switchValue != null && onSwitchChanged != null),
         'switchValue and onSwitchChanged are required when trailingType is toggle',
       ),
       assert(
         trailingType != SettingsTrailingType.custom || customTrailing != null,
         'customTrailing is required when trailingType is custom',
       );

  static const double _iconSize = 24.0;
  static const double _iconPadding = 10.0;
  static const double _spacing = 16.0;
  static const double _trailingIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final effectiveBackgroundColor = _getBackgroundColor(colors);
    final effectiveBorderColor = _getBorderColor(colors);
    final effectiveIconColor = _getIconColor(colors);
    final effectiveIconBgColor = _getIconBackgroundColor(colors);
    final effectiveTextColor = _getTextColor(colors);
    final content = Container(
      padding: PaddingHelper.sixteen.all,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderHelper.fifty.circular,
        border: Border.all(color: effectiveBorderColor),
      ),
      child: Row(
        children: [
          _buildIcon(effectiveIconBgColor, effectiveIconColor),
          const SizedBox(width: _spacing),
          Expanded(child: _buildContent(textTheme, effectiveTextColor)),
          if (trailingType != SettingsTrailingType.none) ...[
            const SizedBox(width: _spacing),
            _buildTrailing(colors),
          ],
        ],
      ),
    );

    if (onTap != null && trailingType != SettingsTrailingType.toggle) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderHelper.twentyFive.circular,
        child: content,
      );
    }
    return content;
  }

  Widget _buildIcon(Color backgroundColor, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(_iconPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderHelper.twentyFive.circular,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: RotationTransition(turns: animation, child: child),
          );
        },
        child: Icon(
          icon,
          key: ValueKey(icon),
          color: iconColor,
          size: _iconSize,
        ),
      ),
    );
  }

  Widget _buildContent(TextTheme textTheme, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: textTheme.bodySmall?.copyWith(
              color: textColor.withOpacity(0.7),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildTrailing(CustomColors colors) {
    switch (trailingType) {
      case SettingsTrailingType.toggle:
        return Switch(
          trackOutlineColor: MaterialStateProperty.all(
            colors.profileCardBackground,
          ),
          trackColor: MaterialStateProperty.all(colors.profileAvatarBackground),
          value: switchValue!,
          onChanged: onSwitchChanged,
          activeColor: switchActiveColor ?? colors.profileCardBackground,
        );
      case SettingsTrailingType.chevronRight:
        return Icon(
          CupertinoIcons.chevron_right,
          size: _trailingIconSize,
          color: colors.borderColor,
        );
      case SettingsTrailingType.chevronDown:
        return Icon(
          CupertinoIcons.chevron_down,
          size: _trailingIconSize,
          color: colors.borderColor,
        );
      case SettingsTrailingType.custom:
        return customTrailing!;
      case SettingsTrailingType.none:
        return const SizedBox.shrink();
    }
  }

  Color _getBackgroundColor(CustomColors colors) {
    if (backgroundColor != null) return backgroundColor!;
    return colors.profileCardBackground;
  }

  Color _getBorderColor(CustomColors colors) {
    if (borderColor != null) return borderColor!;
    return colors.borderColor;
  }

  Color _getIconColor(CustomColors colors) {
    if (iconColor != null) return iconColor!;
    return colors.profileAvatarIcon;
  }

  Color _getIconBackgroundColor(CustomColors colors) {
    if (iconBackgroundColor != null) return iconBackgroundColor!;
    return colors.profileAvatarBackground;
  }

  Color _getTextColor(CustomColors colors) {
    return colors.profileTextPrimary;
  }
}

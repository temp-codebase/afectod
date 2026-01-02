import 'package:afectod/app/common/enums/settings_item_type.dart';
import 'package:flutter/widgets.dart';

class SettingsItemModel {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final SettingsItemType type;
  final Widget Function(BuildContext context)? customTrailingBuilder;
  final void Function(BuildContext context)? onTap;
  final bool Function()? getSwitchValue;
  final void Function(BuildContext context, bool value)? onSwitchChanged;
  final Color? switchActiveColor;

  const SettingsItemModel({
    required this.title,
    required this.icon,
    required this.type,
    this.subtitle,
    this.iconColor,
    this.customTrailingBuilder,
    this.onTap,
    this.getSwitchValue,
    this.onSwitchChanged,
    this.switchActiveColor,
  });
}

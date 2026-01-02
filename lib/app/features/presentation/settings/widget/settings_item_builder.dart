import 'package:afectod/app/common/enums/settings_item_type.dart';
import 'package:afectod/app/features/data/models/logic/settings_item_model.dart';
import 'package:afectod/app/features/presentation/settings/widget/settings_function_card.dart';
import 'package:flutter/material.dart';

class SettingsItemBuilder extends StatelessWidget {
  final SettingsItemModel item;
  const SettingsItemBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case SettingsItemType.toggle:
        return SettingsFunctionCard(
          title: item.title,
          subtitle: item.subtitle,
          icon: item.icon,
          iconColor: item.iconColor,
          trailingType: SettingsTrailingType.toggle,
          switchValue: item.getSwitchValue?.call() ?? false,
          onSwitchChanged: (value) {
            item.onSwitchChanged?.call(context, value);
          },
          switchActiveColor: item.switchActiveColor,
        );
      case SettingsItemType.navigation:
        return SettingsFunctionCard(
          title: item.title,
          subtitle: item.subtitle,
          icon: item.icon,
          iconColor: item.iconColor,
          trailingType: SettingsTrailingType.chevronRight,
          onTap: () {
            item.onTap?.call(context);
          },
        );
      case SettingsItemType.custom:
        return SettingsFunctionCard(
          title: item.title,
          subtitle: item.subtitle,
          icon: item.icon,
          iconColor: item.iconColor,
          trailingType: SettingsTrailingType.custom,
          customTrailing: item.customTrailingBuilder?.call(context),
        );
    }
  }
}

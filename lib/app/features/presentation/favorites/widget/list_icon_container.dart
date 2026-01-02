import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:flutter/material.dart';

class ListIconContainer extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const ListIconContainer({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor ?? AfectodColors.navyBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: iconColor ?? AfectodColors.navyBlue,
        size: 20,
      ),
    );
  }
}


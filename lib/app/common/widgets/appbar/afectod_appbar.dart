import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfectodAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchButton;
  final List<Widget>? actions;
  final Widget? leading;
  
  const AfectodAppBar({
    super.key,
    required this.title,
    this.showSearchButton = false,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.customColors.borderColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      actions: actions ?? (showSearchButton ? [
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: context.customColors.borderColor),
            ),
          ),
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
            color: AfectodColors.unSelected,
          ),
        ),
      ] : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

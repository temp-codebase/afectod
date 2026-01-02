import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? headerWidgets;

  const BottomSheetContainer({
    super.key,
    required this.title,
    required this.child,
    this.headerWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingHelper.sixteen.all,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: PaddingHelper.eight.value,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AfectodColors.lightGrey,
              borderRadius: BorderHelper.twentyFive.circular,
            ),
          ),
          Padding(
            padding: PaddingHelper.sixteen.onlyHorizontal,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.customColors.profileTextPrimary,
              ),
            ),
          ),
          Divider(color: context.customColors.borderColor),
          if (headerWidgets != null) ...headerWidgets!,
          child,
        ],
      ),
    );
  }
}


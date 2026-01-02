import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/enums/button_size.dart';
import 'package:afectod/core/helpers/screen_util/screen_util.dart';
import 'package:flutter/material.dart';

class AfectodButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final ButtonSize size;
  final Color? color;

  const AfectodButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.size = ButtonSize.regular,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AfectodColors.navyBlue;
    final deviceWidth = ScreenUtil.width!;

    double width;
    double borderRadius;

    switch (size) {
      case ButtonSize.compact:
        width = deviceWidth * 0.35;
        borderRadius = 24;
        break;
      case ButtonSize.regular:
        width = deviceWidth * 0.85;
        borderRadius = 24;
        break;
    }

    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AfectodColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

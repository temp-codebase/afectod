import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class DetailButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const DetailButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.5),
        padding: PaddingHelper.eight.symmetricHorizontalx2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderHelper.thirtyFive.circular,
        ),
      ),
      icon: Icon(icon, color: AfectodColors.white),
      onPressed: onPressed,
    );
  }
}

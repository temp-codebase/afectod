import 'package:afectod/core/helpers/screen_util/screen_util.dart';
import 'package:flutter/material.dart';

class AuthFormContainer extends StatelessWidget {
  final Widget child;
  final double? verticalPadding;

  const AuthFormContainer({
    super.key,
    required this.child,
    this.verticalPadding = 32,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.width! * 0.07,
          vertical: verticalPadding!,
        ),
        child: child,
      ),
    );
  }
}


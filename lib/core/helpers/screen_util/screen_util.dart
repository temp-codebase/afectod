import 'package:flutter/material.dart';

final class ScreenUtil {
  static MediaQueryData? data;
  static double? width;
  static double? height;

  void init(BuildContext context) {
    data = MediaQuery.of(context);
    width = data?.size.width;
    height = data?.size.height;
  }
}

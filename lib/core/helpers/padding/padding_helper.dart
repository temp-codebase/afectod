import 'package:flutter/material.dart';

final class PaddingType {
  PaddingType._();
}

///Project's global padding class
enum PaddingHelper {
  ///This value is 0
  zero(0),

  ///This value is 4
  four(4),

  ///This value is 8
  eight(8),

  ///This value is 12
  twelve(12),

  ///This value is 16
  sixteen(16),

  ///This value is 20
  twenty(20),

  ///This value is 30
  thirty(30);

  final double value;
  const PaddingHelper(this.value);

  EdgeInsets get all => EdgeInsets.all(value);

  EdgeInsets get onlyHorizontal => EdgeInsets.symmetric(horizontal: value);

  EdgeInsets get onlyVertical => EdgeInsets.symmetric(vertical: value);

  EdgeInsets get allWithBottomNavigationBar =>
      EdgeInsets.fromLTRB(value, value, value, kBottomNavigationBarHeight * 2);

  EdgeInsets get symmetricHorizontalx2 =>
      EdgeInsets.symmetric(vertical: value, horizontal: value * 2);

  EdgeInsets get symmetricXHalf =>
      EdgeInsets.fromLTRB(value * 1.5, value * 1.25, value * 1.5, value * 1.5);

  EdgeInsets get bottomNavigationBarPadding =>
      EdgeInsets.fromLTRB(value * 1.5, value, value * 1.5, 0);
}

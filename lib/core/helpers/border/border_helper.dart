import 'package:flutter/material.dart';

final class BorderType {
  BorderType._();
}

/// Project's global border radius class
enum BorderHelper {
  /// This value is 25
  twentyFive(25),

  /// This value is 35
  thirtyFive(35),

  /// This value is 50
  fifty(50);

  final double value;
  const BorderHelper(this.value);

  BorderRadius get all => BorderRadius.circular(value);

  BorderRadius get circular => BorderRadius.circular(value);
}

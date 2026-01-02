import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class SettingsColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SettingsColumn({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: PaddingHelper.eight.value,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textTheme.titleLarge?.color,
          ),
        ),
        ...children,
      ],
    );
  }
}

import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class AfectodEmptyState extends StatelessWidget {
  final String message;
  final IconData? icon;
  final Widget? action;

  const AfectodEmptyState({
    super.key,
    required this.message,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: PaddingHelper.sixteen.all,
        child: Column(
          spacing: PaddingHelper.twelve.value,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 80,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}

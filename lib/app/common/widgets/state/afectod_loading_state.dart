import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:flutter/material.dart';

class AfectodLoadingState extends StatelessWidget {
  final String? message;

  const AfectodLoadingState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: PaddingHelper.twelve.value,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}

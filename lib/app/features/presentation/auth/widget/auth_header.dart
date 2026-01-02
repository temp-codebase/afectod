import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AfectodGap.m,
        Icon(CupertinoIcons.tickets_fill, size: 64, color: Colors.grey[400]),
        AfectodGap.s,
        Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        AfectodGap.s,
        Text(
          subtitle,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
        AfectodGap.l,
      ],
    );
  }
}

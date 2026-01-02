import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/title_formatter_extension.dart';
import 'package:flutter/cupertino.dart';

class DetailText extends StatelessWidget {
  final String title;
  const DetailText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final formattedTitle = title.formatTitle();
    
    return Stack(
      children: [
        Text(
          formattedTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = AfectodColors.black,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          formattedTitle,
          style: const TextStyle(
            color: AfectodColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/src/theme/app_colors.dart';

class AppTitle extends StatelessWidget {
  const AppTitle(
      {Key? key,
      this.leftPadding,
      this.topPadding,
      this.rightPadding,
      this.bottomPadding,
      this.alignment,
      required this.title,
      this.size = 36,
      this.color = AppColors.black})
      : super(key: key);

  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final MainAxisAlignment? alignment;
  final String title;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding ?? 0,
          top: topPadding ?? 0,
          right: rightPadding ?? 0,
          bottom: bottomPadding ?? 0),
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: size),
          ),
        ],
      ),
    );
  }
}

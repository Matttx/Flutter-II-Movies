import 'package:flutter/material.dart';
import 'package:movies/src/theme/app_colors.dart';

class ClassicAlertDialog extends StatelessWidget {
  const ClassicAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.buttonText,
      this.onPressed})
      : super(key: key);

  final String title;
  final String content;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.primary),
            ),
            onPressed: onPressed
        )
      ],
    );
    ;
  }
}

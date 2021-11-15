import 'package:flutter/material.dart';
import 'package:movies/src/theme/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.buttonText,
      this.onPressed,
      required this.isLoading})
      : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primary),
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 50)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: isLoading
            ? const Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3,
                    )))
            : Text(
                buttonText,
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ));
  }
}

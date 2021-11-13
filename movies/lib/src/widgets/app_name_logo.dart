import 'package:flutter/material.dart';
import 'package:movies/src/theme/app_colors.dart';

class AppNameLogo extends StatelessWidget {
  const AppNameLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/virus.png',
            width: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "myCovid",
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}

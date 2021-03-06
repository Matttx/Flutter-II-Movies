import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/src/pages/navigation_screen.dart';
import 'package:movies/src/theme/app_colors.dart';
import 'package:movies/src/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarBrightness: Brightness.dark
    ));

    return MaterialApp(
      title: 'Movies',
      theme: AppTheme.defaultTheme,
      home: isLoggedIn ? const NavigationScreen() : const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

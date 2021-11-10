import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/theme/app_colors.dart';

class AppTheme {
  static final ThemeData defaultTheme = _buildLightTheme();
  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.dark,

      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      primaryColorLight: AppColors.primaryLight,
      primaryColorBrightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.background,
      backgroundColor: AppColors.background,

      textTheme: base.textTheme.copyWith(
          headline1: base.textTheme.headline1!.copyWith(fontSize: 36),
          headline2: base.textTheme.headline2!.copyWith(fontSize: 24, color: AppColors.black),
          headline3: base.textTheme.headline3!.copyWith(fontSize: 20),
          headline4: base.textTheme.headline4!.copyWith(fontSize: 18),
          bodyText1: base.textTheme.bodyText1!.copyWith(fontSize: 15, color: AppColors.white),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,

      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      primaryColorLight: AppColors.primaryLight,
      primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: AppColors.darkLight,
      backgroundColor: AppColors.darkLight,

      textTheme: base.textTheme.copyWith(
        headline1: base.textTheme.headline1!.copyWith(fontSize: 36),
        headline2: base.textTheme.headline2!.copyWith(fontSize: 24, color: AppColors.white),
        headline3: base.textTheme.headline3!.copyWith(fontSize: 20),
        headline4: base.textTheme.headline4!.copyWith(fontSize: 18),
        bodyText1: base.textTheme.bodyText1!.copyWith(fontSize: 15, color: AppColors.white),
      ),
    );
  }
}
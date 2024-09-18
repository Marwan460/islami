import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

abstract class AppStyles {
  static const TextStyle appBarTextStyle = TextStyle(
      color: AppColors.accent, fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle titlesTextStyle = TextStyle(
      color: AppColors.accent, fontSize: 25, fontWeight: FontWeight.w600);
  static const TextStyle contentTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.transparent,
      titleTextStyle: AppStyles.appBarTextStyle,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: titlesTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent ,
    ) ,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    textTheme:  TextTheme(
      displayLarge: titlesTextStyle.copyWith(color: AppColors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accentDark,
    ) ,
  );
}

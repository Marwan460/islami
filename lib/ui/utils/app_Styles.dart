import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

abstract class AppStyles {
  static const TextStyle appBarTextStyle = TextStyle(
      color: AppColors.accent, fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle titles = TextStyle(
      color: AppColors.accent, fontSize: 25, fontWeight: FontWeight.w600);
}

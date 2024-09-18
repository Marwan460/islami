import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  late SharedPreferences storage;

  Future<void> getTheme() async{
    storage = await SharedPreferences.getInstance();
    if(storage.getBool("isDark")?? false){
      currentTheme = ThemeMode.dark;
    }else{
      currentTheme = ThemeMode.light;
    }
  }

  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
    bool isDark = currentTheme == ThemeMode.dark ? true : false;
    saveLanguage(isDark);
  }

  bool get isDarkThemeEnabled => currentTheme == ThemeMode.dark;

  Color get primaryColor => isDarkThemeEnabled ? AppColors.primaryDark : AppColors.primary;

  void saveLanguage (bool isDark){
    storage.setBool("isDark", true);
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String selectedLanguage = "en";
  late SharedPreferences storage;
  Future<void> getLanguage() async{
    storage = await SharedPreferences.getInstance();
    if(storage.getBool("isArabic") ?? false){
      selectedLanguage = "ar";
    }else{
      selectedLanguage = "en";
    }
  }

set newLanguage(String language) {
  selectedLanguage = language;
  notifyListeners();
  bool isArabic = language == "ar" ? true : false;
  saveLanguage(isArabic);
}
void saveLanguage (bool isArabic){
  storage.setBool("isArabic", true);
}
}
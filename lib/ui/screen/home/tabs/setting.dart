import 'package:flutter/material.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.displayLarge),
            buildDropdownButton(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.displayLarge),
                const Spacer(),
                buildSwitch(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownButton() {
    return DropdownButton(
        style: TextStyle(
            color: themeProvider.isDarkThemeEnabled
                ? AppColors.white
                : Colors.black),
        dropdownColor: themeProvider.isDarkThemeEnabled
            ? Colors.black
            : AppColors.white,
        isExpanded: true,
        value: languageProvider.selectedLanguage,
        items: const [
          DropdownMenuItem(
              value: "ar",
              child: Text(
                "العربية",
              )),
          DropdownMenuItem(
              value: "en",
              child: Text(
                "English",
              ))
        ],
        onChanged: (newValue) {
          languageProvider.newLanguage =
              newValue ?? languageProvider.selectedLanguage;
          setState(() {});
        });
  }

  Widget buildSwitch() {
    return Switch(
        activeColor: AppColors.primary,
        value: themeProvider.isDarkThemeEnabled,
        onChanged: (newValue) {
          themeProvider.newTheme = newValue ? ThemeMode.dark : ThemeMode.light;
          setState(() {});
        });
  }
}

import 'package:flutter/material.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widget/app_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class Setting extends StatefulWidget {
  Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDarkThemeEnable = false;
  late LanguageProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language, style: AppStyles.titles),
            buildDropdownButton(),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.theme, style: AppStyles.titles),
                Spacer(),
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
      isExpanded: true,
        value: provider.selectedLanguage,
        items: [
          DropdownMenuItem(value: "ar", child: Text("العربية")),
          DropdownMenuItem(value: "en", child: Text("English")),
        ],
        onChanged: (newValue) {
          provider.selectedLanguage = newValue!;
          provider.notifyListeners();
          setState(() {});
        });
  }

  Widget buildSwitch() {
    return Switch(
        activeColor: AppColors.primary,
        value: isDarkThemeEnable,
        onChanged: (newValue) {
          isDarkThemeEnable = newValue;
          setState(() {});
        });
  }
}

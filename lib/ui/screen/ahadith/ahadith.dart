import 'package:flutter/material.dart';
import 'package:islami/model/Hadith.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/widget/app_scaffold.dart';
import 'package:provider/provider.dart';

class Ahadith extends StatefulWidget {
  static const String routeName = "Hadith";

  const Ahadith({super.key});

  @override
  State<Ahadith> createState() => _AhadithState();
}

class _AhadithState extends State<Ahadith> {
  String fileContent = "";
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    Hadith args = ModalRoute.of(context)!.settings.arguments as Hadith;
    return AppScaffold(
      appBarTitle: args.title,
      body: buildAhadithContent(args.content),
    );
  }

  Widget buildAhadithContent(String content) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.primaryDark
                  : AppColors.primary,
              borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(
              child: Text(
            content,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: themeProvider.isDarkThemeEnabled
                    ? AppColors.accentDark
                    : Colors.black),
          ))),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}

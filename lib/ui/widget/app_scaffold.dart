import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../utils/app_styles.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;

  const AppScaffold({
    super.key,
    this.body,
    this.appBarTitle,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(themeProvider.isDarkThemeEnabled
                ? AppAssets.BackgroundDark
                : AppAssets.Background)),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(
            appBarTitle ?? "",
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}

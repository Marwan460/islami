import 'package:flutter/material.dart';

import '../utils/app_Styles.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  const AppScaffold({super.key, this.body, this.appBarTitle, this.bottomNavigationBar, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.Background)),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          title: Text(
            appBarTitle??"",
            style: AppStyles.appBarTextStyle,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}

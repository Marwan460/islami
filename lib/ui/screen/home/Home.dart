import 'package:flutter/material.dart';
import 'package:islami/ui/screen/home/tabs/ahadeth.dart';
import 'package:islami/ui/screen/home/tabs/quran.dart';
import 'package:islami/ui/screen/home/tabs/radio.dart';
import 'package:islami/ui/screen/home/tabs/sebha.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widget/app_scaffold.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTab = 0;
  List<Widget> tabs = [Quran(), Ahadeth(), Sebha(), MyRadio()];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Islami",
      body: tabs[selectedTab],
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (Index) {
            selectedTab = Index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.IcQuran)),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.IcHadeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.IcSebha)),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.IcRadio)),
                label: "Radio"),
          ],
          iconSize: 40,
          selectedItemColor: AppColors.accent,
        ),
      ),
    );
  }
}

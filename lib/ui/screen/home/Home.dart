import 'package:flutter/material.dart';
import 'package:islami/ui/screen/home/tabs/ahadeth.dart';
import 'package:islami/ui/screen/home/tabs/quran.dart';
import 'package:islami/ui/screen/home/tabs/radio.dart';
import 'package:islami/ui/screen/home/tabs/sebha.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.Background)),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: BuildAppBar(),
        bottomNavigationBar: buildButton(),
        body: tabs[selectedTab],
      ),
    );
  }

  Theme buildButton() {
    return Theme(
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
      );
  }

  AppBar BuildAppBar() => AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          "اسلامي",
          style: AppStyles.appBarTextStyle,
        ),
        centerTitle: true,
      );
}

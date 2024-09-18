import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/screen/home/tabs/ahadeth.dart';
import 'package:islami/ui/screen/home/tabs/quran.dart';
import 'package:islami/ui/screen/home/tabs/radio.dart';
import 'package:islami/ui/screen/home/tabs/sebha.dart';
import 'package:islami/ui/screen/home/tabs/setting.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widget/app_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTab = 0;
  List<Widget> tabs = const [Quran(), Ahadeth(), Sebha(), MyRadio(), Setting()];
  late ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return AppScaffold(
      appBarTitle: AppLocalizations.of(context)!.islami,
      body: tabs[selectedTab],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: themeProvider.primaryColor),
        child: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (Index) {
            selectedTab = Index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.IcQuran)),
              label: AppLocalizations.of(context)!.quran,),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.IcHadeth)),
              label: AppLocalizations.of(context)!.ahadeth,),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.IcSebha)),
              label: AppLocalizations.of(context)!.sebha,),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.IcRadio)),
              label: AppLocalizations.of(context)!.radio,),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.IcSetting)),
              label: AppLocalizations.of(context)!.settings,),
          ],
          iconSize: 40,
        ),
      ),
    );
  }
}

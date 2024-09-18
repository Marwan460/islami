import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int count = 0;
  String zikr = "سبحان الله";
  double rotation = 0;
  late ThemeProvider themeProvider;

  void increaseCounter(){
    setState(() {
      count++;
      rotation+= 10;
      if(count>33){
        count = 0;
        if(zikr == "سبحان الله"){
          zikr = "الحمد لله";
        }else if(zikr == "الحمد لله"){
          zikr = "الله اكبر";
        }else{
          zikr = "سبحان الله";
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Stack(alignment: Alignment.center, children: [
      Positioned(
          left: 140,
          top: 0,
          bottom: 475,
          child: Image.asset(
            width: 180,
            height: 250,
            themeProvider.isDarkThemeEnabled ? AppAssets.HeadSephaDark :
            AppAssets.HeadSebha,
          )),
      Positioned(
          top: 80,
          child: GestureDetector(
            onTap: increaseCounter,
            child: AnimatedRotation(
              turns: rotation/360,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                width: 200,
                height: 300,
                themeProvider.isDarkThemeEnabled ? AppAssets.SebhaDark :
                AppAssets.Sebha,
              ),
            ),
          )),
      Positioned(
          bottom: 310, child: Text(style: Theme.of(context).textTheme.displayLarge, "عدد التسبيحات")),
      Positioned(
          bottom: 240,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary),
            alignment: Alignment.center,
            width: 60,
            height: 70,
            child: Text(style: Theme.of(context).textTheme.displayLarge, "$count"),
          )),
      Positioned(
          bottom: 150,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary),
            alignment: Alignment.center,
            width: 150,
            height: 70,
            child: Text(style: Theme.of(context).textTheme.displayLarge, zikr),
          )),
    ]);
  }
}

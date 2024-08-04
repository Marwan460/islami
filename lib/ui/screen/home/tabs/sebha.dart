import 'package:flutter/material.dart';

import '../../../utils/app_Styles.dart';
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

  void incresCounter(){
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
    return Stack(alignment: Alignment.center, children: [
      Positioned(
          left: 140,
          top: 0,
          child: Image.asset(
            width: 180,
            height: 250,
            AppAssets.HeadSebha,
          )),
      Positioned(
          top: 100,
          child: GestureDetector(
            onTap: incresCounter,
            child: AnimatedRotation(
              turns: rotation/360,
              duration: Duration(milliseconds: 300),
              child: Image.asset(
                width: 200,
                height: 300,
                AppAssets.Sebha,
              ),
            ),
          )),
      Positioned(
          bottom: 320, child: Text(style: AppStyles.titles, "عدد التسبيحات")),
      Positioned(
          bottom: 240,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary),
            alignment: Alignment.center,
            width: 60,
            height: 70,
            child: Text(style: AppStyles.titles, "$count"),
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
            child: Text(style: AppStyles.titles, "$zikr"),
          )),
    ]);
  }
}

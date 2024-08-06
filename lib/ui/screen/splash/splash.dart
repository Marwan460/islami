import 'package:flutter/material.dart';
import 'package:islami/ui/screen/home/Home.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

class Splash extends StatefulWidget {
  static const String routeName = "Splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.Spalsh), fit: BoxFit.cover)),
      child: Scaffold(backgroundColor: AppColors.transparent,),
    );
  }
}

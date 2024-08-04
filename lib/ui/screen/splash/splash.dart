import 'package:flutter/material.dart';
import 'package:islami/ui/screen/home/Home.dart';
import 'package:islami/ui/utils/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = "Splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, Home.routeName);
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.Spalsh),
    );
  }
}

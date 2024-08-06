import 'package:flutter/material.dart';
import 'package:islami/model/Hadith.dart';
import 'package:islami/ui/screen/ahadith/ahadith.dart';
import 'package:islami/ui/screen/home/Home.dart';
import 'package:islami/ui/screen/splash/splash.dart';
import 'package:islami/ui/screen/suras/suras.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => Splash(),
        Home.routeName: (_) => Home(),
        Suras.routeName: (_) => Suras(),
        Ahadith.routeName: (_) => Ahadith(),

      },
      initialRoute: Splash.routeName,
    );
  }
}


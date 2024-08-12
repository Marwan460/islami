import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/ui/screen/ahadith/ahadith.dart';
import 'package:islami/ui/screen/home/Home.dart';
import 'package:islami/ui/screen/splash/splash.dart';
import 'package:islami/ui/screen/suras/suras.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {LanguageProvider();},
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale:  Locale(provider.selectedLanguage),



      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => Home(),
        Suras.routeName: (_) => Suras(),
        Ahadith.routeName: (_) => Ahadith(),

      },
      initialRoute: Splash.routeName,
    );
  }
}


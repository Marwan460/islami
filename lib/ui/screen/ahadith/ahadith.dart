import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/Hadith.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widget/app_scaffold.dart';

class Ahadith extends StatefulWidget {
  static const String routeName = "Hadith";

  @override
  State<Ahadith> createState() => _AhadithState();
}

class _AhadithState extends State<Ahadith> {
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
   Hadith args = ModalRoute.of(context)!.settings.arguments as Hadith;
   return AppScaffold(
     appBarTitle: args.title,
     body: buildAhadithContent(args.content),
   );
  }

  Widget buildAhadithContent(String content) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(child: Text(content, textDirection: TextDirection.rtl))),
    );
  }

  Widget buildLoading() => const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ));


}

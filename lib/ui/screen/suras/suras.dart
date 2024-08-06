import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/Suras_args.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widget/app_scaffold.dart';

class Suras extends StatefulWidget {
  static const String routeName = "Suras";

  @override
  State<Suras> createState() => _SurasState();
}

class _SurasState extends State<Suras> {
  late SurasArgs args;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SurasArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return AppScaffold(
      appBarTitle: args.suraName,
      body: fileContent.isEmpty ? buildLoading() : buildSuraContent(),
    );
  }

  Widget buildSuraContent() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(child: Text(fileContent, textDirection: TextDirection.rtl))),
    );
  }

  Widget buildLoading() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primary,
      ));

  Future readFile() async {
    fileContent =
        await rootBundle.loadString("assets/files/quran/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}

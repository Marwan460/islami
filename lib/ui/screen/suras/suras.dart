import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/Suras_args.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("${args.suraName}"),
      ),
      body: SingleChildScrollView(child: Text("$fileContent",textDirection: TextDirection.rtl)),
    );
  }

  Future readFile() async {
    fileContent =
        await rootBundle.loadString("assets/files/quran/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for(int i = 0; i < fileLines.length; i++){
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}

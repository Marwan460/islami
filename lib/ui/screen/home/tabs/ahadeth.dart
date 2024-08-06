import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/Hadith.dart';
import 'package:islami/ui/screen/ahadith/ahadith.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constant.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadith> hadithList = [];

  @override
  void initState() {
    super.initState();
    readAhadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.LogoHadeth)),
        Expanded(
            flex: 7,
            child: Column(
              children: [
                buildDivider(),
                const Text(
                  "الأحاديث",
                  style: AppStyles.titles,
                ),
                buildDivider(),
                buildAhadeathList(),
              ],
            ))
      ],
    );
  }

  Divider buildDivider() {
    return const Divider(
      color: AppColors.primary,
      thickness: 3,
    );
  }

  Widget buildAhadeathList() {
    return hadithList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primary,
          ))
        : Expanded(
            flex: 7,
            child: ListView.builder(
                itemCount: hadithList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Ahadith.routeName, arguments: hadithList[index]);
                      setState(() {

                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          hadithList[index].title,
                          style: AppStyles.titles,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  );
                }));
  }

  Future readAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString(constant.hadethFilePath);
    List<String> ahadethAsString = ahadethFileContent.split("#\r\n");
    for (int i = 0; i < ahadethAsString.length; i++) {
      String hadith = ahadethAsString[i];
      List<String> hadithLines = hadith.split("\n");
      String hadithName = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join();
      hadithList.add(Hadith(hadithName.trim(), hadithContent));
    }
    setState(() {});
  }
}

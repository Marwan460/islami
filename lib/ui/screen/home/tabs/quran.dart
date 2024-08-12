import 'package:flutter/material.dart';
import 'package:islami/ui/screen/suras/suras.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../model/Suras_args.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.QuranLogo)),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  buildDivider(),
                   Row(
                    children: [
                      Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.suarName,
                        style: AppStyles.titles,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.verses,
                        style: AppStyles.titles,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  buildDivider(),
                  buildSurasName(),
                ],
              ),
              const VerticalDivider(
                color: AppColors.primary,
                thickness: 3,
                indent: 8,
              )
            ],
          ),
        )
      ],
    );
  }

  Expanded buildSurasName() {
    return Expanded(
        flex: 7,
        child: ListView.builder(
            itemCount: 114,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Suras.routeName,
                      arguments: SurasArgs(
                          suraName: constant.suraNames[index],
                          fileName: "${index + 1}.txt"));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      constant.suraNames[index],
                      style: AppStyles.titles,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      constant.verses[index].toString(),
                      style: AppStyles.titles,
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              );
            }));
  }

  Divider buildDivider() {
    return Divider(
      color: AppColors.primary,
      thickness: 3,
    );
  }
}

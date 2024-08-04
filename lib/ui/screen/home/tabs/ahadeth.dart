import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_Styles.dart';
import 'package:islami/ui/utils/app_assets.dart';

import '../../../utils/app_colors.dart';

class Ahadeth extends StatelessWidget {
  const Ahadeth({super.key});

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
                Text("الأحاديث",style: AppStyles.titles,),
                buildDivider(),
                Text("الحديث رقم 1",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 2",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 3",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 4",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 5",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 6",style: AppStyles.titles,),
                Spacer(),
                Text("الحديث رقم 7",style: AppStyles.titles,),
                Spacer(),
              ],
            ))
      ],
    );
  }
  Divider buildDivider() {
    return Divider(
      color: AppColors.primary,
      thickness: 3,
    );
  }
}

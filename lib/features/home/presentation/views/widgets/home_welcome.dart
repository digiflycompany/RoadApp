import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(StringManager.welcome.tr(context),
                    style: Styles.textStyle12),
                SizedBox(width: 3.w),
                SvgPicture.asset(AppAssets.wave)
              ]),
              Row(children: [
                Text('احمد جلال الدين, ', style: Styles.textStyle12),
                Text(StringManager.yourRoadIsSafe.tr(context),
                    style: Styles.textStyle12)
              ])
            ]),
            Gap(50.w),
            const Icon(Icons.location_pin),
            Flexible(
                child: Text(StringManager.egyptCairo.tr(context),
                    style: Styles.textStyle12,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1))
          ]))
    ]);
  }
}
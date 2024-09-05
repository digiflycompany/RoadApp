import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(StringManager.welcome.tr(context),
                    style: TextStyle(fontSize: 16.sp)),
                SizedBox(width: 3.w),
                SvgPicture.asset(AppAssets.wave)
              ]),
              Row(children: [
                Text('احمد جلال الدين, ', style: TextStyle(fontSize: 14.sp)),
                Text(StringManager.yourRoadIsSafe.tr(context),
                    style: TextStyle(fontSize: 14.sp))
              ])
            ]),
            Row(children: [
              const Icon(Icons.location_pin),
              Text(StringManager.egyptCairo.tr(context),
                  style: TextStyle(
                      fontFamily: StringManager.fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp))
            ])
          ]))
    ]);
  }
}
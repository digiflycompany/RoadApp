import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/views/screens/oils_and_consumables_centers_screen.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class OilsAndConsumablesItem extends StatelessWidget {
  const OilsAndConsumablesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AppNavigation.navigate(const OilsAndConsumablesCentersScreen());
        },
        child: Container(
            padding: EdgeInsets.only(top: 14.h, right: 9.w, left: 9.w),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFD7D7D7),
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  height: 80.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                          width: 100.w, height: 100.h, AppAssets.wrench))),
              SizedBox(height: 5.h),
              Expanded(
                  child: Text(StringManager.oilsAndConsumables.tr(context),
                      style: TextStyle(fontSize: 9.sp), textAlign: TextAlign.center))
            ])));
  }
}
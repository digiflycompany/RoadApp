import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class FuelConsumingItem extends StatelessWidget {
  const FuelConsumingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor2, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.fuelCounter,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "العداد قبل اضافة الوقود:",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          AppAssets.kmBoard,
                          height: 17.h,
                          width: 17.w),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "عدد الكيلوهات:",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.kmBoard,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "عدد الكيلوهات / جم:",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.kmBoard,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "عدد الكيلوهات / لتر:",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.fuelGun,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "عدد اللترات:",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.moneyIcon,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("سعر اللتر:", style: TextStyle(fontSize: 11.sp)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.moneyIcon,
                        height: 17.h,
                        width: 17.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("سعر التفويله:", style: TextStyle(fontSize: 11.sp)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

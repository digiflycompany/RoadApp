import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.greyColor2.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextField(
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: StringManager.search.tr(context),
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                      border: InputBorder.none,
                      suffixIcon: const Icon(CupertinoIcons.search,
                          color: Colors.grey, size: 20))))),
      SizedBox(width: 10.w),
      GestureDetector(
          onTap: () {
            showCustomAlertDialog(
                context: context,
                title: StringManager.addService.tr(context),
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      Text(StringManager.pleaseEnterServiceTitle.tr(context),
                          style: TextStyle(fontSize: 12.sp),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.all(10.w),
                          child: TextField(
                              maxLines: 3,
                              decoration: InputDecoration.collapsed(
                                  hintText:
                                      StringManager.yourMessage.tr(context),
                                  hintStyle: TextStyle(fontSize: 12.sp)))),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomElevatedButton(
                          onTap: () {
                            AppNavigation.back();
                          },
                          widget: Text(StringManager.add.tr(context),
                              style: TextStyle(fontSize: 10.sp)))
                    ]));
          },
          child: Container(
              height: 40.h,
              width: 35.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: SvgPicture.asset(AppAssets.addIcon))))
    ]);
  }
}
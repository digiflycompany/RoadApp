import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

import '../navigation/navigation.dart';

enum NotificationType { error, success, warning, info }

void showDefaultDialog(BuildContext context,
    {required NotificationType type,
    String? title,
    VoidCallback? onProgressFinished,
    required String description}) {
  var width = MediaQuery.of(context).size.width;
  switch (type) {
    case NotificationType.error:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
              buttonPadding: EdgeInsets.zero,
              content: SizedBox(
                  height: 176,
                  width: width * .7,
                  child: Column(children: [
                    if (title != null)
                      Container(
                          padding: const EdgeInsets.all(24),
                          height: 88,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFE2E2),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Row(children: [
                            SvgPicture.asset(AppAssets.error),
                            const Gap(10),
                            Expanded(
                                child: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis
                                )
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () => AppNavigation.back(),
                                child: SvgPicture.asset(AppAssets.x))
                          ])),
                    Container(
                        height: (176 - 88),
                        width: width * .7,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24))),
                        child: Center(child: Text(description)))
                  ]))));
      break;
    case NotificationType.success:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
              buttonPadding: EdgeInsets.zero,
              content: SizedBox(
                  height: 176,
                  width: width * .7,
                  child: Column(children: [
                    if (title != null)
                      Container(
                          padding: const EdgeInsets.all(24),
                          height: 88,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: Color(0xffD8FFE7),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Row(children: [
                            SvgPicture.asset(AppAssets.success),
                            const Gap(10),
                            Expanded(
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                              )
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child: SvgPicture.asset(AppAssets.x))
                          ])),
                    Container(
                        height: (176 - 88),
                        width: width * .7,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24))),
                        child: Center(child: Text(description))),
                  ]))));
      break;
    case NotificationType.info:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
              buttonPadding: EdgeInsets.zero,
              content: SizedBox(
                  height: 200.h,
                  width: width * .7,
                  child: Column(children: [
                    if (title != null)
                      Container(
                          height: 40.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Center(child: Text(title))),
                    Container(
                        height: 160.h,
                        width: width * .7,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24))),
                        child: Center(child: Text(description)))
                  ]))));
      break;
    default:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
              buttonPadding: EdgeInsets.zero,
              content: SizedBox(
                  height: 200.h,
                  width: width * .7,
                  child: Column(children: [
                    if (title != null)
                      Container(
                          height: 40.h,
                          width: width * .7,
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Center(child: Text(title))),
                    Container(
                        height: 160.h,
                        width: width * .7,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24))),
                        child: Center(child: Text(description)))
                  ]))));
      break;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';

void showSearchFilter(BuildContext context) {
  var cubit = HomeCubit.get(context);
  showCustomAlertDialog(
      context: context,
      title: StringManager.selectSector.tr(context),
      content:
      StatefulBuilder(builder: (ctxx, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CheckboxListTile(
                      title: Text(
                        'قطاع',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight:
                            FontWeight.w600),
                      ),
                      controlAffinity:
                      ListTileControlAffinity
                          .leading,
                      checkColor: Colors.black,
                      fillColor:
                      const WidgetStatePropertyAll(
                          AppColors.whiteColor),
                      contentPadding: EdgeInsets.zero,
                      value: cubit.checkBoxService,
                      onChanged: (val) {
                        cubit.checkBoxService = val!;
                        setState(() {});
                      }),
                ),
                Flexible(
                  child: CheckboxListTile(
                      title: Text(
                        'قطاع',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight:
                            FontWeight.w600),
                      ),
                      controlAffinity:
                      ListTileControlAffinity
                          .leading,
                      checkColor: Colors.black,
                      fillColor:
                      const WidgetStatePropertyAll(
                          AppColors.whiteColor),
                      contentPadding: EdgeInsets.zero,
                      value: cubit.checkBoxService2,
                      onChanged: (val) {
                        cubit.checkBoxService2 = val!;
                        setState(() {});
                      })
                )
              ]
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CheckboxListTile(
                      title: Text(
                        'قطاع',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight:
                            FontWeight.w600),
                      ),
                      controlAffinity:
                      ListTileControlAffinity
                          .leading,
                      checkColor: Colors.black,
                      fillColor:
                      const WidgetStatePropertyAll(
                          AppColors.whiteColor),
                      contentPadding: EdgeInsets.zero,
                      value: cubit.checkBoxService3,
                      onChanged: (val) {
                        cubit.checkBoxService3 = val!;
                        setState(() {});
                      }),
                ),
                Flexible(
                  child: CheckboxListTile(
                      title: Text(
                        'قطاع',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight:
                            FontWeight.w600),
                      ),
                      controlAffinity:
                      ListTileControlAffinity
                          .leading,
                      checkColor: Colors.black,
                      fillColor:
                      const WidgetStatePropertyAll(
                          AppColors.whiteColor),
                      contentPadding: EdgeInsets.zero,
                      value: cubit.checkBoxService4,
                      onChanged: (val) {
                        cubit.checkBoxService4 = val!;
                        setState(() {});
                      }),
                ),
              ],
            ),
            Flexible(
              child: CheckboxListTile(
                  title: Text(
                    'قطاع',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  controlAffinity:
                  ListTileControlAffinity.leading,
                  checkColor: Colors.black,
                  fillColor:
                  const WidgetStatePropertyAll(
                      AppColors.whiteColor),
                  contentPadding: EdgeInsets.zero,
                  value: cubit.checkBoxService5,
                  onChanged: (val) {
                    cubit.checkBoxService5 = val!;
                    setState(() {});
                  }),
            ),
            CustomElevatedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                widget: Text(
                  'اختر',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                ))
          ],
        );
      }));
}
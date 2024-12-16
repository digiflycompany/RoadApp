import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:roadapp/core/widgets/custom_text_field.dart';
import 'package:roadapp/features/services_guide/views/widgets/service_type_drop_down.dart';

import '../../../../core/Theming/styles.dart';
import '../cubit/maintenance_service_type_cubit.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceServiceTypeVendorCubit, MaintenanceServiceTypeVendorState>(
      builder: (context, state) {
        var cubit = MaintenanceServiceTypeVendorCubit.get(context);
        return Row(
          children: [
            Expanded(
              child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                      color: AppColors.greyColor2.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: TextField(
                      style: Styles.textStyle12,
                      //onChanged: onChanged,
                      onSubmitted: onChanged,
                      onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          hintText: StringManager.search.tr(context),
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                          border: InputBorder.none,
                          prefixIcon: const Icon(CupertinoIcons.search,
                              color: Colors.grey, size: 17.5)))),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                cubit.fetchMaintenanceServiceTypeDropDown();
                showCustomAlertDialog(
                  context: context,
                  title: StringManager.addService.tr(context),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        // Text(StringManager.pleaseEnterServiceTitle.tr(context),
                        //     style: TextStyle(fontSize: 12.sp),
                        //     textAlign: TextAlign.center),
                    
                        Text(StringManager.serviceType.tr(context),
                            style: TextStyle(fontSize: 12.sp),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 10.h,
                        ),
                        ServiceTypeDropDown(hint: StringManager.serviceType.tr(context),),
                    
                        SizedBox(height: 10.h),
                    
                        Text(StringManager.carModel.tr(context),
                            style: TextStyle(fontSize: 12.sp),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextField(
                          height: 40.h,
                            hintText: StringManager.carModel.tr(context),
                            controller: TextEditingController()
                        ),
                    
                        SizedBox(
                          height: 10.h,
                        ),
                    
                        Text(StringManager.cost.tr(context),
                            style: TextStyle(fontSize: 12.sp),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextField(
                            height: 40.h,
                            hintText: StringManager.cost.tr(context),
                            controller: TextEditingController()
                        ),
                    
                    
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey[200],
                        //       borderRadius: BorderRadius.circular(10.r)),
                        //   padding: EdgeInsets.all(10.w),
                        //   child: TextField(
                        //     maxLines: 3,
                        //     decoration: InputDecoration.collapsed(
                        //       hintText: StringManager.yourMessage.tr(context),
                        //       hintStyle: TextStyle(
                        //         fontSize: 12.sp,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomElevatedButton(
                            onTap: () {
                              AppNavigation.back();
                            },
                            widget: Text(StringManager.add.tr(context),
                                style: TextStyle(fontSize: 10.sp)))
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                height: 40.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w, vertical: 14.h),
                  child: SvgPicture.asset(
                    AppAssets.addIcon,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

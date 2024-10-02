import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_component.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: GestureDetector(
            onTap: () {
              showCustomAlertDialog(
                  context: context,
                  title: StringManager.addVehicle.tr(context),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 10.h),
                    AddVehicleComponent(
                        firstText: StringManager.itemCode.tr(context),
                        secondText: StringManager.itemName.tr(context)),
                    AddVehicleComponent(
                        firstText: StringManager.unit.tr(context),
                        secondText: StringManager.quantity.tr(context)),
                    AddVehicleComponent(
                        firstText: StringManager.price.tr(context),
                        secondText: StringManager.value.tr(context)),
                    CustomElevatedButton(
                        onTap: () {
                          AppNavigation.back();
                        },
                        widget: Text(StringManager.add.tr(context),
                            style: TextStyle(fontSize: 10.sp)))
                  ]));
            },
            child: Container(
                width: 85.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(AppAssets.addIcon, width: 12.w),
                  SizedBox(width: 5.w),
                  Text(StringManager.addProduct.tr(context),
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600))
                ]))));
  }
}
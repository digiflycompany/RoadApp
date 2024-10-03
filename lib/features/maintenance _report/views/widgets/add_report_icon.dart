import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/vehicles/widgets/add_vehicle_component.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class AddReportIcon extends StatelessWidget {
  const AddReportIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 35.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryColor),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: SvgPicture.asset(AppAssets.addIcon),
                onTap: () {
                  showCustomAlertDialog(
                      context: context,
                      title: StringManager.addReport.tr(context),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        AddVehicleComponent(
                            firstText: StringManager.centerName.tr(context),
                            secondText: StringManager.phoneNumber.tr(context),
                            required: false, firstController: TextEditingController(), secondController: TextEditingController()),
                        AddVehicleComponent(
                            firstText: StringManager.serviceType.tr(context),
                            secondText: StringManager.price.tr(context),
                            required: false,  firstController: TextEditingController(), secondController: TextEditingController()),
                        AddVehicleComponent(
                            firstText: StringManager.productType.tr(context),
                            secondText: StringManager.price.tr(context),
                            required: false,  firstController: TextEditingController(), secondController: TextEditingController()),
                        CustomElevatedButton(
                            onTap: () {},
                            widget: Text(StringManager.add.tr(context),
                                style: TextStyle(fontSize: 11.sp)))
                      ]));
                })));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/modules/vehicles/widgets/add_vehicle_component.dart';
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
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: SvgPicture.asset(AppAssets.addIcon),
            onTap: () {
              showCustomAlertDialog(
                  context: context,
                  title: "إضافة تقرير",
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AddVehicleComponent(firstText: 'اسم المركز', secondText: 'رقم الهاتف',required: false,),
                      const AddVehicleComponent(firstText: 'نوع الخدمة', secondText: 'السعر',required: false,),
                      const AddVehicleComponent(firstText: 'نوع المنتج', secondText: 'السعر',required: false,),
                      CustomElevatedButton(
                          onTap: () {},
                          widget: Text('     اضف     ',style: TextStyle(
                              fontSize: 11.sp
                          ),))
                    ],
                  ));
            },
          ),
        ));
  }
}

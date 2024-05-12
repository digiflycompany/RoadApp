import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/vehicles/widgets/add_vehicle_component.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

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
            child: SvgPicture.asset(AppImages.addIcon),
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

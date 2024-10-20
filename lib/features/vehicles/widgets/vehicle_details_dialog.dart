import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class VehicleDetailsDialog extends StatelessWidget {
  const VehicleDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Wrap(
                runSpacing: 7, children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.brand.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('تويوتا ', style: TextStyle(fontSize: 9.sp))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('${StringManager.car.tr(context)}: ',
                        style: TextStyle(fontSize: 9.sp)),
                    Text('كورونا ', style: TextStyle(fontSize: 9.sp))
                  ])),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.manufactureYear.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('2015 ', style: TextStyle(fontSize: 9.sp))
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.licensePlateNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('أ ب ت 1 2 3  ', style: TextStyle(fontSize: 9.sp))
              ]),
              SizedBox(width: 64.w),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.transmissionType.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text(' ', style: TextStyle(fontSize: 9.sp))
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.chassisNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('55 ', style: TextStyle(fontSize: 9.sp))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('${StringManager.tankCapacity.tr(context)}: ',
                        style: TextStyle(fontSize: 9.sp)),
                    Text('50 ${StringManager.l.tr(context)}',
                        style: TextStyle(fontSize: 9.sp))
                  ])),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.engineNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('1848', style: TextStyle(fontSize: 9.sp))
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.ccsNum.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('1950 ${StringManager.cc.tr(context)}',
                    style: TextStyle(fontSize: 9.sp))
              ])
            ])));
  }
}
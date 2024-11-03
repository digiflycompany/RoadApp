import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

class VehicleDetailsDialog extends StatelessWidget {
  const VehicleDetailsDialog({super.key, required this.vehicle});
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Wrap(runSpacing: 7, children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.brand.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text(vehicle.make ?? '', style: TextStyle(fontSize: 9.sp))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('${StringManager.car.tr(context)}: ',
                        style: TextStyle(fontSize: 9.sp)),
                    Text(vehicle.model ?? '', style: TextStyle(fontSize: 9.sp))
                  ])),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.manufactureYear.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('', style: TextStyle(fontSize: 9.sp))
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.licensePlateNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text(vehicle.plateNumber ?? '',
                    style: TextStyle(fontSize: 9.sp))
              ]),
              SizedBox(width: 64.w),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.transmissionType.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text(vehicle.gearShiftType ?? '',
                    style: TextStyle(fontSize: 9.sp))
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.chassisNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text(vehicle.chassisNumber ?? '',
                    style: TextStyle(fontSize: 9.sp))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('${StringManager.tankCapacity.tr(context)}: ',
                        style: TextStyle(fontSize: 9.sp)),
                    Text(vehicle.tankCapacity ?? '',
                        style: TextStyle(fontSize: 9.sp))
                  ])),
              /*Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.engineNumber.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('1848', style: TextStyle(fontSize: 9.sp))
              ]),*/
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text('${StringManager.ccsNum.tr(context)}: ',
                    style: TextStyle(fontSize: 9.sp)),
                Text('${vehicle.ccNumber} ${StringManager.cc.tr(context)}',
                    style: TextStyle(fontSize: 9.sp))
              ])
            ])));
  }
}
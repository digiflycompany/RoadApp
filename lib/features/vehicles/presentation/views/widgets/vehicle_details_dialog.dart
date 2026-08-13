import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';

class VehicleDetailsDialog extends StatelessWidget {
  const VehicleDetailsDialog({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    // دالة للتحقق من اللغة الإنجليزية
    bool isEnglish(String text) {
      return RegExp(r'^[a-zA-Z0-9\s\W]+$').hasMatch(text);
    }

    TextStyle textStyle(String text) => TextStyle(
          fontSize: isEnglish(text) ? 12.sp : 9.sp,
          fontWeight: isEnglish(text) ? FontWeight.w600 : FontWeight.w400,
        );

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Wrap(
          runSpacing: 7,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.brand.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.brand.tr(context)}: ',
                  ),
                ),
                Text(
                  vehicle.brandId?.name ?? '',
                  style: textStyle(
                    vehicle.brandId?.name ?? '',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${StringManager.car.tr(context)}: ',
                    style: textStyle(
                      '${StringManager.car.tr(context)}: ',
                    ),
                  ),
                  Text(
                    vehicle.model ?? '',
                    style: textStyle(
                      vehicle.model ?? '',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.manufactureYear.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.manufactureYear.tr(context)}: ',
                  ),
                ),
                Text(
                  '',
                  style: textStyle(''),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.licensePlateNumber.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.licensePlateNumber.tr(context)}: ',
                  ),
                ),
                Text(
                  vehicle.plateNumber ?? '',
                  style: textStyle(
                    vehicle.plateNumber ?? '',
                  ),
                ),
              ],
            ),
            SizedBox(width: 64.w),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.transmissionType.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.transmissionType.tr(context)}: ',
                  ),
                ),
                Text(
                  vehicle.gearShiftType ?? '',
                  style: textStyle(
                    vehicle.gearShiftType ?? '',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.chassisNumber.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.chassisNumber.tr(context)}: ',
                  ),
                ),
                Text(
                  vehicle.chassisNumber ?? '',
                  style: textStyle(
                    vehicle.chassisNumber ?? '',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${StringManager.tankCapacity.tr(context)}: ',
                    style: textStyle(
                      '${StringManager.tankCapacity.tr(context)}: ',
                    ),
                  ),
                  Text(
                    vehicle.tankCapacity ?? '',
                    style: textStyle(
                      vehicle.tankCapacity ?? '',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${StringManager.ccsNum.tr(context)}: ',
                  style: textStyle(
                    '${StringManager.ccsNum.tr(context)}: ',
                  ),
                ),
                Text(
                  '${vehicle.ccNumber} ${StringManager.cc.tr(context)}',
                  style: textStyle(
                    '${vehicle.ccNumber} ${StringManager.cc.tr(context)}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

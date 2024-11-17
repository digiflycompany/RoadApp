import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class MaintenanceServicePrice extends StatelessWidget {
  const MaintenanceServicePrice({super.key, required this.price, required this.phoneNumber});

  final String price;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          Row(children: [
            const Icon(Icons.phone_enabled, size: 18),
            const SizedBox(width: 3),
            Text(phoneNumber,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ]),
          const Gap(8),
          Row(children: [
            Text(StringManager.coolingCycleMaintenance.tr(context),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(
                "${StringManager.price.tr(context)}: $price ${StringManager.le.tr(context)}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ])
        ]));
  }
}
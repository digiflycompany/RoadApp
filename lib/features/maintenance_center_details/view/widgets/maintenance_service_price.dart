import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class MaintenanceServicePrice extends StatelessWidget {
  const MaintenanceServicePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          Row(children: [
            const Icon(Icons.phone_enabled, size: 18),
            const SizedBox(width: 3),
            Text("0123456789",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ]),
          const Gap(8),
          Row(children: [
            Text(StringManager.coolingCycleMaintenance.tr(context),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(
                "${StringManager.price.tr(context)}: 320 ${StringManager.le.tr(context)}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ])
        ]));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class ServiceData extends StatelessWidget {
  const ServiceData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(StringManager.coolingCycleMaintenance.tr(context),
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
      const Spacer(),
      Text(
          "${StringManager.price.tr(context)}: 320 ${StringManager.le.tr(context)}",
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
    ]);
  }
}
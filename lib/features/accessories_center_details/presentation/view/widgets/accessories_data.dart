import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AccessoriesData extends StatelessWidget {
  const AccessoriesData({super.key});

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
            Text(StringManager.accessories.tr(context),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(
                "${StringManager.price.tr(context)}: 320 ${StringManager.le.tr(context)}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ])
        ]));
  }
}
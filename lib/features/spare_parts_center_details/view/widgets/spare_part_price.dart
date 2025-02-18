import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class SparePartPrice extends StatelessWidget {
  const SparePartPrice({super.key, required this.phoneNumber, required this.price});

  final String phoneNumber;
  final String price;
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
            Text(StringManager.spareParts.tr(context),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(
                "${StringManager.price.tr(context)}: $price ${StringManager.le.tr(context)}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold))
          ])
        ]));
  }
}
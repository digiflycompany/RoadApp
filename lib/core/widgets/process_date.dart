import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/vehicles/widgets/share_button.dart';

class ProcessDate extends StatelessWidget {
  const ProcessDate({super.key, this.filterButton});
  final Widget? filterButton;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(StringManager.processDate.tr(context),
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.h),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('${StringManager.from.tr(context)}: '),
        SizedBox(width: 5.w),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3.r)),
            child: const Text(' 2023/01/01 ',
                style: TextStyle(fontWeight: FontWeight.w700))),
        SizedBox(width: 16.w),
        Text('${StringManager.to.tr(context)}: '),
        SizedBox(width: 5.w),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3.r)),
            child: const Text(' 2023/01/01 ',
                style: TextStyle(fontWeight: FontWeight.w700))),
        const Spacer(),
        const ShareButton(),
        if (filterButton != null) ...[const Gap(10), filterButton!]
      ])
    ]);
  }
}
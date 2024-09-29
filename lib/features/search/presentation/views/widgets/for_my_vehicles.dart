import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class ForMyVehicles extends StatelessWidget {
  const ForMyVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: AppColors.whiteColor2),
        child: Row(children: [
          Text(StringManager.forMyVehicles.tr(context)),
          const Spacer(),
          const Icon(Icons.arrow_forward)
        ]));
  }
}
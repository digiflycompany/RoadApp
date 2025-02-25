import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/helpers/string_manager.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class WorkSectionScreen extends StatelessWidget {
  const WorkSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(text: StringManager.workReports.tr(context))),
      body: Column(
        children: [
          Container(
            height: 48.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: Text(
                StringManager.workReports.tr(context),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 48.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: Text(
                StringManager.workReports.tr(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

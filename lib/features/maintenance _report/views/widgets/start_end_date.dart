import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

import '../../../../core/helpers/string_manager.dart';
import '../../../work_reports/presentation/views/widgets/date_widget.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class StartEndDate extends StatelessWidget {
  const StartEndDate({super.key, this.filterButton, required this.id});

  final Widget? filterButton;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
      builder: (context, state) {
        var cubit = MaintenanceReportCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.processDate.tr(context),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${StringManager.from.tr(context)}: '),
                SizedBox(width: 5.w),
                // Start Date
                SelectDateWidget(
                  title:
                  "${cubit.startDateTime.year} / ${cubit.startDateTime.month} / ${cubit.startDateTime.day}",
                  onTap: () => cubit.pickStartDate(context,id),
                ),
                SizedBox(width: 16.w),
                Text('${StringManager.to.tr(context)}: '),
                SizedBox(width: 5.w),
                // End Date
                SelectDateWidget(
                  title:
                  "${cubit.endDateTime.year} / ${cubit.endDateTime.month} / ${cubit.endDateTime.day}",
                  onTap: () => cubit.pickEndDate(context,id),
                ),
                const Spacer(),

              ],
            ),
          ],
        );
      },
    );
  }
}

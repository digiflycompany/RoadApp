import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/share_button.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

class ProcessDateStartAndEnd extends StatelessWidget {
  const ProcessDateStartAndEnd({super.key, this.filterButton});

  final Widget? filterButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkReportsCubit, WorkReportsState>(
      builder: (context, state) {
        var cubit = WorkReportsCubit.get(context);
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
                  onTap: () => cubit.pickupStartDate(context),
                ),
                SizedBox(width: 16.w),
                Text('${StringManager.to.tr(context)}: '),
                SizedBox(width: 5.w),
                // End Date
                SelectDateWidget(
                  title:
                      "${cubit.endDateTime.year} / ${cubit.endDateTime.month} / ${cubit.endDateTime.day}",
                  onTap: () => cubit.pickupEndDate(context),
                ),
                const Spacer(),
                const ShareButton(),
                if (filterButton != null) ...[const Gap(10), filterButton!]
              ],
            ),
          ],
        );
      },
    );
  }
}

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
    this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 40.h,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFF9F9F9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFAAAAAA),
                ),
              ),
              // SvgPicture.asset(AppAssets.calenderIcon,
              //     width: 12.w, height: 12.h)
            ],
          ),
        ),
      ),
    );
  }
}

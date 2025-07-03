import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/work_reports_screen.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/helpers/navigation/navigation.dart';
import '../../../../../core/helpers/string_manager.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../cubit/work_reports_cubit.dart';
import 'full_scan_report_screen.dart';

class WorkSectionScreen extends StatelessWidget {
  const WorkSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(text: StringManager.workReports.tr(context))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 30,
            ),
            BlocBuilder<WorkReportsCubit, WorkReportsState>(
              builder: (context, state) {
                var cubit = WorkReportsCubit.get(context);
                return GestureDetector(
                  onTap: () {
                    cubit.fetchWorkReports();
                    AppNavigation.navigate(const WorkReportsScreen());
                  },
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.yellowColor,
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Center(
                      child: Text(
                        StringManager.salesReport.tr(context),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: (){
                AppNavigation.navigate(const FullScanReportsScreen());

              },
              child: Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(4.r)),
                child: Center(
                  child: Text(
                    StringManager.servicesReport.tr(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

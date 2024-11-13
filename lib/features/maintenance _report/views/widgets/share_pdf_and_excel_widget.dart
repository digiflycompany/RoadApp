import 'package:flutter/material.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';
import '../../data/models/list_reports_model.dart';

class SharePdfAndExcelWidget extends StatelessWidget {
  const SharePdfAndExcelWidget({
    super.key,
    required this.cubit,
    required this.reports,
  });

  final MaintenanceReportCubit cubit;
  final List<Report> reports;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => cubit
              .shareReportsAsPdf(reports),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius:
              BorderRadius.circular(12),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                'PDF',
                style: Styles.textStyle14
                    .copyWith(
                  color:
                  AppColors.black,

                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () => cubit
              .shareReportsAsExcel(reports),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius:
              BorderRadius.circular(12),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                'Excel',
                style: Styles.textStyle14
                    .copyWith(
                    color:
                    AppColors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

import '../../../../../core/Theming/styles.dart';
import '../../../../../core/theming/colors.dart';


class SharePdfAndExcelWorkReportsWidget extends StatelessWidget {
  const SharePdfAndExcelWorkReportsWidget({
    super.key,
    required this.cubit,
  });

  final WorkReportsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => cubit
              .shareCsvAsPagedPdf(),
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
              .shareCsvAsExcel(),
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

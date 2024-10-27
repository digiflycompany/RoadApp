import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/share_option.dart';

class ReportFormat extends StatelessWidget {
  const ReportFormat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
        builder: (context, state) {
      var cubit = MaintenanceReportCubit.get(context);
      return Column(children: [
        Divider(height: 50, thickness: 0.5.w, color: AppColors.greyColor),
        Text(StringManager.format.tr(context),
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
        SizedBox(height: 20.h),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () => cubit.setExcel(),
            child: Container(
                decoration: BoxDecoration(
                    color:
                        cubit.excel ? AppColors.greyColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ShareOption(
                    icon: AppAssets.excelIcon,
                    label: StringManager.excel.tr(context))),
          ),
          InkWell(
              onTap: () => cubit.setPDF(),
              child: Container(
                  decoration: BoxDecoration(
                      color: !cubit.excel
                          ? AppColors.greyColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ShareOption(
                      icon: AppAssets.pdfIcon,
                      label: StringManager.pdf.tr(context))))
        ])
      ]);
    });
  }
}
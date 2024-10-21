import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/second_filter_row.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';

class Diagram2ndFilter extends StatelessWidget {
  const Diagram2ndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MaintenanceReportCubit.get(context);
    return StatefulBuilder(builder: (ctxx, setState) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        SecondFilterRow(
            month1: StringManager.jan.tr(context),
            month2: StringManager.feb.tr(context),
            is1Checked: cubit.jan,
            is2Checked: cubit.feb),
        SecondFilterRow(
            month1: StringManager.mar.tr(context),
            month2: StringManager.apr.tr(context),
            is1Checked: cubit.mar,
            is2Checked: cubit.apr),
        SecondFilterRow(
            month1: StringManager.may.tr(context),
            month2: StringManager.jun.tr(context),
            is1Checked: cubit.may,
            is2Checked: cubit.jun),
        SecondFilterRow(
            month1: StringManager.jul.tr(context),
            month2: StringManager.aug.tr(context),
            is1Checked: cubit.jul,
            is2Checked: cubit.aug),
        SecondFilterRow(
            month1: StringManager.sep.tr(context),
            month2: StringManager.oct.tr(context),
            is1Checked: cubit.sep,
            is2Checked: cubit.oct),
        SecondFilterRow(
            month1: StringManager.nov.tr(context),
            month2: StringManager.dec.tr(context),
            is1Checked: cubit.nov,
            is2Checked: cubit.dec),
        CustomElevatedButton(
            onTap: () {
              Navigator.pop(context);
            },
            widget: Text(StringManager.select.tr(context),
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)))
      ]);
    });
  }
}
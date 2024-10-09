import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';

class FilterCheckOption extends StatelessWidget {
  const FilterCheckOption({super.key, required this.text, required this.value});

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: BlocBuilder<MaintenanceReportCubit, MaintenanceReportStates>(
            builder: (context, state) {
          var cubit = MaintenanceReportCubit.get(context);
          return CheckboxListTile(
              title: Text(text,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.black,
              fillColor: const WidgetStatePropertyAll(AppColors.whiteColor),
              contentPadding: EdgeInsets.zero,
              value: value,
              onChanged: (val) => cubit.toggleFilterCheck(text, context));
        }));
  }
}
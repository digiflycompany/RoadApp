import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/vehicles/presentation/widgets/filter_check_option.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20.w,
        child: GestureDetector(
            onTap: () {
              showCustomAlertDialog(
                  context: context,
                  title: StringManager.filterBy.tr(context),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    BlocBuilder<MaintenanceReportCubit,
                        MaintenanceReportStates>(
                      builder: (context, state) {
                        var cubit = MaintenanceReportCubit.get(context);
                        List<Widget> boxes = [
                          FilterCheckOption(
                              text: StringManager.date.tr(context),
                              value: cubit.checkBoxDate),
                          FilterCheckOption(
                              text: StringManager.service.tr(context),
                              value: cubit.checkBoxService),
                          FilterCheckOption(
                              text: StringManager.price.tr(context),
                              value: cubit.checkBoxPrice),
                          FilterCheckOption(
                              text: StringManager.center.tr(context),
                              value: cubit.checkBoxCenter),
                          FilterCheckOption(
                              text: StringManager.product.tr(context),
                              value: cubit.checkBoxProduct)
                        ];
                        return Wrap(children: boxes);
                      }
                    ),
                    CustomElevatedButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        widget: Text(StringManager.select.tr(context),
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w600)))
                  ]));
            },
            child: SvgPicture.asset(AppAssets.filterIcon, width: 20.w)));
  }
}

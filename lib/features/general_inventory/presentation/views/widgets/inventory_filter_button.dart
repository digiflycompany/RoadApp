import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/filter_option.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';

class InventoryFilterButton extends StatelessWidget {
  const InventoryFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showCustomAlertDialog(
              context: context,
              title: StringManager.filterBy.tr(context),
              content: BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                var cubit = InventoryCubit.get(context);
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    FilterOption(
                        text: StringManager.allClasses.tr(context),
                        value: cubit.allClasses,
                        onChanged: (val) =>
                            cubit.changeCheckBox(val!, 'allClasses')),
                    FilterOption(
                        text: 'صنف 1',
                        value: cubit.class1,
                        onChanged: (val) =>
                            cubit.changeCheckBox(val!, 'class1'))
                  ]),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    FilterOption(
                        text: 'صنف 2',
                        value: cubit.class2,
                        onChanged: (val) =>
                            cubit.changeCheckBox(val!, 'class2')),
                    FilterOption(
                        text: 'صنف 3',
                        value: cubit.class3,
                        onChanged: (val) =>
                            cubit.changeCheckBox(val!, 'class3'))
                  ]),
                  CustomElevatedButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      widget: Text(StringManager.select.tr(context),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w600)))
                ]);
              }));
        },
        child: SvgPicture.asset(AppAssets.settingIcon, width: 27.w));
  }
}
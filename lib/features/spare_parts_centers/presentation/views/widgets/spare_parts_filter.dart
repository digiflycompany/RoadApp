import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/filter_option.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_state.dart';

class SparePartsFilter extends StatelessWidget {
  const SparePartsFilter({super.key, required this.typeId});

  final String typeId;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IconButton(
          onPressed: () {
            showCustomAlertDialog(
                context: context,
                title: StringManager.filterBy.tr(context),
                content: BlocBuilder<SparePartsCubit, SparePartsState>(
                    builder: (context, state) {
                      var cubit = SparePartsCubit.get(context);
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          FilterOption(
                              text: StringManager.mostAffordable.tr(context),
                              value: cubit.mostAffordable,
                               onChanged: (val) {
                              debugPrint("affordable : $val");
                              cubit.changeCheckBox(val!, 'affordable');
                              // Navigator.pop(context);
                              }),
                          // FilterOption(
                          //     text: StringManager.closest.tr(context),
                          //     value: cubit.nearestCheckbox,
                          //     onChanged: (val) =>
                          //         cubit.changeCheckBox(val!, 'closest'))
                        ]),
                        FilterOption(
                            text: StringManager.highestRated.tr(context),
                            value: cubit.mostRatedCheckbox,
                            onChanged: (val) =>
                                cubit.changeCheckBox(val!, 'highest')),
                        CustomElevatedButton(
                            onTap: () {
                              cubit.currentPage = 1;

                              cubit.getSparePartsCenter(
                                  typeId: typeId,
                              );
                              Navigator.pop(context);
                            },
                            widget: Text(StringManager.select.tr(context),
                                style: TextStyle(
                                    fontSize: 10.sp, fontWeight: FontWeight.w600)))
                      ]);
                    }));
          },
          icon: const Icon(EvaIcons.options2Outline))
    ]);
  }
}

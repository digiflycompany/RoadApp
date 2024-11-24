import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/filter_option.dart';
import 'package:roadapp/features/maintenance_centers/presentation/cubit/maintenance_cubit.dart';
import 'package:roadapp/features/maintenance_centers/presentation/cubit/maintenance_state.dart';

import '../screens/maintenance_centers.dart';

class MaintenanceFilter extends StatelessWidget {
  const MaintenanceFilter({
    super.key,
    required this.brandId,
    required this.typeId,
  });

  final String brandId;
  final String typeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              showCustomAlertDialog(
                context: context,
                title: StringManager.filterBy.tr(context),
                content: BlocBuilder<MaintenanceCubit, MaintenanceState>(
                  builder: (context, state) {
                    var cubit = MaintenanceCubit.get(context);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                          ],
                        ),
                        FilterOption(
                            text: StringManager.highestRated.tr(context),
                            value: cubit.mostRatedCheckbox,
                            onChanged: (val) {
                              cubit.changeCheckBox(val!, 'highest');
                              //Navigator.pop(context);
                            }),
                        state is GetMaintenanceCenterLoading
                            ? const CircularProgressIndicator()
                            : CustomElevatedButton(
                                onTap: () {
                                  cubit.currentPage = 1;
                                  // AppNavigation.navigateReplacement(
                                  //     MaintenanceCenters(
                                  //   brandId: brandId,
                                  //   typeId: typeId,
                                  // ));

                                  cubit.getMaintenanceCenter(
                                      brandId: brandId, typeId: typeId);

                                  Navigator.pop(context);
                                },
                                widget: Text(
                                  StringManager.select.tr(context),
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                      ],
                    );
                  },
                ),
              );
            },
            icon: const Icon(EvaIcons.options2Outline)),
      ],
    );
  }
}

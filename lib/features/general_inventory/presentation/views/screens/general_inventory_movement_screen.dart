import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/core/widgets/process_date.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/states.dart';
import 'package:roadapp/features/general_inventory/presentation/views/widgets/add_to_inventory_button.dart';
import 'package:roadapp/features/general_inventory/presentation/views/widgets/inventory_filter_button.dart';

class GeneralInventoryMovementScreen extends StatelessWidget {
  const GeneralInventoryMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> rows = const [
      '1',
      'أحمد نبيل',
      '100',
      '100',
      '100',
      '100',
      '100'
    ];
    List<String> columns = [
      StringManager.s.tr(context),
      StringManager.className.tr(context),
      StringManager.supplier.tr(context),
      StringManager.firstCredit.tr(context),
      StringManager.import.tr(context),
      StringManager.export.tr(context),
      StringManager.lastCredit.tr(context)
    ];
    return BlocProvider(
        create: (context) => CalendarCubit(),
        child: BlocConsumer<CalendarCubit, CalendarState>(
            listener: (BuildContext context, CalendarState state) {},
            builder: (BuildContext context, CalendarState state) {
              return Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.generalInventoryMovement
                              .tr(context))),
                  body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProcessDate(
                                filterButton: InventoryFilterButton()),
                            SizedBox(height: 25.h),
                            CustomDataTable(
                                rows: rows,
                                columns: columns,
                                footer: StringManager.creditsTillReportDate
                                    .tr(context)),
                            SizedBox(height: 25.h),
                            const AddToInventoryButton(),
                            SizedBox(height: 35.h)
                          ])));
            }));
  }
}
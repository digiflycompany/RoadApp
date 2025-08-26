import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/core/widgets/process_date.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_state.dart';
import 'package:roadapp/features/general_inventory/presentation/views/widgets/inventory_filter_button.dart';

class GeneralInventoryMovementScreen extends StatelessWidget {
  const GeneralInventoryMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        List<String> columns = [
          StringManager.s.tr(context),
          StringManager.className.tr(context),
          StringManager.supplier.tr(context),
          StringManager.firstCredit.tr(context),
          StringManager.import.tr(context),
          StringManager.export.tr(context),
          StringManager.lastCredit.tr(context)
        ];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
              text: StringManager.generalInventoryMovement.tr(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProcessDate(filterButton: InventoryFilterButton()),
                SizedBox(height: 25.h),

                ///-------------------- LOADING STATE --------------------///
                state is InventoryLoadingState
                    ? const Center(child: CircularProgressIndicator())

                    ///-------------------- SUCCESS STATE --------------------///
                    : (state is InventorySuccessState &&
                            state.inventoryRecord != null &&
                            state.inventoryRecord!.isNotEmpty)

                        ///-------------------- LIST IS NOT EMPTY & NOT NULL --------------------///
                        ? CustomMultiRowsTable(
                            columns: columns,
                            rows: state.inventoryRecord!
                                .asMap()
                                .entries
                                .map((entry) {
                              int index = entry.key;
                              var record = entry.value;
                              return [
                                (index + 1).toString(),
                                record.product?.name ?? '-',
                                record.supplierName != null
                                ? record.supplierName!
                                    : record.supplierId != null
                                        ? record.supplierId!.name ?? '-'
                                        : '-',
                                // record.supplierName ??
                                // record.supplierId != null? "-":record.supplierId!.name ??
                                //     '-',
                                record.quantityBefore?.toString() ?? '-',
                                record.change! > 0
                                    ? record.change.toString()
                                    : "0", //وارد+
                                record.change! < 0
                                    ? record.change!.abs().toString()
                                    : '0', // منصرف-
                                record.quantityAfter?.toString() ?? '-',
                              ];
                            }).toList(),
                          )

                        ///-------------------- LIST IS  EMPTY OR  NULL --------------------///
                        : (state is InventorySuccessState &&
                                (state.inventoryRecord == null ||
                                    state.inventoryRecord!.isEmpty))
                            ? Center(
                                child: Text(
                                  StringManager.youHaveNoInventoriesYet
                                      .tr(context),
                                ),
                              )

                            ///-------------------- ERROR STATE --------------------///
                            : state is InventoryErrorState
                                ? Center(
                                    child: Text(
                                      state.error,
                                      style: Styles.textStyle16,
                                    ),
                                  )

                                ///-------------------- LOADING MORE STATE --------------------///
                                : state is LoadingMoreState
                                    ? const CustomLoadingIndicator(
                                        width: double.infinity,
                                        height: 60,
                                      )
                                    : SizedBox(height: 25.h),
                // const AddToInventoryButton(),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

import '../cubit/customers_reports_cubit.dart';

class CustomerInfoTable extends StatelessWidget {
  const CustomerInfoTable({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.car.tr(context),
      StringManager.manufactureYear.tr(context),
      StringManager.transmissionType.tr(context),
      StringManager.licensePlateNumber.tr(context),
    ];

    return BlocBuilder<CustomersReportsCubit, CustomersReportsState>(
      builder: (context, state) {
        if (state is VehiclesIdLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VehiclesIdSuccessState) {
          final vehicles = context.read<CustomersReportsCubit>().vehicles ?? [];

          if (vehicles.isEmpty) {
            return const Center(child: Text("لا توجد مركبات متاحة."));
          }

          return FittedBox(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Colors.black),
                  columnSpacing: 18.w,
                  columns: [
                    DataColumn(
                        label: Text(columns[0],
                            style: const TextStyle(color: AppColors.tertiary))),
                    DataColumn(
                        label: Text(columns[1],
                            style: const TextStyle(color: AppColors.tertiary))),
                    DataColumn(
                        label: Center(
                            child: Text(columns[2],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.tertiary)))),
                    DataColumn(
                        label: Center(
                            child: Text(columns[3],
                                style: const TextStyle(
                                    color: AppColors.tertiary)))),
                    DataColumn(
                        label: Text(columns[4],
                            style: const TextStyle(color: AppColors.tertiary))),
                    const DataColumn(label: Text("")),
                  ],
                  rows: vehicles.map((vehicle) {
                    return DataRow(
                      color: WidgetStateProperty.all(
                        vehicles.indexOf(vehicle) % 2 == 0
                            ? AppColors.primaryColor.withOpacity(0.27)
                            : Colors.transparent,
                      ),
                      cells: [
                        DataCell(Text((vehicles.indexOf(vehicle) + 1).toString())),
                        DataCell(Text(vehicle.model ?? "غير معروف")),
                        DataCell(Text(vehicle.manufacturingYear?.toString() ?? "غير متو[فر")),
                        DataCell(Text(vehicle.gearShiftType ?? "غير متوفر")),
                        DataCell(Text(vehicle.plateNumber ?? "غير متوفر")),
                        const DataCell(Icon(Icons.more_vert_outlined)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (state is VehiclesIdErrorState) {
          return Center(child: Text("حدث خطأ: ${state.error}"));
        }

        return const SizedBox(); // Placeholder if state is not handled
      },
    );
  }
}
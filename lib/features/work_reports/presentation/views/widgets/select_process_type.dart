import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

class SelectProcessType extends StatelessWidget {
  const SelectProcessType({super.key, required this.bonds});

  final bool bonds;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringManager.processType.tr(context),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        BlocBuilder<WorkReportsCubit, WorkReportsState>(
          builder: (context, state) {
            var cubit = WorkReportsCubit.get(context);
            return Wrap(
              spacing: 4,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 1)),
                    Text(
                        bonds
                            ? StringManager.receipt.tr(context)
                            : StringManager.examinationRequest.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 2,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 2)),
                    Text(
                        bonds
                            ? StringManager.paymentVoucher.tr(context)
                            : StringManager.maintenanceRequest.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 3,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 3)),
                    Text(
                        bonds
                            ? StringManager.salesBill.tr(context)
                            : StringManager.servicesBill.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                )
              ],
            );
          },
        )
      ],
    );
  }
}

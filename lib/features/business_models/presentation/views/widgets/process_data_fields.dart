import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/process_data_field.dart';

class ProcessDataFields extends StatelessWidget {
  const ProcessDataFields({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height * .14,
        child: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
            builder: (context, state) {
          var cubit = BusinessModelsCubit.get(context);
          return GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
              childAspectRatio: 4,
              children: [
                Text(
                    cubit.selectedRadio == 1
                        ? '${StringManager.billNumber.tr(context)}:'
                        : '${StringManager.bondNumber.tr(context)}:',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                const ProcessDataField(),
                Text(
                    cubit.selectedRadio == 1
                        ? '${StringManager.billDate.tr(context)}:'
                        : '${StringManager.bondDate.tr(context)}:',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                const ProcessDataField(),
                Text(
                    cubit.selectedRadio == 2
                        ? '${StringManager.supplierName.tr(context)}:'
                        : '${StringManager.clientName.tr(context)}:',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                const ProcessDataField(),
                Text(
                    cubit.selectedRadio == 2
                        ? '${StringManager.supplierCode.tr(context)}: '
                        : '${StringManager.clientCode.tr(context)}: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                const ProcessDataField(),
                Text(
                    cubit.selectedRadio == 3
                        ? '${StringManager.billType.tr(context)}: '
                        : '${StringManager.bondType.tr(context)}: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                const ProcessDataField()
              ]);
        }));
  }
}